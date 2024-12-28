import 'package:test_assignment_lanars/data/models/photo_group.dart';

abstract class PhotoState {}

class PhotoInitialState extends PhotoState {}

class PhotoInProgressState extends PhotoState {}

class PhotoListGroupsState extends PhotoState {
  final List<PhotoGroup> photoGroups;
  PhotoListGroupsState({required this.photoGroups});
}
