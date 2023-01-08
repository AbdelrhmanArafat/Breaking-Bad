import '../../bloc/cubit/app_cubit.dart';
import '../../bloc/cubit/app_state.dart';
import '../../data/models/character_model.dart';
import '../widget/character_item.dart';
import '../widget/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  final searchTextController = TextEditingController();
   List<CharacterModel> allCharacters = [];
   List<CharacterModel> searchForCharacter = [];
  bool isSearching = false;
  List<Widget> buildAppBarActions() {
    if (isSearching) {
      return [
        IconButton(
          onPressed: () {
            clearSearch();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.clear,
            color: Colors.grey,
          ),
        )
      ];
    } else {
      return [
        IconButton(
          onPressed: () {
            startSearch();
          },
          icon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
        )
      ];
    }
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AppCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: isSearching
            ? const BackButton(
                color: Colors.grey,
              )
            : Container(),
        title: isSearching
            ? Search(
                allCharacters: allCharacters,
                searchForCharacter: searchForCharacter,
              )
            : const Text(
                'Characters',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
        actions: buildAppBarActions(),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return BlocBuilder<AppCubit, AppState>(
              builder: (context, state) {
                if (state is CharactersLoadedState) {
                  allCharacters = state.characters;
                  return SingleChildScrollView(
                    child: Container(
                      color: Colors.grey,
                      child: Column(
                        children: [
                          GridView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2 / 3,
                              crossAxisSpacing: 1,
                              mainAxisSpacing: 1,
                            ),
                            itemBuilder: (context, index) {
                              return CharacterItem(
                                characters: searchTextController.text.isEmpty
                                    ? allCharacters[index]
                                    : searchForCharacter[index],
                              );
                            },
                            itemCount: searchTextController.text.isEmpty
                                ? allCharacters.length
                                : searchForCharacter.length,
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.yellow,
                    ),
                  );
                }
              },
            );
          } else {
            return Center(
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'can\'t connect ... check the internet please',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.grey,
                      ),
                    ),
                    Image.asset('assets/images/no_internet.png'),
                  ],
                ),
              ),
            );
          }
        },
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.yellow,
          ),
        ),
      ),
    );
  }

  void startSearch() {
    ModalRoute.of(context)!.addLocalHistoryEntry(
      LocalHistoryEntry(
        onRemove: stopSearch,
      ),
    );
    setState(() {
      isSearching = true;
    });
  }

  void stopSearch() {
    clearSearch();
    setState(() {
      isSearching = false;
    });
  }

  void clearSearch() {
    setState(() {
      searchTextController.clear();
    });
  }
}
