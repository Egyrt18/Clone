import 'package:vntu1/core/base_operation.dart';

class ExpressionDto {
    double left;
    double right;
    BaseOperation operation;

  ExpressionDto({
    required this.left,
    required this.right,
    required this.operation,
  });
}