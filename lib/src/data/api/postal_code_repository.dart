import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:user_management/src/models/postal_code_model.dart';

part 'postal_code_repository.g.dart';

//base url
const String baseUrl = 'http://kodpocztowy.intami.pl';

@RestApi(baseUrl: baseUrl)
abstract class PostalCodeRepository {
  factory PostalCodeRepository(Dio dio, {String baseUrl}) =
      _PostalCodeRepository;

  @GET('/api/{code}')
  Future<List<PostalCodeModel>> getPostalCodes(
    @Path('code') String code,
  );
}
