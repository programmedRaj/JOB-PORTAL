import 'package:flutter/material.dart';
// import 'package:sih/pages/Home/course/course_screen.dart';
import 'package:sih/pages/Home/course/course_single_product.dart';
// import 'package:sih/pages/Home/course/my_courses.dart';
// import 'package:sih/pages/Home/home.dart';
// import 'package:sih/pages/Home/jobs/apply_job.dart';
// import 'package:sih/pages/Home/jobs/job_details.dart';
import 'package:sih/pages/Home/jobs/quiz.dart';
// import 'package:sih/pages/Home/jobs/screens/editresumeapply.dart';
import 'package:sih/pages/Home/jobs/screens/similarinternships.dart';
// import 'package:sih/pages/Home/resume/add/additional_detail.dart';
// import 'package:sih/pages/Home/resume/add/education.dart';
import 'package:sih/pages/Home/resume/add/internship.dart';
// import 'package:sih/pages/Home/resume/add/job.dart';
// import 'package:sih/pages/Home/resume/add/projects.dart';
// import 'package:sih/pages/Home/resume/add/training.dart';
import 'package:sih/pages/Home/resume/edit/edit_detials.dart';
// import 'package:sih/pages/Home/resume/edit_resume.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args =settings.arguments;

    switch (settings.name) {
      // case '/home':
      //   return MaterialPageRoute(builder: (_) => Home());
      //   break;
      // case '/jobdetails':
      //   return MaterialPageRoute(builder: (_) => JobDetials());
      //   break;
      // case '/editresume':
      //   return MaterialPageRoute(builder: (_) => Editresume());
      //   break;
      // case '/addetail':
      //   return MaterialPageRoute(builder: (_) => Additional());
      //   break;
      // case '/addeducation':
      //   return MaterialPageRoute(builder: (_) => Education());
      //   break;
      case '/internships':
        return MaterialPageRoute(builder: (_) => Internships());
        break;
      // case '/jobs':
      //   return MaterialPageRoute(builder: (_) => Job());
      //   break;
      // case '/por':
      //   return MaterialPageRoute(builder: (_) => Por());
      //   break;
      // case '/training':
      //   return MaterialPageRoute(builder: (_) => Training());
      //   break;
      // case '/projects':
      //   return MaterialPageRoute(builder: (_) => Projects());
      //   break;
      // case '/mycourse':
      //   return MaterialPageRoute(builder: (_) => Mycourse());
      //   break;
      // case '/allcourse':
      //   return MaterialPageRoute(builder: (_) => AllCourse());
      //   break;
      case '/productdetial':
        return MaterialPageRoute(builder: (_) => ProductDetial());
        break;
      case '/personaldetial':
        return MaterialPageRoute(builder: (_) => PersonalDetails());
        break;
      // case '/editapply':
      //   return MaterialPageRoute(builder: (_) => EditApply());
      //   break;
      case '/similar':
        return MaterialPageRoute(builder: (_) => Similar());
        break;
      // case '/appliedjobs':
      //   return MaterialPageRoute(builder: (_) => AppliedJobs());
      //   break;
      case '/quiz':
        return MaterialPageRoute(builder: (_) => Quiz());
        break;

      // Validation of correct data type
      // if (args is String) {
      //   return MaterialPageRoute(
      //     builder: (_) => SecondPage(
      //           data: args,
      //         ),
      //   );
      // }
      // If args is not of the correct type, return an error page.
      // You can also throw an exception while in development.
      // return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
