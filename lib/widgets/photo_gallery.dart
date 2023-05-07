import 'package:flutter/widgets.dart';

class PhotoGallery extends StatefulWidget {
  final List<String> photoUrls;

  const PhotoGallery(this.photoUrls, {super.key});

  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 25,
          child: _extractLargePhoto(),
        ),
        Flexible(
          flex: 8,
          child: Column(
            children: [..._extractSmallPhotos()],
          ),
        )
      ],
    );
  }

  Widget _extractLargePhoto() => widget.photoUrls.isNotEmpty ? Image.network(widget.photoUrls[0]) : const SizedBox.shrink();

  List<Widget> _extractSmallPhotos() {
    if (widget.photoUrls.isNotEmpty) {
      return [
        Image.network(widget.photoUrls[1]),
        Image.network(widget.photoUrls[2]),
        Image.network(widget.photoUrls[3]),
      ];
    }
    return [];
  }
}
