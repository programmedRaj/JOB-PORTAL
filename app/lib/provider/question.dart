import 'package:flutter/cupertino.dart';
import 'package:sih/api/models/qna.dart';
import 'package:sih/api/models/question.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:retry/retry.dart';
import 'package:sih/api/service/baseurl.dart';

class Question with ChangeNotifier {
  BaseUrl baseUrl = BaseUrl();
  Future getqna(String jobid) async {
    var bodymsg = json.encode({"job_id": jobid});
    var response = await retry(
      () => http
          .post(baseUrl.quiz,
              headers: {
                "Content-Type": "application/json",
                // "Authorization": token
              },
              body: bodymsg)
          .timeout(Duration(seconds: 5)),
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );

    var k = response.body;
    var n = json.decode(k);

    // removess();
    for (int j = 0; j < n['qna'].length; j++) {
      adds(json.decode(n['qna'][j]['questions']));
    }

    removes();
    for (int i = 0; i < ss.length; i++) {
      for (int k = 0; k < ss[i].length; k++) {
        addslide(
          question: ss[i][k]['Q'],
          a1: ss[i][k]['A']['1'],
          a2: ss[i][k]['A']['2'],
          a3: ss[i][k]['A']['3'],
          a4: ss[i][k]['A']['4'],
          valid: ss[i][k]['A'][ss[i][k]['A']['valid']],
        );
      }
    }
    //  print(json.decode(n['qna'][j]['questions'])[0]['Q']);
  }

  // Map<String, Qna> qna = {};

  // Map<String, Qna> get qnas => qna;
  List s = [];
  List get ss => s;

  void adds(List sr) {
    ss.add(sr);
    notifyListeners();
  }

  void removess() {
    ss.clear();
    notifyListeners();
  }

  List<Slide> slide = [];
  List<Slide> get slides => slide;

  void addslide({
    String question,
    String a1,
    String a2,
    String a3,
    String a4,
    String valid,
  }) {
    slides.add(Slide(question, a1, a2, a3, a4, valid, false));
    notifyListeners();
  }

  void removes() {
    slides.clear();
    notifyListeners();
  }

  // void addqna(String jobid, List<Slide> q) {
  //   var thekey = 'jobid';
  //   if (qna.isEmpty) {
  //     if (qna.containsKey(thekey)) {
  //       qna.remove(thekey);
  //     } else {
  //       qna.putIfAbsent(thekey, () => Qna(jobid: jobid, q: slides));
  //     }
  //   } else {
  //     qna.update(thekey, (value) => Qna(jobid: jobid, q: slide));
  //   }
  // }
}
