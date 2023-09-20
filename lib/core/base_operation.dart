//import 'package:flutter/cupertino.dart';

abstract class BaseOperation {
  final String symbol;
  BaseOperation(this.symbol);
  double calc(double left, double right);
}
