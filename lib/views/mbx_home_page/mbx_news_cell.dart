import '../../models/mbx_news_model.dart';
import '../../widgets/all_widgets.dart';
import '../mbx_news_screen/mbx_news_screen.dart';

// ignore: must_be_immutable
class MbxNewsCell extends StatelessWidget {
  final MbxNewsModel news;
  MbxNewsCell(this.news);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: ColorX.transparent,
        child: Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: InkWell(
              customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              highlightColor: ColorX.highlight,
              onTap: () {
                Get.to(MbxNewsScreen());
              },
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageX(
                      url: news.poster,
                      width: double.infinity,
                      height: 100.0,
                      cornerRadius: 12.0,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 4.0),
                    TextX(
                      news.title,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                      color: ColorX.gray,
                      textAlign: TextAlign.start,
                      maxLines: 3,
                    ),
                    Spacer()
                  ]),
            )));
  }
}
