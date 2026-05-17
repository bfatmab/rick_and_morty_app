import 'package:flutter/material.dart';
import 'package:rickandmorty_app/app/getit.dart';
import 'package:rickandmorty_app/models/characters_model.dart';
import 'package:rickandmorty_app/services/api_service.dart';

class CharactersViewModel extends ChangeNotifier {
  final _apiService = locator<ApiService>();

  CharactersModel? _characterModel;
  CharactersModel? get charactersModel => _characterModel;

  void clearCharacters() {
    _characterModel = null;
    currentPageIndex = 1;
    notifyListeners();
  }

  void getCharacter() async {
    _characterModel = await _apiService.getCharacters();
    notifyListeners();
  }

  bool loadMore = false;
  int currentPageIndex = 1;

  void setloadMore(bool value) {
    loadMore = value;
    notifyListeners();
  }

  void getCharactersMore() async {
    if (loadMore) return;
    if (_characterModel!.info.pages == currentPageIndex) return;

    loadMore = true;
    setloadMore(true);
    final data = await _apiService.getCharacters(
      url: _characterModel?.info.next,
    );

    setloadMore(false);
    currentPageIndex++;
    _characterModel!.info = data.info;
    _characterModel!.results.addAll(data.results);

    notifyListeners();
  }

  void getCharactersByname(String name) async {
    clearCharacters();
    _characterModel = await _apiService.getCharacters(args: {name: name});
    notifyListeners();
  }
}
