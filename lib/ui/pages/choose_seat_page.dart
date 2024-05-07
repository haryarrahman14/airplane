import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/models/destination_model.dart';
import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/checkout_page.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/seat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

final NumberFormat idrCurrency = NumberFormat.currency(
  locale: 'id',
  symbol: 'IDR ',
  decimalDigits: 0,
);

class ChooseSeatPage extends StatelessWidget {
  final DestinationModel destination;

  const ChooseSeatPage({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Text(
          "Select Your\nFavorite Seat",
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget status() {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // NOTE : AVAILABLE
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    margin: const EdgeInsets.only(),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/icon-available.png"),
                      ),
                    ),
                  ),
                  Text(
                    "Available",
                    style: blackTextStyle,
                  ),
                ],
              ),
            ),

            // NOTE : SELECTED
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    margin: const EdgeInsets.only(
                      left: 10,
                    ),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/icon-selected.png"),
                      ),
                    ),
                  ),
                  Text(
                    "Selected",
                    style: blackTextStyle,
                  ),
                ],
              ),
            ),

            // NOTE : UNAVAILABLE
            Expanded(
              child: Row(children: [
                Container(
                  width: 16,
                  height: 16,
                  margin: const EdgeInsets.only(
                    left: 10,
                  ),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/icon-unavailable.png"),
                    ),
                  ),
                ),
                Text(
                  "Unavailable",
                  style: blackTextStyle,
                ),
              ]),
            ),
          ],
        ),
      );
    }

    Widget selectSeat() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            // NOTE : SEAT INDICATORS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 48,
                  height: 48,
                  child: Text(
                    "A",
                    textAlign: TextAlign.center,
                    style: grayTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  width: 48,
                  height: 48,
                  child: Text(
                    "B",
                    textAlign: TextAlign.center,
                    style: grayTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  width: 48,
                  height: 48,
                  child: Text(
                    "",
                    textAlign: TextAlign.center,
                    style: grayTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  width: 48,
                  height: 48,
                  child: Text(
                    "C",
                    textAlign: TextAlign.center,
                    style: grayTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  width: 48,
                  height: 48,
                  child: Text(
                    "D",
                    textAlign: TextAlign.center,
                    style: grayTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),

            // NOTE : SEAT 1
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SeatItem(
                    id: "A1",
                    isAvailable: false,
                  ),
                  const SeatItem(
                    id: "B1",
                    isAvailable: false,
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "1",
                        style: grayTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SeatItem(
                    id: "C1",
                  ),
                  const SeatItem(
                    id: "D1",
                    isAvailable: false,
                  ),
                ],
              ),
            ),

            // NOTE : SEAT 2
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SeatItem(
                    id: "A2",
                  ),
                  const SeatItem(
                    id: "B2",
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "2",
                        style: grayTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SeatItem(
                    id: "C2",
                  ),
                  const SeatItem(
                    id: "D2",
                    isAvailable: false,
                  ),
                ],
              ),
            ),

            // NOTE : SEAT 3
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SeatItem(
                    id: "A3",
                  ),
                  const SeatItem(
                    id: "B3",
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "3",
                        style: grayTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SeatItem(
                    id: "C3",
                  ),
                  const SeatItem(
                    id: "D3",
                  ),
                ],
              ),
            ),

            // NOTE : SEAT 4
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SeatItem(
                    id: "A4",
                  ),
                  const SeatItem(
                    id: "B4",
                    isAvailable: false,
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "4",
                        style: grayTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SeatItem(
                    id: "C4",
                  ),
                  const SeatItem(
                    id: "D4",
                  ),
                ],
              ),
            ),

            // NOTE : SEAT 5
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SeatItem(
                    id: "A5",
                  ),
                  const SeatItem(
                    id: "B5",
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "5",
                        style: grayTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SeatItem(
                    id: "C5",
                    isAvailable: false,
                  ),
                  const SeatItem(
                    id: "D5",
                  ),
                ],
              ),
            ),

            // NOTE : YOUR SEAT
            BlocBuilder<SeatCubit, List<String>>(
              builder: (context, state) {
                return Container(
                  margin: const EdgeInsets.only(
                    top: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: Text(
                          "Your seat",
                          style: grayTextStyle.copyWith(
                            fontWeight: light,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          state.join(", "),
                          style: grayTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                          textAlign: TextAlign.right,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),

            // NOTE : TOTAL
            BlocBuilder<SeatCubit, List<String>>(
              builder: (context, state) {
                return Container(
                  margin: const EdgeInsets.only(
                    top: 18,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: grayTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      ),
                      Text(
                        idrCurrency.format(state.length * destination.price),
                        style: purpleTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      );
    }

    Widget checkoutButton() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return CustomButton(
            margin: const EdgeInsets.only(
              top: 30,
            ),
            title: "Continue to Checkout",
            onPressed: () {
              int price = destination.price * state.length;

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckoutPage(
                    transaction: TransactionModel(
                      destination: destination,
                      amountOfTraveler: state.length,
                      selectedSeats: state.join(', '),
                      insurance: true,
                      refundable: false,
                      price: price,
                      grandTotal: price + (price * 0.45).toInt(),
                      vat: 0.45,
                    ),
                  ),
                ),
              );
            },
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            title(),
            status(),
            selectSeat(),
            checkoutButton(),
          ],
        ),
      ),
    );
  }
}
