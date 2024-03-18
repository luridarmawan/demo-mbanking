import '../../models/demo_movie_model.dart';
import '../../widgets/all_widgets.dart';
import '../demo_image_screen/demo_image_screen.dart';

// ignore: must_be_immutable
class MbxPromoCell extends StatelessWidget {
  final DemoMovieModel movie;
  MbxPromoCell(this.movie);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: ColorX.transparent,
        child: InkWell(
            customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            highlightColor: ColorX.highlight,
            onTap: () {
              Get.to(DemoImageScreen(url: movie.poster));
            },
            child: Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: ImageX(
                  url: movie.poster,
                  width: double.infinity,
                  height: double.infinity,
                  cornerRadius: 12.0,
                  fit: BoxFit.cover,
                ))));
  }
}
