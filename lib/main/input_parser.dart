import 'package:vntu1/core/base_operation.dart';
import 'package:vntu1/core/calculator_exception.dart';
import 'package:vntu1/main/expression_dto.dart';
import 'package:vntu1/main/operations/add_operation.dart';
import 'package:vntu1/main/operations/div_operation.dart';
import 'package:vntu1/main/operations/mul_operation.dart';
import 'package:vntu1/main/operations/proc_operation.dart';
import 'package:vntu1/main/operations/sub_operation.dart';

class InputParser {
  List<ExpressionDto> parse(String input) {
    int index = -1;
    int count = 0;
    BaseOperation? operation;
    final List<ExpressionDto> data = [];
    final List<String> parsedNumber = input.split(RegExp(r'[+\-/*%]'));
    List<String> parsedOperation = input.split(RegExp(r'[0123456789]'));
    parsedOperation.removeWhere((element) => element == '');
    for (int j = 0; j < parsedOperation.length; ++j) {
      for (int i = 0;
          i <
              (parsedNumber[count] +
                      parsedOperation[j] +
                      parsedNumber[count + 1])
                  .length;
          ++i) {
        if (parsedOperation[j] == "+") {
          index = i;
          operation = AddOperation();
          break;
        } else if (parsedOperation[j] == "-") {
          index = i;
          operation = SubOperation();
          break;
        } else if (parsedOperation[j] == "*") {
          index = i;
          operation = MulOperation();
          break;
        } else if (parsedOperation[j] == "/") {
          index = i;
          operation = DivOperation();
          break;
        } else if (parsedOperation[j] == "%") {
          index = i;
          operation = ProcOperation();
          break;
        }
      }
      if (index < 0 || operation == null) {
        throw CalculatorException(text: "index > 0 && operation !=null");
      }
      final double left = double.tryParse(parsedNumber[count]) ?? 0.0;
      final double right = double.tryParse(parsedNumber[count + 1]) ?? 0.0;
      data.add(ExpressionDto(left: left, right: right, operation: operation));
      count++;
    }
    return data;
  }
}