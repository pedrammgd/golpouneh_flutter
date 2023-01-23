class SurveyQuestions {
  Set<String>? questions;
  List<String>? answerText;
  List<String>? surveyQuestionsHeaderId;
  List<String>? surveyQuestionId;
  List<String>? id;

  SurveyQuestions(
      {this.answerText,
      this.questions,
      this.surveyQuestionId,
      this.surveyQuestionsHeaderId,
        this.id
      });

  factory SurveyQuestions.fromJson(Map<String, dynamic> json) {
    List<String> listQuestion = (json["Result"]["surveyQuestionsAnswers"] as List).map((e) {
      return e["SurveyQuestion"]["QuestionText"].toString();
    }).toList();
    List<String> listAnswerText = (json["Result"]["surveyQuestionsAnswers"] as List).map((e) {
      return e["AnswerText"].toString();
    }).toList();
    List<String> listQuestionHeaderId = (json["Result"]["surveyQuestionsAnswers"] as List).map((e) {
      return e["SurveyQuestionsHeaderId"].toString();
    }).toList();
    List<String> listQuestionId = (json["Result"]["surveyQuestionsAnswers"] as List).map((e) {
      return e["SurveyQuestionId"].toString();
    }).toList();
    List<String> listId = (json["Result"]["surveyQuestionsAnswers"] as List).map((e) {
      return e["Id"].toString();
    }).toList();
    Set<String> setList = {...listQuestion};
    return SurveyQuestions(
        questions: setList,
        surveyQuestionId: listQuestionId,
        surveyQuestionsHeaderId: listQuestionHeaderId,
        answerText: listAnswerText,
    id: listId);
  }
}
