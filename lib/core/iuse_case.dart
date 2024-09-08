abstract class IUseCase<Params, Result> {
  Result execute(Params params);
}
