class Test {
  List<String> audioUrls;
  String allowBackspace;
  int allowHighlight;
  String attendStatus;
  int duration;
  String endDatetime;
  String highlightType;
  bool isAttempted;
  bool isAvailable;
  String language;
  int maximumMarks;
  dynamic minimumAccuracy;
  int minimumPassingMarks;
  int minimumSpeed;
  int minimumWords;
  String paragraph;
  String resultType;
  String serverTime;
  String slug;
  String startDatetime;
  String targetExam;
  String targetExamCode;
  int testId;
  String testName;
  String type;
  int wordCount;

  Test.fromJson(Map<String, dynamic> json)
      : audioUrls = List<String>.from(json["Audio Urls"]),
        allowBackspace = json["allow_backspace"],
        allowHighlight = json["allow_highlight"],
        attendStatus = json["attend_status"],
        duration = json["duration"],
        endDatetime = json["end_datetime"],
        highlightType = json["highlight_type"],
        isAttempted = json["is_attempted"],
        isAvailable = json["is_available"],
        language = json["language"],
        maximumMarks = json["maximum_marks"],
        minimumAccuracy = json["minimum_accuracy"],
        minimumPassingMarks = json["minimum_passing_marks"],
        minimumSpeed = json["minimum_speed"],
        minimumWords = json["minimum_words"],
        paragraph = json["paragraph"],
        resultType = json["result_type"],
        serverTime = json["server_time"],
        slug = json["slug"],
        startDatetime = json["start_datetime"],
        targetExam = json["target_exam"],
        targetExamCode = json["target_exam_code"],
        testId = json["test_id"],
        testName = json["test_name"],
        type = json["type"],
        wordCount = json["word_count"];
}
