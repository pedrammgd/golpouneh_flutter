import 'dart:convert';
import 'package:gol_pouneh/models/total_score.dart';
import 'package:http/http.dart';
import '../models/details_of_score.dart';
import '../shared/converter.dart';
import '../shared/url.dart';

class ScoreService {
  Future<TotalScore> setTotalUserScore(String userId) async {
    final response = await post(
        Uri.parse('${setPointForRepresntativeUrl}UserWalletPoint'),
        body: {'userId': userId});
    if (response.statusCode == 200) {
      var responseBody = json.decode(utf8convert(response.body));
      return TotalScore.fromJson(responseBody);
    } else {
      return TotalScore(httpStatusCode: '');
    }
  }

  Future<DetailsOfScore> setListOfUserScore(String userId) async {
    final response = await post(
        Uri.parse('${setPointForRepresntativeUrl}CustomerClubUserPoint'),
        body: {'userId': userId});
    if (response.statusCode == 200) {
      var responseBody = json.decode(utf8convert(response.body));
      return DetailsOfScore.fromJson(responseBody);
    } else {
      return DetailsOfScore();
    }
  }


}
