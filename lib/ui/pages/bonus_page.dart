import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

final NumberFormat idrCurrency = NumberFormat.currency(
  locale: 'id',
  symbol: 'Rp ',
  decimalDigits: 0,
);

class BonusPage extends StatelessWidget {
  const BonusPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget bonusCard() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              height: 211,
              width: 300,
              padding: EdgeInsets.all(defaultMargin),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/image-card.png'),
                ),
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryColor.withOpacity(0.5),
                    blurRadius: 50,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name",
                              style: whiteTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: light,
                              ),
                            ),
                            Text(
                              state.user.name,
                              style: whiteTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: medium,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        margin: const EdgeInsets.only(
                          right: 6,
                        ),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icon-plane.png'),
                          ),
                        ),
                      ),
                      Text(
                        "Pay",
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 41,
                  ),
                  Text(
                    "Balance",
                    style: whiteTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: light,
                    ),
                  ),
                  Text(
                    idrCurrency.format(state.user.balance),
                    style: whiteTextStyle.copyWith(
                      fontSize: 26,
                      fontWeight: medium,
                    ),
                  )
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      );
    }

    Widget title() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.only(
              top: 80,
            ),
            child: Text(
              'Big Bonus 🎉',
              style: blackTextStyle.copyWith(
                fontSize: 32,
                fontWeight: semiBold,
              ),
            ),
          );
        },
      );
    }

    Widget subtitle() {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Text(
          'We give you early credit so that\nyou can buy a flight ticket',
          textAlign: TextAlign.center,
          style: grayTextStyle.copyWith(
            fontSize: 16,
            fontWeight: light,
          ),
        ),
      );
    }

    Widget startButton() {
      return CustomButton(
          width: 220,
          margin: const EdgeInsets.only(top: 50),
          title: "Start Fly Now",
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/main',
              (route) => false,
            );
          });
    }

    return Scaffold(
      backgroundColor: kBgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [bonusCard(), title(), subtitle(), startButton()],
        ),
      ),
    );
  }
}