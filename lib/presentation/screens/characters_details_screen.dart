import '../../bloc/cubit/app_cubit.dart';
import '../../bloc/cubit/app_state.dart';
import '../widget/character_information.dart';
import '../widget/check_quotes_loaded.dart';
import '../widget/custom_divider.dart';
import 'package:flutter/material.dart';
import '../../data/models/character_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersDetailsScreen extends StatelessWidget {
  final CharacterModel character;
  const CharactersDetailsScreen({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AppCubit>(context).getCharactersQuotes(character.name);
    return Scaffold(
      backgroundColor: Colors.grey,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 600,
            pinned: true,
            stretch: true,
            backgroundColor: Colors.grey,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                character.nickName,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              background: Hero(
                tag: character.charId,
                child: Image.network(
                  character.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //name
                      CharacterInformation(
                        title: 'name: ',
                        value: character.name,
                      ),
                      CustomDivider(
                        endIndent: 300,
                      ),
                      //birthday
                      CharacterInformation(
                        title: 'birthday: ',
                        value: character.birthday,
                      ),
                      CustomDivider(
                        endIndent: 280,
                      ),
                      //job
                      CharacterInformation(
                        title: 'Job: ',
                        value: character.occupation.join(' / '),
                      ),
                      CustomDivider(
                        endIndent: 315,
                      ),
                      //appeared in
                      CharacterInformation(
                        title: 'Appeared in: ',
                        value: character.category,
                      ),
                      CustomDivider(
                        endIndent: 250,
                      ),
                      //braking bad sessions
                      CharacterInformation(
                        title: 'braking bad sessions: ',
                        value: character.appearanceOfBreakingBad.join(' / '),
                      ),
                      CustomDivider(
                        endIndent: 180,
                      ),
                      //status
                      CharacterInformation(
                        title: 'status: ',
                        value: character.status,
                      ),
                      CustomDivider(
                        endIndent: 300,
                      ),
                      character.appearanceOfBetterCallSaul.isEmpty
                          ? Container()
                          : CharacterInformation(
                              title: 'better call saul sessions: ',
                              value: character.appearanceOfBetterCallSaul
                                  .join(' / '),
                            ),
                      character.appearanceOfBetterCallSaul.isEmpty
                          ? Container()
                          : CustomDivider(
                              endIndent: 150,
                            ),
                      //Actor/Actress
                      CharacterInformation(
                        title: 'Actor/Actress: ',
                        value: character.portrayed,
                      ),
                      CustomDivider(
                        endIndent: 235,
                      ),
                      const SizedBox(height: 20),
                      BlocBuilder<AppCubit, AppState>(
                        builder: (context, state) {
                          return CheckQuotesLoaded(state: state);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
