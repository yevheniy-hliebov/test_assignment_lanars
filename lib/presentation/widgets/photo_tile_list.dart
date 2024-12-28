import 'package:flutter/material.dart';
import 'package:test_assignment_lanars/data/models/photo.dart';
import 'package:test_assignment_lanars/presentation/widgets/photo_tile.dart';

class PhotoTileList extends StatelessWidget {
  final List<Photo> photos;

  const PhotoTileList({
    super.key,
    required this.photos,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: photos.map((photo) => PhotoTile(photo: photo)).toList(),
    );
  }
}
