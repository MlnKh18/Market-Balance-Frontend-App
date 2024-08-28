import 'package:get/get.dart';

class HistoryController extends GetxController {
  final historyItems = <Map<String, dynamic>>[];

  // Getter untuk mendapatkan nilai historyItems sebagai List<Map<String, dynamic>>
  List<Map<String, dynamic>> get getHistoryItems => historyItems;

  void addTransaction(Map<String, dynamic> transaction) {
    // Pastikan transaction yang ditambahkan memiliki struktur yang benar
    if (transaction['items'] != null && transaction['items'].isNotEmpty) {
      historyItems.add(transaction);
    } else {
      print('Transaction does not have items or items are empty');
    }
  }
}
