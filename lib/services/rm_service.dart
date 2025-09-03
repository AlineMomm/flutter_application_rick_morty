import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_rick_morty/models/character.dart';
import 'package:http/http.dart' as http;

class RmService {
  String url = 'https://rickandmortyapi.com/api/character';

  Future<List<Character>> fetchCharacters() async {
    final uri = Uri.parse(url);

    final response = await http.get(uri);

    if(response.statusCode == 200){
      final Map<String, dynamic> json = jsonDecode(response.body);
      final results = json['results'];

      final characters = results
          .map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList();

      return characters;
          
    } else {
      debugPrint("[${response.statusCode}] Não foi posível buscar os dados da API\n");
      return [];
    }
  }
}