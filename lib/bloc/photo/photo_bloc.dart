import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment_lanars/bloc/photo/photo_event.dart';
import 'package:test_assignment_lanars/bloc/photo/photo_state.dart';
import 'package:test_assignment_lanars/data/models/photo.dart';
import 'package:test_assignment_lanars/data/models/photo_group.dart';
import 'package:test_assignment_lanars/data/repository/photo_repository.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final BuildContext context;
  final photoRepository = PhotoRepository(Dio());

  PhotoBloc(this.context) : super(PhotoInitialState()) {
    on<PhotoLoadPhotosEvent>(_getData);
    on<PhotoRefreshEvent>(_refresh);
    add(PhotoLoadPhotosEvent());
  }

  void _refresh(PhotoRefreshEvent event, Emitter<PhotoState> emit) async {}

  void _getData(PhotoLoadPhotosEvent event, Emitter<PhotoState> emit) async {
    emit(PhotoInProgressState());

    try {
      final photoResponse = await photoRepository.getPhotos();
      final photoGroups = _groupPhotosByFirstLetter(photoResponse.photos);
      emit(PhotoListGroupsState(photoGroups: photoGroups));
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Server error. Refresh page'),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 24),
            padding: EdgeInsets.all(16),
          ),
        );
      }
    }
  }

  List<PhotoGroup> _groupPhotosByFirstLetter(List<Photo> photos) {
    photos.sort((a, b) => a.photographer[0].compareTo(b.photographer[0]));

    Map<String, List<Photo>> groupedPhotos = {};

    for (var photo in photos) {
      String firstLetter = photo.photographer[0].toUpperCase();

      if (groupedPhotos.containsKey(firstLetter)) {
        groupedPhotos[firstLetter]!.add(photo);
      } else {
        groupedPhotos[firstLetter] = [photo];
      }
    }

    List<PhotoGroup> photoGroups = groupedPhotos.entries.map((entry) {
      return PhotoGroup(letter: entry.key, photos: entry.value);
    }).toList();

    return photoGroups;
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment_lanars/bloc/photo/photo_event.dart';
import 'package:test_assignment_lanars/bloc/photo/photo_state.dart';
import 'package:test_assignment_lanars/data/models/photo.dart';
import 'package:test_assignment_lanars/data/models/photo_group.dart';
import 'package:test_assignment_lanars/data/repository/photo_repository.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final BuildContext context;
  final photoRepository = PhotoRepository(Dio());

  PhotoBloc(this.context) : super(PhotoInitialState()) {
    on<PhotoLoadPhotosEvent>(_getData);
    add(PhotoLoadPhotosEvent());
  }

  void _getData(PhotoLoadPhotosEvent event, Emitter<PhotoState> emit) async {
    emit(PhotoInProgressState());

    final photoResponse = await photoRepository.getPhotos();
    final photoGroups = _groupPhotosByFirstLetter(photoResponse.photos);
    emit(PhotoListGroupsState(photoGroups: photoGroups));
    try {} catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Server error. Refresh page'),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 24),
            padding: EdgeInsets.all(16),
          ),
        );
      }
    }
  }

  List<PhotoGroup> _groupPhotosByFirstLetter(List<Photo> photos) {
    photos.sort((a, b) => a.photographer[0].compareTo(b.photographer[0]));

    Map<String, List<Photo>> groupedPhotos = {};

    for (var photo in photos) {
      String firstLetter = photo.photographer[0].toUpperCase();

      if (groupedPhotos.containsKey(firstLetter)) {
        groupedPhotos[firstLetter]!.add(photo);
      } else {
        groupedPhotos[firstLetter] = [photo];
      }
    }

    List<PhotoGroup> photoGroups = groupedPhotos.entries.map((entry) {
      return PhotoGroup(letter: entry.key, photos: entry.value);
    }).toList();

    return photoGroups;
  }
}
