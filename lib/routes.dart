import 'package:bicycle/main.dart';
import 'package:bicycle/screens/spot_form.dart';

class Routes {
  static const init = '/';
  static const spotForm = '/spotForm';

  static final routes = {
    init: (context) => MyHomePage(),
    spotForm: (context) => SpotForm(),
  };

  static String getInitialRoute() => init;

}