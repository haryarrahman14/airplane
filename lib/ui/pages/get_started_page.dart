import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                "assets/image-get-started.png",
              ),
              fit: BoxFit.cover
            )),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Fly Like a Bird",
                  style: whiteTextStyle.copyWith(
                    fontSize: 32,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  "Explore new world with us and let\nyourself get an amazing experiences",
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: regular,
                  ),
                  textAlign: TextAlign.center,
                ),
                CustomButton(
                    width: 220,
                    margin: const EdgeInsets.only(top: 50, bottom: 80),
                    title: "Get Started",
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign-up');
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
