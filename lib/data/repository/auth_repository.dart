import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_assignment_lanars/data/models/user_profile.dart';

part 'auth_repository.g.dart';

@RestApi(baseUrl: 'https://randomuser.me/api/')
abstract class AuthRepository {
  factory AuthRepository(Dio dio, {String baseUrl}) = _AuthRepository;

  @GET('/')
  Future<UserProfile> getUserProfile(@Body() Map<String, dynamic> body);
}
