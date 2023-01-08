import '../../data/models/character_model.dart';
import '../../data/models/quote.dart';

abstract class AppState {}

class AppInitial extends AppState {}

class CharactersLoadedState extends AppState {
  final List<CharacterModel> characters;

  CharactersLoadedState(this.characters);
}

class QuotesLoadedState extends AppState {
  final List<QuoteModel> quotes;

  QuotesLoadedState(this.quotes);
}