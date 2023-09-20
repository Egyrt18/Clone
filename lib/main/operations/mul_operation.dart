import 'package:vntu1/core/base_operation.dart';

class MulOperation extends BaseOperation {
  MulOperation() : super("*");

  @override
  double calc(double left, double right) {
    return left * right;
  }
}
