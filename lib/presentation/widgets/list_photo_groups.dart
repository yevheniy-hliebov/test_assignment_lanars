import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment_lanars/bloc/photo/photo_bloc.dart';
import 'package:test_assignment_lanars/bloc/photo/photo_event.dart';
import 'package:test_assignment_lanars/bloc/photo/photo_state.dart';
import 'package:test_assignment_lanars/data/models/photo_group.dart';
import 'package:test_assignment_lanars/presentation/widgets/group_letter.dart';
import 'package:test_assignment_lanars/presentation/widgets/photo_tile_list.dart';

class ListPhotoGroups extends StatefulWidget {
  const ListPhotoGroups({
    super.key,
  });

  @override
  State<ListPhotoGroups> createState() => _ListPhotoGroupsState();
}

class _ListPhotoGroupsState extends State<ListPhotoGroups> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PhotoBloc, PhotoState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is PhotoInProgressState) {
          return _loader;
        }

        List<PhotoGroup> photoGroups = [];
        if (state is PhotoListGroupsState) {
          photoGroups = state.photoGroups;
        }

        return RefreshIndicator(
          onRefresh: () => _refresh(context),
          displacement: 5,
          triggerMode: RefreshIndicatorTriggerMode.onEdge,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Scrollbar(
              controller: scrollController,
              thickness: 3,
              child: ListView.separated(
                padding: const EdgeInsets.only(right: 6),
                controller: scrollController,
                itemCount: photoGroups.length,
                itemBuilder: (context, index) =>
                    _buildGroup(photoGroups[index]),
                separatorBuilder: (context, index) => const SizedBox(height: 8),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _refresh(BuildContext context) async {
    context.read<PhotoBloc>().add(
          PhotoRefreshEvent(),
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

  Widget get _loader {
    return Center(
      child: SizedBox(
        width: 56,
        height: 56,
        child: CircularProgressIndicator(
          strokeWidth: 5,
        ),
      ),
    );
  }
}
