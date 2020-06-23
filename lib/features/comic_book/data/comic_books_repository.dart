import 'package:comicbook/features/comic_book/models/ComicBook.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const BASE_URL = "https://comicvine.gamespot.com/api";
const API_KEY = '1ed7967e84b13642e18f74eae0c8e399d0ddbe9b';

Future<List<ComicBook>> getIssues() async {
  try {
    var url = '${BASE_URL}/issues/?api_key=${API_KEY}&format=json';

    var response = await http.get(url);

    Map responseData = json.decode(response.body);
    List booksJson = responseData["results"];
    List<ComicBook> books = List();
    if (booksJson.length > 0) {
      books =
          booksJson.map((bookJson) => ComicBook.fromJson(bookJson)).toList();
    }

    return books;
  } catch (e, stacktrace) {
    print("error1: ${e}");
    print(stacktrace);
    return List();
  }
}
/*
Future<List<ComicBook>> getBooksByQuery(String query, int page) async {
  try {
    var url = "${BASE_URL}/search/${query}?page=${page}";

    var response = await http.get(url);

    Map responseData = json.decode(response.body);
    List booksJson = responseData["books"];
    List<ComicBook> books = List();
    if (booksJson.length > 0) {
      books =
          booksJson.map((bookJson) => ComicBook.fromJson(bookJson)).toList();
    }

    return books;
  } catch (e) {
    print("error: ${e}");
    return List();
  }
}

Future<ComicBook> getBookDetails(String isbn13) async {
  try {
    var url = "${BASE_URL}/books/${isbn13}";
    print("La url es: ${url}");
    var response = await http.get(url);
    Map responseData = json.decode(response.body);
    print(responseData);
    return ComicBook.fromJson(responseData);
  } catch (e, stacktrace) {
    print("error1: ${e}");
    print(stacktrace);
    return ComicBook();
  }
}*/
