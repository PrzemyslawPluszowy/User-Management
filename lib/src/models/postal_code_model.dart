import 'package:freezed_annotation/freezed_annotation.dart';

part 'postal_code_model.freezed.dart';
part 'postal_code_model.g.dart';

@freezed
abstract class PostalCodeModel with _$PostalCodeModel {
  factory PostalCodeModel({
    required String miejscowosc,
    required String wojewodztwo,
    @Default('') String? ulica,
    @Default('') String? numer,
  }) = _PostalCodeModel;
  factory PostalCodeModel.fromJson(Map<String, dynamic> json) =>
      _$PostalCodeModelFromJson(json);
}











///example from doc



// kod	kod pocztowy w formacie xxx-xxx	zawsze
// nazwa	nazwa jednostki	występuje dla jednostek,
// którym przydzielono indywidualny kod pocztowy
// miejscowość	nazwa miejscowości	zawsze
// ulica	uilca	opcjonalnie
// numer	numer budynku	występuje dla jednostek, 
//którym przydzielono indywidualny kod pocztowy
// numeracja	opis numeracji	opcjonalnie
// gmina	gmina	zawsze
// powiat	powiat	zawsze
// dzielnica	dzielnica miasta	opcjonalnie



//  [{
//     "kod": "31-985",
//     "miejscowosc": "Kraków",
//     "ulica": "Zaporębie",
//     "gmina": "Kraków",
//     "powiat": "Kraków",
//     "wojewodztwo": "małopolskie",
//     "dzielnica": "Kraków-Nowa Huta",
//     "numeracja": []
//   },
//   {
//     "kod": "31-985",
//     "miejscowosc": "Kraków",
//     "ulica": "Żółwia",
//     "gmina": "Kraków",
//     "powiat": "Kraków",
//     "wojewodztwo": "małopolskie",
//     "dzielnica": "Kraków-Nowa Huta",
//     "numeracja": []
//   }
// ]
