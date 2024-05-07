import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/checkout_details_item.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

final NumberFormat idrCurrency = NumberFormat.currency(
  locale: 'id',
  symbol: 'Rp ',
  decimalDigits: 0,
);

class CheckoutPage extends StatelessWidget {
  final TransactionModel transaction;

  const CheckoutPage({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    Widget route() {
      return Container(
        margin: const EdgeInsets.only(
          top: 50,
          bottom: 10,
        ),
        child: Column(
          children: [
            Container(
              width: 291,
              height: 65,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/image-checkout.png"),
                ),
              ),
            ),
            SizedBox(
              width: 327,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CGK",
                        style: blackTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        "Tangerang",
                        style: grayTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "TLC",
                        style: blackTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        "Ciliwung",
                        style: grayTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget bookingDetails() {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
          right: 24,
          left: 24,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // NOTE : HEADER CHECKOUT
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(transaction.destination.imageUrl),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.destination.name,
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        transaction.destination.city,
                        style: grayTextStyle.copyWith(
                          fontWeight: light,
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
                    left: 6,
                    bottom: 6,
                  ),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/icon-star.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 1,
                ),
                Text(
                  transaction.destination.rating.toString(),
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                ),
              ],
            ),

            // NOTE : BOOKING DETAILS
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                "Booking Details",
                textAlign: TextAlign.start,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
            ),

            CheckoutDetailsItem(
              title: "Traveler",
              valueText: "${transaction.amountOfTraveler} person",
              valueColor: kBlackColor,
            ),

            CheckoutDetailsItem(
              title: "Seat",
              valueText: transaction.selectedSeats,
              valueColor: kBlackColor,
            ),

            CheckoutDetailsItem(
              title: "Insurance",
              valueText: transaction.insurance ? "YES" : "NO",
              valueColor: transaction.insurance ? kGreenColor : kRedColor,
            ),

            CheckoutDetailsItem(
              title: "Refundable",
              valueText: transaction.refundable ? "YES" : "NO",
              valueColor: transaction.refundable ? kGreenColor : kRedColor,
            ),

            CheckoutDetailsItem(
              title: "VAT",
              valueText: "${(transaction.vat * 100).toStringAsFixed(0)}%",
              valueColor: kBlackColor,
            ),

            CheckoutDetailsItem(
              title: "Price",
              valueText: idrCurrency.format(transaction.price),
              valueColor: kBlackColor,
            ),

            CheckoutDetailsItem(
              title: "Grand Total",
              valueText: idrCurrency.format(transaction.grandTotal),
              valueColor: kPrimaryColor,
            ),
          ],
        ),
      );
    }

    Widget paymentDetails() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 24,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(
                  18,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 16,
                    ),
                    child: Text(
                      "Payment Details",
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 70,
                        margin: const EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          image: const DecorationImage(
                            image: AssetImage("assets/image-card.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/icon-plane.png"),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                "Pay",
                                style: whiteTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: medium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            idrCurrency.format(state.user.balance),
                            style: blackTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: medium,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Current Balance',
                            style: grayTextStyle.copyWith(fontWeight: light),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          }

          return const SizedBox();
        },
      );
    }

    Widget payNowButton() {
      return BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {
          if (state is TransactionSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/success', (route) => false);
          } else if (state is TransactionFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: kRedColor,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is TransactionLoading) {
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: const CircularProgressIndicator(),
            );
          }
          return CustomButton(
            title: "Pay Now",
            onPressed: () {
              context.read<TransactionCubit>().createTransaction(transaction);
            },
            margin: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
          );
        },
      );
    }

    Widget tacButton() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        alignment: Alignment.center,
        child: Text(
          "Terms and Conditions",
          style: grayTextStyle.copyWith(
            fontSize: 16,
            fontWeight: light,
            decoration: TextDecoration.underline,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: ListView(
          children: [
            route(),
            bookingDetails(),
            paymentDetails(),
            payNowButton(),
            tacButton()
          ],
        ),
      ),
    );
  }
}
