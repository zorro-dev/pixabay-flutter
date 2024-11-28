import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pixabay_flutter/core/domain/error/failures.dart';
import 'package:pixabay_flutter/core/domain/models/pagination_list_model.dart';
import 'package:pixabay_flutter/features/pixabay/core/domain/models/pixabay_image_model.dart';
import 'package:pixabay_flutter/features/pixabay/core/domain/usecases/get_pixabay_images_usecase.dart';

part 'discover_bloc.freezed.dart';

@injectable
class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  final GetPixabayImagesUsecase getPixabayItemsUsecase;

  DiscoverBloc(
    this.getPixabayItemsUsecase,
  ) : super(const DiscoverState()) {
    on<InitDiscoverEvent>(_init);
    on<FetchDiscoverEvent>(_fetch);
  }

  _init(InitDiscoverEvent event, Emitter<DiscoverState> emit) {
    add(const FetchDiscoverEvent());
  }

  _fetch(FetchDiscoverEvent event, Emitter<DiscoverState> emit) async {
    if (event.reload) {
      emit(state.copyWith(images: const PaginationListModel.pure()));
    }

    if (!state.images.shouldPaginate) return;

    emit(state.copyWith(images: state.images.copyWith(status: PaginationListStatus.loading)));

    final params = ParamsGetPixabayImages(
      page: state.images.page,
      limit: state.images.perPage,
    );
    (await getPixabayItemsUsecase(params)).fold(
      (l) {
        emit(state.copyWith(
          images: state.images.copyWith(status: PaginationListStatus.error),
        ));

        if (state.images.status == PaginationListStatus.initial) {
          emit(state.copyWith(status: DiscoverStatus.error, failure: l));
        }
      },
      (r) => emit(state.copyWith(
          status: DiscoverStatus.display,
          images: state.images.copyWith(
            status: PaginationListStatus.display,
            items: [...state.images.items, ...r.hits],
            page: state.images.page + 1,
            total: r.total,
          ))),
    );
  }
}

@freezed
class DiscoverEvent with _$DiscoverEvent {
  const factory DiscoverEvent.init() = InitDiscoverEvent;

  const factory DiscoverEvent.fetch({@Default(false) bool reload}) = FetchDiscoverEvent;
}

enum DiscoverStatus { loading, display, error }

@freezed
class DiscoverState with _$DiscoverState {
  const factory DiscoverState({
    @Default(DiscoverStatus.loading) DiscoverStatus status,
    @Default(PaginationListModel.pure()) PaginationListModel<PixabayImageModel> images,
    Failure? failure,
  }) = _DiscoverState;
}
