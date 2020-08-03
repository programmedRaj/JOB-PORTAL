import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:sih/api/models/question.dart';

class Qna {
  String jobid;
  List<Slide> q;
  Qna({
    this.jobid,
    this.q,
  });

  Qna copyWith({
    String jobid,
    List<Slide> q,
  }) {
    return Qna(
      jobid: jobid ?? this.jobid,
      q: q ?? this.q,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'jobid': jobid,
      'q': q?.map((x) => x?.toMap())?.toList(),
    };
  }

  static Qna fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Qna(
      jobid: map['jobid'],
      q: List<Slide>.from(map['q']?.map((x) => Slide.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  static Qna fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Qna(jobid: $jobid, q: $q)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return o is Qna && o.jobid == jobid && listEquals(o.q, q);
  }

  @override
  int get hashCode => jobid.hashCode ^ q.hashCode;
}
