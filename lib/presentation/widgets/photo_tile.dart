import 'package:flutter/material.dart';
import 'package:test_assignment_lanars/data/models/photo.dart';

class PhotoTile extends StatelessWidget {
  final Photo photo;

  const PhotoTile({
    required this.photo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(width: 1),
      ),
      contentPadding: const EdgeInsets.only(
        top: 12,
        left: 16,
        bottom: 12,
        right: 24,
      ),
      leading: _buildImage(),
      horizontalTitleGap: 16,
      title: _buildPhotographerName(context),
      subtitle: _buildAltText(context),
    );
  }

  ClipRRect _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        photo.src,
        width: 56,
        height: 56,
        fit: BoxFit.cover,
      ),
    );
  }

  Text _buildPhotographerName(BuildContext context) {
    return Text(
      photo.photographer,
      style: Theme.of(context).textTheme.bodyLarge,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Text _buildAltText(BuildContext context) {
    return Text(
      '${photo.alt}\n',
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.3),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
