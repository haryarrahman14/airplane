import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessCheckoutPage extends StatelessWidget {
  const SuccessCheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, int>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: kBgColor,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 150,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/image-success.png"),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 80),
                    child: Column(
                      children: [
                        Text(
                          "Well Booked 😍",
                          style: blackTextStyle.copyWith(
                            fontSize: 32,
                            fontWeight: semiBold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Are you ready to explore the new\nworld of experiences?",
                          textAlign: TextAlign.center,
                          style: grayTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: light,
                          ),
                        )
                      ],
                    ),
                  ),
                  CustomButton(
                    title: "My Bookings",
                    onPressed: () {
                      context.read<PageCubit>().setPage(1);
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/main',
                        (route) => false,
                      );
                    },
                    width: 220,
                    margin: const EdgeInsets.only(top: 50),
                  )
                ],
              ),
            ));
      },
    );
  }
}
