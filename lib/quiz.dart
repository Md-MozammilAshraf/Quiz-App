class Quiz {
  int? responseCode;
  List<Results>? results;

  Quiz({this.responseCode, this.results});

  Quiz.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    if (json['results'] != null) {
      results = <Results>[]; // Initialize an empty list
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response_code'] = responseCode;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String category;
  String type;
  String difficulty;
  String question;
  String correctAnswer;
  List<String> allAnswers; // Declare but do not initialize

  Results({
    required this.category,
    required this.type,
    required this.difficulty,
    required this.question,
    required this.correctAnswer,
  }) : allAnswers = []; // Initialize with an empty list in the constructor

  Results.fromJson(Map<String, dynamic> json)
      : category = json['category'],
        type = json['type'],
        difficulty = json['difficulty'],
        question = json['question'],
        correctAnswer = json['correct_answer'],
        allAnswers = List<String>.from(json['incorrect_answers']) {
    // Initialize allAnswers from incorrect_answers
    allAnswers.add(correctAnswer); // Add the correct answer to the list
    allAnswers.shuffle(); // Shuffle the answers
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['type'] = type;
    data['difficulty'] = difficulty;
    data['question'] = question;
    data['correct_answer'] = correctAnswer;
    data['incorrect_answers'] =
        allAnswers; // This should ideally represent incorrect answers only
    return data;
  }
}
