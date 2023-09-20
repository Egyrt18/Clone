import 'package:vntu1/core/base_operation.dart';

class DivOperation extends BaseOperation {
  DivOperation() : super("/");

  @override
  double calc(double left, double right) {
    return left / right;
  }
}
