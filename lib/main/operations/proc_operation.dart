import 'package:vntu1/core/base_operation.dart';

class ProcOperation extends BaseOperation {
  ProcOperation() : super("%");

  @override
  double calc(double left, double right) {
    return left % right;
  }
}
