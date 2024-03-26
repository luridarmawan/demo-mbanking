import '../utils/all_utils.dart';

class MbxNewsModel {
  int news_id = 0;
  String image = '';
  String title = '';
  String content = '';

  MbxNewsModel();

  MbxNewsModel.fromJason(Jason jason) {
    news_id = jason['news_id'].intValue;
    image = jason['image'].stringValue;
    title = jason['title'].stringValue;
    content = jason['content'].stringValue;
  }
}
