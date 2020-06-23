import 'package:comicbook/features/comic_book/models/Credits.dart';
import 'package:comicbook/features/comic_book/models/ComicBookDetail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const BASE_URL = "https://comicvine.gamespot.com/api";
const API_KEY = '1ed7967e84b13642e18f74eae0c8e399d0ddbe9b';

Future<ComicBookDetail> getIssuesDetail(String id) async {
  try {
    var url = '${BASE_URL}/issue/4000-${id}/?api_key=${API_KEY}&format=json';

    var response = await http.get(url);
    Map responseData = json.decode(response.body);
    ComicBookDetail comicBookDetail =
        ComicBookDetail.fromJson(responseData["results"]);
    List characterCreditsJson = responseData["results"]["character_credits"];
    List<Credits> characterCredits = [];
    if (characterCreditsJson.length > 0) {
      characterCredits = characterCreditsJson
          .map((characterCreditsJson) => Credits.fromJson(characterCreditsJson))
          .toList();
    }
    comicBookDetail.characterCredits = characterCredits;

    List personCreditsJson = responseData["results"]["person_credits"];
    List<Credits> personCredits = [];
    if (personCreditsJson.length > 0) {
      personCredits = personCreditsJson
          .map((personCreditsJson) => Credits.fromJson(personCreditsJson))
          .toList();
    }
    comicBookDetail.personCredits = personCredits;

    List locationCreditsJson = responseData["results"]["location_credits"];
    List<Credits> locationCredits = [];
    if (personCreditsJson.length > 0) {
      locationCredits = locationCreditsJson
          .map((locationCreditsJson) => Credits.fromJson(locationCreditsJson))
          .toList();
    }
    comicBookDetail.locationCredits = locationCredits;

    List conceptCreditsJson = responseData["results"]["concept_credits"];
    List<Credits> conceptCredits = [];
    if (conceptCreditsJson.length > 0) {
      conceptCredits = conceptCreditsJson
          .map((conceptCreditsJson) => Credits.fromJson(conceptCreditsJson))
          .toList();
    }
    comicBookDetail.conceptCredits = conceptCredits;

    return comicBookDetail;
  } catch (e, stacktrace) {
    print("error1: ${e}");
    print(stacktrace);
    return null;
  }
}

Future<String> getImageCredit(String apiUrl) async {
  try {
    var url = '${apiUrl}?api_key=${API_KEY}&format=json';
    var response = await http.get(url);

    Map responseData = json.decode(response.body);
    String urlImage = responseData["results"]["image"]["original_url"];

    return urlImage;
  } catch (e, stacktrace) {
    print("error1: ${e}");
    print(stacktrace);
    return null;
  }
}
