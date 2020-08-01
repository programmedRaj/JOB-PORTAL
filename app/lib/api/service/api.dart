import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:retry/retry.dart';
import 'package:http/http.dart' as http;
// import 'package:sih/api/models/login.dart';
import 'package:sih/api/models/register.dart';
import 'package:sih/api/service/baseurl.dart';
import 'baseapi.dart';

class Api extends BaseApi {
  BaseUrl baseUrl = BaseUrl();
  String status;

  @override
  Future<Register> register(
      {String email,
      String fname,
      String lname,
      String passw,
      String contact}) async {
    print(contact);
    var bodymsg = json.encode({
      "fname": fname,
      "lname": lname,
      "email": email,
      "passw": passw,
      "contact": contact
    });

    var response = await retry(
      () => http
          .post(baseUrl.register,
              headers: {"Content-Type": "application/json"}, body: bodymsg)
          .timeout(Duration(seconds: 5)),
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );
    var convert = json.decode(response.body);
    print(response.statusCode);
    if (convert.toString().isNotEmpty) {
      Register reg = Register.fromJson(convert);
      return reg;
    } else {
      return null;
    }
  }
}
