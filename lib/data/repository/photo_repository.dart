import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_assignment_lanars/data/models/photo.dart';

part 'photo_repository.g.dart';

@RestApi()
abstract class PhotoRepository {
  factory PhotoRepository(Dio dio,
      {String baseUrl = 'https://api.pexels.com/v1/'}) {
    dio.options.headers = {
      'Authorization':
          'oAE0vUY1aWn1GwYyL1ex8nFWq74oBkh1MNPq35iRClsIbmc03co5gTdN',
    };
    return _PhotoRepository(dio, baseUrl: baseUrl);
  }

  @GET('/curated?per_page=50')
  Future<PhotoResponse> getPhotos();
}

class PhotoResponse {
  final List<Photo> photos;

  PhotoResponse({
    required this.photos,
  });

  factory PhotoResponse.fromJson(Map<String, dynamic> json) {
    final photosJson = json['photos'] as List;
    final photos = photosJson.map((json) {
      return Photo.fromJson(json);
    }).toList();
    return PhotoResponse(photos: photos);
  }
}
