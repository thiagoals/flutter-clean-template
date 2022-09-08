import 'package:dio/dio.dart';

class Datasource<T>{
  late Response response;
  Dio dio = Dio();
  String basePath = "https://reqres.in/api";

  Future<T> get(String suffix) async{
    this.response = await dio.get("$basePath/$suffix");
    return(response.data);
  }

  Future<Map<String, dynamic>> post(String suffix, T body) async{
    this.response = await dio.post("$basePath/$suffix", data: body);
    return response.data;
  }

  Future<T> put(String suffix, T body) async{
    this.response = await dio.put("$basePath/$suffix", data: body);
    return (response.data);
  }

  Future<T> patch(String suffix, T body) async{
    this.response = await dio.patch("$basePath/$suffix", data: body);
    return (response.data);
  }

  Future<T> delete(String suffix, T body) async{
    this.response = await dio.delete("$basePath/$suffix", data: body);
    return (response.data);
  }
}