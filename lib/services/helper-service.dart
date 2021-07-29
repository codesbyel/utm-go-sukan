import 'package:date_format/date_format.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HelperService {

 
  String defaultDate(DateTime date) {
     return formatDate(date, ['dd', ' ', 'M', ' ', 'yyyy']);
  }
    
    double countTotal(List transactions) {
      double total = 0;
      transactions.forEach((trax) {
        total += double.parse(trax['amount']);
      });
      return total;
    }
    //to show popup message
    void showToast(String text) {
      Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
      );
    }

}