import '../utils/all_utils.dart';

class MbxAccountModel {
  String account = '';
  int balance = 0;
  int id = 0;
  String name = '';

  MbxAccountModel();

  MbxAccountModel.fromJason(Jason jason) {
    account = jason['account'].stringValue;
    balance = jason['balance'].intValue;
    id = jason['id'].intValue;
    name = jason['name'].stringValue;
  }

  Jason encode() {
    final jason = Jason();
    jason['account'] = account;
    jason['balance'] = balance;
    jason['id'] = id;
    jason['name'] = name;
    return jason;
  }
}
