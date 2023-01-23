import 'dart:convert';
import 'package:gol_pouneh/models/survey.dart';
import 'package:gol_pouneh/shared/data_memory.dart';
import 'package:gol_pouneh/shared/url.dart';
import 'package:http/http.dart';

class SurveyService{
  Future<SurveyQuestions> questions()async{
    final uri = Uri.parse('${apiUrl}Survey/Survey/GetSurveyQuestionSurveyById');
    var request =  MultipartRequest('POST', uri);

    request.fields["userId"] = DataMemory.userId;
    request.fields["id"] = "1";
    final response = await request.send();

    final respStr = await response.stream.bytesToString();
    Map<String, dynamic> data =  Map<String, dynamic>.from(json.decode(respStr));
    if(data["HttpStatusCode"] == "200" && data["Result"]["surveyQuestionsAnswers"] != null && (data["Result"]["surveyQuestionsAnswers"] as List).isNotEmpty){
      return SurveyQuestions.fromJson(data);
    }else {
      return SurveyQuestions(questions: null);
    }
  }
  Future<bool> sendAnswers(SurveyQuestions surveyQuestions, List<int> answers) async {
    // final uri = Uri.parse('${apiUrl}Survey/Survey/ConfirmSurvey');
    // var request =  MultipartRequest('POST', uri);
    jsonEncode({
      "saleFactorId": DataMemory.factorId.toString(),
      "surveyQuestionsAnswers": [
        {
          "SurveyQuestionsHeaderId": surveyQuestions.surveyQuestionsHeaderId![0],
          "SurveyQuestionId": surveyQuestions.surveyQuestionId![0],
          "SelectedOption": answers[0],
          "AnswerText": null,
          "Id": surveyQuestions.id![0],
        },
        {
          "SurveyQuestionsHeaderId": surveyQuestions.surveyQuestionsHeaderId![1],
          "SurveyQuestionId": surveyQuestions.surveyQuestionId![1],
          "SelectedOption": answers[1],
          "AnswerText": null,
          "Id": surveyQuestions.id![1],
        },
        {
          "SurveyQuestionsHeaderId": surveyQuestions.surveyQuestionsHeaderId![2],
          "SurveyQuestionId": surveyQuestions.surveyQuestionId![2],
          "SelectedOption": answers[2],
          "AnswerText": null,
          "Id": surveyQuestions.id![2],
        },
        {
          "SurveyQuestionsHeaderId": surveyQuestions.surveyQuestionsHeaderId![3],
          "SurveyQuestionId": surveyQuestions.surveyQuestionId![3],
          "SelectedOption": answers[3],
          "AnswerText": null,
          "Id": surveyQuestions.id![3],
        }
      ]
    });
    final response = await post(Uri.parse("${apiUrl}Survey/Survey/ConfirmSurvey"), body: jsonEncode({
      "saleFactorId": DataMemory.factorId.toString(),
      "surveyQuestionsAnswers": [
        {
          "SurveyQuestionsHeaderId": surveyQuestions.surveyQuestionsHeaderId![0],
          "SurveyQuestionId": surveyQuestions.surveyQuestionId![0],
          "SelectedOption": answers[0],
          "AnswerText": null,
          "Id": surveyQuestions.id![0],
        },
        {
          "SurveyQuestionsHeaderId": surveyQuestions.surveyQuestionsHeaderId![1],
          "SurveyQuestionId": surveyQuestions.surveyQuestionId![1],
          "SelectedOption": answers[1],
          "AnswerText": null,
          "Id": surveyQuestions.id![1],
        },
        {
          "SurveyQuestionsHeaderId": surveyQuestions.surveyQuestionsHeaderId![2],
          "SurveyQuestionId": surveyQuestions.surveyQuestionId![2],
          "SelectedOption": answers[2],
          "AnswerText": null,
          "Id": surveyQuestions.id![2],
        },
        {
          "SurveyQuestionsHeaderId": surveyQuestions.surveyQuestionsHeaderId![3],
          "SurveyQuestionId": surveyQuestions.surveyQuestionId![3],
          "SelectedOption": answers[3],
          "AnswerText": null,
          "Id": surveyQuestions.id![3],
        }
      ]
    }));

    Map<String, dynamic> data =  Map<String, dynamic>.from(json.decode(response.body));
    if(data["HttpStatusCode"] == "200"){
      return true;
    }else {
      return false;
    }
  }
}