class TestResult {
  List<ResultData>? data;
  String? message;

  TestResult({this.data, this.message});

  TestResult.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ResultData>[];
      json['data'].forEach((v) {
        data!.add(ResultData.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class ResultData {
  String? userName;
  String? productId;
  int? testId;
  String? testName;
  String? targetExam;
  String? targetExamCode;
  String? startDatetime;
  String? endDatetime;
  String? type;
  String? language;
  String? allowBackspace;
  int? wordCount;
  String? highlightType;
  int? allowHighlight;
  bool? isAvailable;
  int? maximumMarks;
  int? minimumPassingMarks;
  int? totalCandidate;
  int? minimumSpeed;
  int? minimumWords;
  int? minimumAccuracy;
  String? resultType;
  String? serverTime;
  int? resultAvailable;
  int? marksObtained;
  int? nwpm;
  int? ncpm;
  double? gwpm;
  int? gcpm;
  int? backspaceCount;
  int? accuracy;
  int? wordsTyped;
  int? wordsCorrect;
  int? wordIncorrect;
  int? totalUserCount;
  int? rank;
  int? halfMistakes;
  int? fullMistakes;
  int? isSeen;
  bool? testSubmitted;

  ResultData({
    this.userName,
    this.productId,
    this.testId,
    this.testName,
    this.targetExam,
    this.targetExamCode,
    this.startDatetime,
    this.endDatetime,
    this.type,
    this.language,
    this.allowBackspace,
    this.wordCount,
    this.highlightType,
    this.allowHighlight,
    this.isAvailable,
    this.maximumMarks,
    this.minimumPassingMarks,
    this.totalCandidate,
    this.minimumSpeed,
    this.minimumWords,
    this.minimumAccuracy,
    this.resultType,
    this.serverTime,
    this.resultAvailable,
    this.marksObtained,
    this.nwpm,
    this.ncpm,
    this.gwpm,
    this.gcpm,
    this.backspaceCount,
    this.accuracy,
    this.wordsTyped,
    this.wordsCorrect,
    this.wordIncorrect,
    this.totalUserCount,
    this.rank,
    this.halfMistakes,
    this.fullMistakes,
    this.isSeen,
    this.testSubmitted,
  });

  ResultData.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    productId = json['product_id'];
    testId = json['test_id'];
    testName = json['test_name'];
    targetExam = json['target_exam'];
    targetExamCode = json['target_exam_code'];
    startDatetime = json['start_datetime'];
    endDatetime = json['end_datetime'];
    type = json['type'];
    language = json['language'];
    allowBackspace = json['allow_backspace'];
    wordCount = json['word_count'];
    highlightType = json['highlight_type'];
    allowHighlight = json['allow_highlight'];
    isAvailable = json['is_available'];
    maximumMarks = json['maximum_marks'];
    minimumPassingMarks = json['minimum_passing_marks'];
    totalCandidate = json['total_candidate'];
    minimumSpeed = json['minimum_speed'];
    minimumWords = json['minimum_words'];
    minimumAccuracy = json['minimum_accuracy'];
    resultType = json['result_type'];
    serverTime = json['server_time'];
    resultAvailable = json['result_available'];
    marksObtained = json['marks_obtained'];
    nwpm = json['nwpm'];
    ncpm = json['ncpm'];
    gwpm = json['gwpm'];
    gcpm = json['gcpm'];
    backspaceCount = json['backspace_count'];
    accuracy = json['Accuracy'];
    wordsTyped = json['words_typed'];
    wordsCorrect = json['words_correct'];
    wordIncorrect = json['word_incorrect'];
    totalUserCount = json['total_user_count'];
    rank = json['rank'];
    halfMistakes = json['half_mistakes'];
    fullMistakes = json['full_mistakes'];
    isSeen = json['is_seen'];
    testSubmitted = json['test_submitted'];
  }
}
