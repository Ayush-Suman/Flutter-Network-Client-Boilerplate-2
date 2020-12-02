import 'package:networkclietboilerplate/base/modelclassselector.dart';

class ClassSelector extends ModelClassSelector{
  static const sampleRoute1 = 'api/user/sample1';
  static const sampleRoute2 = 'api/user/sample2';


  @override
  dynamic classSelector(String route, Map<String, dynamic> map) {
    // Use switch on route to convert map to model class
    return route;
  }
}