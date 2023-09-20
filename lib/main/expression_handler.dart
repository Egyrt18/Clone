import 'package:vntu1/main/expression_dto.dart';

class ExpressionHandler {
  double calculateExpression(List<ExpressionDto> dto) {
    double result = 0;
    for (int i = 0; i < dto.length; i++) {
      if (dto[i].operation.symbol == '*' ||
          dto[i].operation.symbol == '/' ||
          dto[i].operation.symbol == '%') {
        if (i > 0 && i < dto.length - 1) {
          dto[i - 1].right = dto[i + 1].left =
              dto[i].operation.calc(dto[i].left, dto[i].right);
          dto.removeAt(i);
          i--;
        } else if (i==0) {
          dto[i + 1].left = dto[i].operation.calc(dto[i].left, dto[i].right);
          dto.removeAt(i);
        }else if (i==dto.length-1) {
          dto[i-1].right = dto[i].operation.calc(dto[i].left, dto[i].right);
          dto.removeAt(i);
        }
      }
    }
    result = dto[0].operation.calc(dto[0].left, dto[0].right);
    for (int i = 0; i < dto.length; i++) {
      if (i < dto.length - 1) {
        result = dto[i + 1].operation.calc(result, dto[i + 1].right);
      }
    }
    return result;
  }
}