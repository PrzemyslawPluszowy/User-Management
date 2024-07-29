import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_management/src/data/api/postal_code_repository.dart';
import 'package:user_management/src/models/postal_code_model.dart';

part 'postal_code_state.dart';
part 'postal_code_cubit.freezed.dart';

class PostalCodeCubit extends Cubit<PostalCodeState> {
  PostalCodeCubit({
    required this.postalCodeRepository,
  }) : super(const PostalCodeState.initial());

  final PostalCodeRepository postalCodeRepository;

  Future<void> getPostalCode(String code) async {
    if (code.length != 6) {
      emit(const PostalCodeState.initial());
      return;
    }
    emit(const PostalCodeState.loading());
    try {
      final postalCode = await postalCodeRepository.getPostalCodes(code);
      if (postalCode.isEmpty) {
        emit(const PostalCodeState.error());
        return;
      }
      emit(PostalCodeState.success(postalCode: postalCode));
    } on DioException catch (e) {
      if (e.response?.statusCode == 429) {
        emit(const PostalCodeState.noToManyAttempts());
      } else {
        emit(const PostalCodeState.error());
      }
    } catch (e) {
      emit(const PostalCodeState.error());
    }
  }
}
