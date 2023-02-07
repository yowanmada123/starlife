import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:starlife/page/Profile/list_feature/Kartu_pasien/back_card.dart';
import 'package:starlife/page/Profile/list_feature/Kartu_pasien/front_card.dart';

class FlipCardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlipCard(
        direction: FlipDirection.HORIZONTAL,
        side: CardSide.FRONT,
        speed: 500,
        onFlipDone: (status) {
          print(status);
        },
        front: FrontCard(),
        back: BackCard(),
      );
  }
}