import '../../models/demo_movie_model.dart';
import '../../viewmodels/mbx_format_vm.dart';
import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxBannerCell extends StatelessWidget {
  final DemoMovieModel movie;
  MbxBannerCell(this.movie);

  @override
  Widget build(BuildContext context) {
    return ContainerX(
      width: 300.0,
      //padding: EdgeInsets.all(8.0),
      child: ImageX(
        url: movie.poster,
        cornerRadius: 12.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
