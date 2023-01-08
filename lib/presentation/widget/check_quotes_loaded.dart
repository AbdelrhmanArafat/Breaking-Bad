import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../bloc/cubit/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckQuotesLoaded extends StatelessWidget {
  final AppState state;
  const CheckQuotesLoaded({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (context, state) {
        if (state is QuotesLoadedState) {
          var quotesList = state.quotes;
          if (quotesList.isNotEmpty) {
            int randomQuotesIndex = Random().nextInt(quotesList.length - 1);
            return Center(
              child: DefaultTextStyle(
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 7,
                      color: Colors.yellow,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    FlickerAnimatedText(quotesList[randomQuotesIndex].quote),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.yellow,
            ),
          );
        }
      },
    );
  }
}
