import '../utils/all_utils.dart';

class MbxNewsModel {
  int movie_id = 0;
  String poster = '';
  int revenue = 0;
  String title = '';

  MbxNewsModel();

  MbxNewsModel.fromJason(Jason jason) {
    movie_id = jason['movie_id'].intValue;
    poster = jason['poster'].stringValue;
    revenue = jason['revenue'].intValue;
    title = jason['title'].stringValue;
  }
}
