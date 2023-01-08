import '../../data/models/character_model.dart';
import '../screens/characters_details_screen.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final CharacterModel characters;
  const CharacterItem({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          '${CharactersDetailsScreen(character: characters)}',
          arguments: characters,
        ),
        child: GridTile(
          footer: Hero(
            tag: characters.charId,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                characters.name,
                style: const TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          child: Container(
            color: Colors.grey,
            child: characters.image.isNotEmpty
                ? FadeInImage.assetNetwork(
                    width: double.infinity,
                    height: double.infinity,
                    placeholder: 'assets/images/loading.gif',
                    image: characters.image,
                    fit: BoxFit.cover,
                  )
                : Image.asset('assets/images/empty.gif'),
          ),
        ),
      ),
    );
  }
}
