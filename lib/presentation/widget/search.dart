// ignore_for_file: must_be_immutable

import 'package:breaking_bad/data/models/character_model.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final searchTextController = TextEditingController();
  late List<CharacterModel> allCharacters;
  late List<CharacterModel> searchForCharacter;

  Search({
    Key? key,
    required this.allCharacters,
    required this.searchForCharacter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchTextController,
      cursorColor: Colors.grey,
      decoration: const InputDecoration(
        hintText: 'Find a character',
        helperStyle: TextStyle(
          color: Colors.grey,
          fontSize: 18,
        ),
        border: InputBorder.none,
      ),
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 18,
      ),
      onChanged: (searchedCharacter) {
        addSearchedItemToSearchedList(searchedCharacter);
      },
    );
  }

  void addSearchedItemToSearchedList(String searchedCharacter) {
    searchForCharacter = allCharacters
        .where(
          (character) =>
              character.name.toLowerCase().startsWith(searchedCharacter),
        )
        .toList();
  }
}
