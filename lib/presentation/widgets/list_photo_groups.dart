import 'package:flutter/material.dart';
import 'package:test_assignment_lanars/data/models/photo_group.dart';
import 'package:test_assignment_lanars/presentation/widgets/group_letter.dart';
import 'package:test_assignment_lanars/presentation/widgets/photo_tile_list.dart';

class ListPhotoGroups extends StatefulWidget {
  final List<PhotoGroup> photoGroups;

  const ListPhotoGroups({
    super.key,
    required this.photoGroups,
  });

  @override
  State<ListPhotoGroups> createState() => _ListPhotoGroupsState();
}

class _ListPhotoGroupsState extends State<ListPhotoGroups> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Scrollbar(
        controller: scrollController,
        thickness: 3,
        child: ListView.separated(
          padding: const EdgeInsets.only(right: 8),
          controller: scrollController,
          itemCount: widget.photoGroups.length,
          itemBuilder: (context, index) =>
              _buildGroup(widget.photoGroups[index]),
          separatorBuilder: (context, index) => const SizedBox(height: 8),
        ),
      ),
    );
  }

  Row _buildGroup(PhotoGroup photoGroup) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        GroupLetter(letter: photoGroup.letter.toUpperCase()),
        Expanded(
          child: PhotoTileList(
            photos: photoGroup.photos,
          ),
        )
      ],
    );
  }
}
