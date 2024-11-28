import 'types.dart';

typedef UseCaseReturnType<T> = Future<FailureOr<T>>;

abstract class UseCase<Type, Params> {
  UseCaseReturnType<Type> call(Params params);
}
