import 'package:flutter/material.dart';
import 'package:flutter_application_rick_morty/models/character.dart';
import 'package:flutter_application_rick_morty/services/rm_service.dart';

class CharacterListViewmodel extends ChangeNotifier{
  final RmService _rmService = RmService();
  List<Character> _characters = [];

  List<Character> get characters => _characters;

  fetchCharacters() async {
    _characters = await _rmService.fetchCharacters();
    notifyListeners();
  }
}
