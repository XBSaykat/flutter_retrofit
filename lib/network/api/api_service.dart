import 'package:dio/dio.dart';
import 'package:flutter_retrofit/network/model/album_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class ApiService{
  factory ApiService(Dio dio) = _ApiService;

  @GET("photos")
  Future<List<AlbumModel>> getAll();

  static ApiService create(){
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return ApiService(dio);
  }

}