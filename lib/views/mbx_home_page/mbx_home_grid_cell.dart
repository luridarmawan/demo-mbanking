import '../../models/demo_movie_model.dart';
import '../../viewmodels/mbx_format_vm.dart';
import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxHomeGridCell extends StatelessWidget {
  final DemoMovieModel movie;
  MbxHomeGridCell(this.movie);

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(Get.context!).size.width / 4.0) - (8.0 * 5);
    return Container(
        child: Column(
      children: <Widget>[
        ImageX(
          url: movie.poster,
          width: width,
          height: width,
          cornerRadius: 8.0,
          placeholderColor: ColorX.lightGray,
        ),
        TextX(
          movie.title,
          color: ColorX.black,
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.center,
          maxLines: 3,
        )
      ],
    ));
  }
}
