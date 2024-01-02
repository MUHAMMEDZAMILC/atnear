

import 'package:atnear/utils/string.dart';

getmonthname(DateTime date){
  var currentmon = date.month;
  var currentyear = date.year;
  return "${months[currentmon-1]} $currentyear";
}