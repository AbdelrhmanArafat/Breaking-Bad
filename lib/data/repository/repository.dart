import '../api/dio_helper.dart';
import '../models/character_model.dart';
import '../models/quote.dart';

class Repository {
  final DioHelper dioHelper;

  Repository(this.dioHelper);

  Future<List<CharacterModel>> getAllCharacters() async {
    final characters = await dioHelper.getAllCharacters();
    return characters
        .map(
          (character) => CharacterModel.fromJson(character),
        )
        .toList();
  }

    Future<List<QuoteModel>> getCharactersQuotes(String characterName) async {
    final quotes = await dioHelper.getCharactersQuotes(characterName);
    return quotes
        .map(
          (characterQuote) => QuoteModel.fromJson(characterQuote),
        )
        .toList();
  }
}
