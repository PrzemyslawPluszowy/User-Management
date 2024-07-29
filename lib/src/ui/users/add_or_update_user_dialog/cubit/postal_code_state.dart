part of 'postal_code_cubit.dart';

@freezed
class PostalCodeState with _$PostalCodeState {
  const factory PostalCodeState.initial() = _Initial;
  const factory PostalCodeState.loading() = _Loading;
  const factory PostalCodeState.success({
    required List<PostalCodeModel> postalCode,
  }) = _Success;
  const factory PostalCodeState.error() = _Error;
  const factory PostalCodeState.noToManyAttempts() = _NoToManyAttemps;
}
