import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pixabay_flutter/core/domain/error/failures.dart';
import 'package:pixabay_flutter/core/domain/models/pagination_list_model.dart';
import 'package:pixabay_flutter/features/pixabay/core/domain/models/pixabay_image_model.dart';
import 'package:pixabay_flutter/features/pixabay/core/domain/usecases/search_pixabay_images_usecase.dart';
import 'package:bloc_event_transformers/bloc_event_transformers.dart';

part 'pixabay_search_bloc.freezed.dart';

@injectable
class PixabaySearchBloc extends Bloc<PixabaySearchEvent, PixabaySearchState> {
  final SearchPixabayImagesUsecase searchPixabayImagesUsecase;

  PixabaySearchBloc(
    this.searchPixabayImagesUsecase,
  ) : super(const PixabaySearchState()) {
    on<InitPixabaySearchEvent>(_init);
    on<FetchPixabaySearchEvent>(_fetch);
    on<QueryUpdatedPixabaySearchEvent>(
      _queryUpdated,
      transformer: debounce(const Duration(milliseconds: 300)),
    );
  }

  _init(InitPixabaySearchEvent event, Emitter<PixabaySearchState> emit) {}

  _fetch(FetchPixabaySearchEvent event, Emitter<PixabaySearchState> emit) async {
    if (event.reload) {
      emit(state.copyWith(images: const PaginationListModel.pure()));
    }

    final query = state.query;

    if (state.query.isEmpty) return;
    if (!state.images.shouldPaginate) return;

    emit(state.copyWith(images: state.images.copyWith(status: PaginationListStatus.loading)));

    final params = ParamsSearchPixabayImages(
      query: state.query,
      page: state.images.page,
      limit: state.images.perPage,
    );

    (await searchPixabayImagesUsecase(params)).fold(
      (l) {
        if (query != state.query) return;

        emit(state.copyWith(
          images: state.images.copyWith(status: PaginationListStatus.error),
        ));

        if (state.images.status == PaginationListStatus.initial) {
          emit(state.copyWith(status: PixabaySearchStatus.error, failure: l));
        }
      },
      (r) {
        if (query != state.query) return;

        emit(state.copyWith(
          status: PixabaySearchStatus.display,
          images: state.images.copyWith(
            status: PaginationListStatus.display,
            items: [...state.images.items, ...r.hits],
            page: state.images.page + 1,
            total: r.total,
          )));
      },
    );
  }

  _queryUpdated(QueryUpdatedPixabaySearchEvent event, Emitter<PixabaySearchState> emit) {
    emit(state.copyWith(query: event.query));

    add(const PixabaySearchEvent.fetch(reload: true));
  }
}

@freezed
class PixabaySearchEvent with _$PixabaySearchEvent {
  const factory PixabaySearchEvent.init() = InitPixabaySearchEvent;

  const factory PixabaySearchEvent.fetch({@Default(false) bool reload}) = FetchPixabaySearchEvent;

  const factory PixabaySearchEvent.queryUpdated(String query) = QueryUpdatedPixabaySearchEvent;
}

enum PixabaySearchStatus { loading, display, error, success }

@freezed
class PixabaySearchState with _$PixabaySearchState {
  const factory PixabaySearchState({
    @Default(PixabaySearchStatus.display) PixabaySearchStatus status,
    @Default(PaginationListModel.pure()) PaginationListModel<PixabayImageModel> images,
    @Default("") String query,
    Failure? failure,
  }) = _PixabaySearchState;
}
