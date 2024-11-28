import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pixabay_flutter/core/domain/error/failures.dart';
import 'package:pixabay_flutter/features/pixabay/core/domain/models/pixabay_image_model.dart';
import 'package:pixabay_flutter/features/pixabay/core/domain/usecases/get_pixabay_item_usecase.dart';

part 'pixabay_image_details_bloc.freezed.dart';

@injectable
class PixabayImageDetailsBloc extends Bloc<PixabayImageDetailsEvent, PixabayImageDetailsState> {
  final GetPixabayImageUsecase getPixabayImageUsecase;

  PixabayImageDetailsBloc(
    this.getPixabayImageUsecase,
  ) : super(const PixabayImageDetailsState()) {
    on<InitPixabayImageDetailsEvent>(_init);
  }

  _init(InitPixabayImageDetailsEvent event, Emitter<PixabayImageDetailsState> emit) async {
    emit(state.copyWith(itemId: event.id));
    final params = ParamsGetPixabayImage(id: state.itemId);
    (await getPixabayImageUsecase(params)).fold(
      (l) => emit(state.copyWith(status: PixabayImageDetailsStatus.error, failure: l)),
      (r) => emit(state.copyWith(status: PixabayImageDetailsStatus.display, item: r)),
    );
  }
}

@freezed
class PixabayImageDetailsEvent with _$PixabayImageDetailsEvent {
  const factory PixabayImageDetailsEvent.init(int id) = InitPixabayImageDetailsEvent;
}

enum PixabayImageDetailsStatus { loading, display, error }

@freezed
class PixabayImageDetailsState with _$PixabayImageDetailsState {
  const factory PixabayImageDetailsState({
    @Default(PixabayImageDetailsStatus.loading) PixabayImageDetailsStatus status,
    @Default(0) int itemId,
    PixabayImageModel? item,
    Failure? failure,
  }) = _PixabayImageDetailsState;
}
