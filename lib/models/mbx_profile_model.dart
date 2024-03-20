import '../utils/all_utils.dart';
import 'mbx_account_model.dart';

class MbxProfileModel {
  List<MbxAccountModel> accounts = [];
  String email = '';
  String name = '';
  String photo = '';
  String token = '';

  MbxProfileModel();

  decode(Jason jason) {
    accounts = [];
    for (final item in jason['accounts'].jasonListValue) {
      accounts.add(MbxAccountModel.fromJason(item));
    }
    email = jason['email'].stringValue;
    name = jason['name'].stringValue;
    photo = jason['photo'].stringValue;
    token = jason['token'].stringValue;
  }

  Jason encode() {
    final jason = Jason();
    List<Map<String, dynamic>> accs = [];
    for (final item in accounts) {
      accs.add(item.encode());
    }
    jason['accounts'] = accs;
    jason['email'] = email;
    jason['name'] = name;
    jason['photo'] = photo;
    jason['token'] = token;
    return jason;
  }
}
