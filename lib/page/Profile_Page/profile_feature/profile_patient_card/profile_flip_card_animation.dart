import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_patient_card/profile_back_card.dart';
import 'package:starlife/page/Profile_Page/profile_feature/profile_patient_card/profile_front_card.dart';

class ProfileFlipCardAnimation extends StatelessWidget {
  const ProfileFlipCardAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return FlipCard(
        direction: FlipDirection.HORIZONTAL,
        side: CardSide.FRONT,
        speed: 500,
        onFlipDone: (status) {
          print(status);
        },
        front: const ProfileFrontCard(),
        back: const ProfileBackCard(),
      );
  }
}