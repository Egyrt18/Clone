import 'package:vntu1/core/base_operation.dart';

class SubOperation extends BaseOperation {
  SubOperation() : super("-");

  @override
  double calc(double left, double right) {
    return left - right;
  }
}
