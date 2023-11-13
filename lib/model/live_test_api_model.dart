class LiveTest {
  LiveData data;
  String message;

  LiveTest({
    required this.data,
    required this.message,
  });

  factory LiveTest.fromJson(Map<String, dynamic> json) {
    return LiveTest(
      data: LiveData.fromJson(json['data']),
      message: json['message'],
    );
  }
}

class LiveData {
  List<LiveTestData> list;

  LiveData({
    required this.list,
  });

  factory LiveData.fromJson(Map<String, dynamic> json) {
    List<LiveTestData> testList = [];
    if (json['list'] != null) {
      testList = List<LiveTestData>.from(json['list'].map((test) => LiveTestData.fromJson(test)));
    }
    return LiveData(
      list: testList,
    );
  }
}

class LiveTestData {
  int? testId;
  String? testName;
  String? slug;
  String? targetExam;
  String? targetExamCode;
  String? serverTime;
  String? language;
  bool? isAttempted;
  bool? isAvailable;
  String? paragraph;
  String? startDatetime;
  String? endDatetime;
  String? allowBackspace;
  int? wordCount;
  int? allowHighlight;
  String? highlightType;
  int? maximumMarks;
  int? minimumPassingMarks;
  int? duration;
  int? minimumSpeed;
  int? minimumWords;
  int? minimumAccuracy;
  String? type;
  String? resultType;
  List<String>? audioUrls;
  String? attendStatus;

  LiveTestData({
    this.testId,
    this.testName,
    this.slug,
    this.targetExam,
    this.targetExamCode,
    this.serverTime,
    this.language,
    this.isAttempted,
    this.isAvailable,
    this.paragraph,
    this.startDatetime,
    this.endDatetime,
    this.allowBackspace,
    this.wordCount,
    this.allowHighlight,
    this.highlightType,
    this.maximumMarks,
    this.minimumPassingMarks,
    this.duration,
    this.minimumSpeed,
    this.minimumWords,
    this.minimumAccuracy,
    this.type,
    this.resultType,
    this.audioUrls,
    this.attendStatus,
  });

  factory LiveTestData.fromJson(Map<String, dynamic> json) {
    return LiveTestData(
      testId: json['test_id'],
      testName: json['test_name'],
      slug: json['slug'],
      targetExam: json['target_exam'],
      targetExamCode: json['target_exam_code'],
      serverTime: json['server_time'],
      language: json['language'],
      isAttempted: json['is_attempted'],
      isAvailable: json['is_available'],
      paragraph: json['paragraph'],
      startDatetime: json['start_datetime'],
      endDatetime: json['end_datetime'],
      allowBackspace: json['allow_backspace'],
      wordCount: json['word_count'],
      allowHighlight: json['allow_highlight'],
      highlightType: json['highlight_type'],
      maximumMarks: json['maximum_marks'],
      minimumPassingMarks: json['minimum_passing_marks'],
      duration: json['duration'],
      minimumSpeed: json['minimum_speed'],
      minimumWords: json['minimum_words'],
      minimumAccuracy: json['minimum_accuracy'],
      type: json['type'],
      resultType: json['result_type'],
      audioUrls: List<String>.from(json['Audio Urls'] ?? []),
      attendStatus: json['attend_status'],
    );
  }
}

