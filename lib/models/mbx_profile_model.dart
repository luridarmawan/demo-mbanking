import '../utils/all_utils.dart';

class MbxProfileModel {
  String name = '';
  String email = '';
  String photo = '';

  MbxProfileModel();

  decode(Jason jason) {
    name = jason['name'].stringValue;
    email = jason['email'].stringValue;
    photo = jason['photo'].stringValue;
  }
}
