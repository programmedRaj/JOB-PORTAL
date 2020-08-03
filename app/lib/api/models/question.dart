import 'dart:convert';

class Slide {
  String question;
  String a1;
  String a2;
  String a3;
  String a4;
  String valid;
  bool isSubmitted;
  Slide(this.question, this.a1, this.a2, this.a3, this.a4, this.valid,
      this.isSubmitted);

  Slide copyWith({
    String question,
    String a1,
    String a2,
    String a3,
    String a4,
    String valid,
    bool isSubmitted,
  }) {
    return Slide(
      question ?? this.question,
      a1 ?? this.a1,
      a2 ?? this.a2,
      a3 ?? this.a3,
      a4 ?? this.a4,
      valid ?? this.valid,
      isSubmitted ?? this.isSubmitted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'a1': a1,
      'a2': a2,
      'a3': a3,
      'a4': a4,
      'valid': valid,
      'isSubmitted': isSubmitted,
    };
  }

  static Slide fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Slide(
      map['question'],
      map['a1'],
      map['a2'],
      map['a3'],
      map['a4'],
      map['valid'],
      map['isSubmitted'],
    );
  }

  String toJson() => json.encode(toMap());

  static Slide fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Slide(question: $question, a1: $a1, a2: $a2, a3: $a3, a4: $a4, valid: $valid, isSubmitted: $isSubmitted)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Slide &&
        o.question == question &&
        o.a1 == a1 &&
        o.a2 == a2 &&
        o.a3 == a3 &&
        o.a4 == a4 &&
        o.valid == valid &&
        o.isSubmitted == isSubmitted;
  }

  @override
  int get hashCode {
    return question.hashCode ^
        a1.hashCode ^
        a2.hashCode ^
        a3.hashCode ^
        a4.hashCode ^
        valid.hashCode ^
        isSubmitted.hashCode;
  }
}
