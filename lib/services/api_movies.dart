import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rozrywka/models/movie.dart';
import 'package:rozrywka/models/series.dart';

class ApiMovies {
  static String key = '54e05f99';
  static String url = 'http://www.omdbapi.com/?apikey=$key';

  Future<Movie> searchMovie(String title) async {
    String type = "movie";
    var response = await http.get('$url&type=$type&t=$title');
    if (response.statusCode == 200) {
      print('$url&type=$type&t=$title');
      print("status code 200");
      var result = json.decode(response.body);
      print('result $result');
      if (result['Response'] == "True")
        return Movie.fromJson(result);
      else {
        //{"Response":"False","Error":"Movie not found!"}
        throw result;
      }
    } else if (response.statusCode == 404) {
      var result = response.body;
      throw (jsonDecode(result));
    } else {
      Map<String, dynamic> myError = {
        'Response': false,
        'Error': "Problem z internetem"
      };
      throw myError;
    }
    return null;
  }

  Future<Series> searchSeries(String title) async {
    String type = "series";
    return null;
  }
}
