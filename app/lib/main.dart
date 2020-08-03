import 'package:dynamic_color_theme/dynamic_color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sih/pages/Auth/phoneauth.dart';
import 'package:sih/pages/Home/home.dart';
import 'package:sih/provider/internship.dart';
import 'package:sih/provider/question.dart';
import 'package:sih/provider/token.dart';
import 'package:sih/provider/userprovider.dart';
import 'language/generated/l10n.dart';
import 'provider/appliedjobprovider.dart';
import 'provider/newcourse.dart';
import 'routes/route.dart'; //abc

void main() {
  runApp(MyApp());
}

// const kFuchsia = const Color(0xFF880E4F);
// const kWhite = Colors.white;
// const kLightGrey = const Color(0xFFE8E8E8);
// const kDarkGrey = const Color(0xFF303030);

MaterialColor myColor = MaterialColor(0xFF880E4F, color);

Map<int, Color> color = {
  50: Hexcolor('#7289da'), //bluelight
  100: Hexcolor('#FFFFFF'), //white
  200: Hexcolor('#2C2F33'), //dark but not dark black
  300: Hexcolor('#23272A'), //not quite black
  500: Colors.grey[600], //grey
  600: Colors.black,
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicColorTheme(
      data: (Color color, bool isDark) {
        return _buildTheme(color, isDark);
      },
      defaultColor: myColor[100],
      defaultIsDark: true,
      themedWidgetBuilder: (BuildContext context, ThemeData theme) {
        return MultiProvider(
            providers: [
              ChangeNotifierProvider.value(value: InternshipDetialsProvider()),
              ChangeNotifierProvider.value(value: UserProvider()),
              ChangeNotifierProvider.value(value: Token()),
              ChangeNotifierProvider.value(value: Courseexact()),
              ChangeNotifierProvider.value(value: AppliedJobProvider()),
              ChangeNotifierProvider.value(value: Question())
            ],
            child: OverlaySupport(
              child: MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: theme,
                //  ThemeData(
                //   brightness: Brightness.light,
                // iconTheme: IconThemeData(color: myColor[100]),
                // primaryColor: myColor[100], //white
                // accentColor: myColor[50], //blupurple
                // highlightColor: myColor[500], //lightgrey
                // hintColor: myColor[600], //darkblack
                // errorColor: Colors.red,

                //   visualDensity: VisualDensity.adaptivePlatformDensity,
                // ),
                onGenerateTitle: (BuildContext context) =>
                    S.of(context).appTitle,
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                initialRoute: '/',
                onGenerateRoute: RouteGenerator.generateRoute,
                home: Splash(),
              ),
            ));
      },
    );
  }

  ThemeData _buildTheme(Color accentColor, bool isDark) {
    final ThemeData base = isDark ? ThemeData.dark() : ThemeData.light();

    return base.copyWith(
        iconTheme: IconThemeData(color: isDark ? myColor[50] : myColor[100]),
        primaryColor: myColor[100], //white
        accentColor: myColor[50], //blupurple
        highlightColor: myColor[500], //lightgrey
        hintColor: myColor[300], //darkblack
        errorColor: Colors.red,
        disabledColor: myColor[200]

        // accentTextTheme: _buildTextTheme(base.accentTextTheme, accentColor),
        // cardColor: primaryColor,
        // cursorColor: accentColor,
        // floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
        //   backgroundColor: accentColor,
        // ),
        // iconTheme: base.iconTheme.copyWith(
        //   color: accentColor,
        // ),
        // primaryColor: primaryColor,
        // primaryIconTheme: base.primaryIconTheme.copyWith(
        //   color: accentColor,
        // ),
        // primaryTextTheme: _buildTextTheme(base.primaryTextTheme, accentColor),
        // scaffoldBackgroundColor: primaryColor,
        // // textSelectionColor: isDark ? kDarkGrey : kLightGrey,
        // textSelectionHandleColor: accentColor,
        // textTheme: _buildTextTheme(base.textTheme, accentColor),
        );
  }

  // TextTheme _buildTextTheme(TextTheme base, Color color) {
  //   return base.copyWith(
  //     bodyText2: base.bodyText2.copyWith(
  //       fontSize: 16,
  //     ),
  //     bodyText1: base.bodyText1.copyWith(
  //       color: color,
  //       fontSize: 16,
  //       fontWeight: FontWeight.bold,
  //     ),
  //     button: base.button.copyWith(
  //       color: color,
  //     ),
  //     caption: base.caption.copyWith(
  //       color: color,
  //       fontSize: 14,
  //     ),
  //     headline5: base.headline5.copyWith(
  //       color: color,
  //       fontSize: 24,
  //     ),
  //     subtitle1: base.subtitle1.copyWith(
  //       color: color,
  //       fontSize: 18,
  //     ),
  //     headline6: base.headline6.copyWith(
  //       color: color,
  //       fontSize: 20,
  //       fontWeight: FontWeight.bold,
  //     ),
  //   );
  // }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    _check().then((value) => s());
  }

  Future s() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    if (token == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Phone()));
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Home()));
    }
  }

  Future<bool> _check() async {
    await Future.delayed(Duration(milliseconds: 1000));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: FlutterLogo(
          size: 50,
        ),
      )),
    );
  }
}
