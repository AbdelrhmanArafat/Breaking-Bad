import 'app_state.dart';
import '../../data/models/character_model.dart';
import '../../data/models/quote.dart';
import '../../data/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  final Repository repository;
  List<CharacterModel> characters = [];
  List<QuoteModel> quotes = [];

  AppCubit(this.repository) : super(AppInitial());

  List<CharacterModel> getAllCharacters() {
    repository.getAllCharacters().then((characters) {
      emit(CharactersLoadedState(characters));
      this.characters = characters;
    });
    return characters;
  }

    List<QuoteModel> getCharactersQuotes(String characterName) {
    repository.getCharactersQuotes(characterName).then((quotes) {
      emit(QuotesLoadedState(quotes));
      this.quotes = quotes;
    });
    return quotes;
  }
}
