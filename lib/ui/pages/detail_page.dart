import 'package:airplane/models/destination_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/choose_seat_page.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/interest_item.dart';
import 'package:airplane/ui/widgets/photo_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final NumberFormat idrCurrency = NumberFormat.currency(
  locale: 'id',
  symbol: 'IDR ',
  decimalDigits: 0,
);

class DetailPage extends StatelessWidget {
  final DestinationModel destination;

  const DetailPage(this.destination, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(destination.imageUrl),
          ),
        ),
      );
    }

    Widget customShadow() {
      return Container(
        width: double.infinity,
        height: 214,
        margin: const EdgeInsets.only(top: 236),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kWhiteColor.withOpacity(0),
              Colors.black.withOpacity(0.95),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
            vertical: defaultMargin, horizontal: defaultMargin),
        child: Column(
          children: [
            // NOTE : EMBLEM
            Container(
              width: 108,
              height: 24,
              margin: const EdgeInsets.only(
                top: 30,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icon-emblem.png"),
                ),
              ),
            ),

            // NOTE : TITLE
            Container(
              margin: const EdgeInsets.only(
                top: 256,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destination.name,
                          style: whiteTextStyle.copyWith(
                              fontSize: 24,
                              fontWeight: semiBold,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Text(
                          destination.city,
                          style: whiteTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: light,
                              overflow: TextOverflow.ellipsis),
                        ),
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
                    destination.rating.toString(),
                    style: whiteTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  )
                ],
              ),
            ),

            // NOTE : DESCRIPTION
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(
                top: 30,
                bottom: 105,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // NOTE : ABOUT
                  Text(
                    "About",
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),

                  // NOTE : PHOTOS
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.",
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      height: 2,
                    ),
                  ),

                  // NOTE : PHOTOS
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Photos",
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Row(
                    children: [
                      PhotoItem(
                        imageUrl: "assets/image-foto-1.png",
                        margin: EdgeInsets.only(right: 16),
                      ),
                      PhotoItem(
                        imageUrl: "assets/image-foto-2.png",
                        margin: EdgeInsets.only(right: 16),
                      ),
                      PhotoItem(
                        imageUrl: "assets/image-foto-3.png",
                        margin: EdgeInsets.only(right: 16),
                      )
                    ],
                  ),

                  // NOTE : INTEREST
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Interests",
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      InterestItem(
                        text: 'Kids Park',
                      ),
                      InterestItem(
                        text: 'Honor Bridge',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      InterestItem(
                        text: 'City Museum',
                      ),
                      InterestItem(
                        text: 'Central Mall',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget priceAndBookButton() {
      return Container(
        width: double.infinity,
        padding:
            const EdgeInsets.only(top: 20, bottom: 30, left: 50, right: 20),
        decoration: BoxDecoration(
          color: kBgColor,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    idrCurrency.format(destination.price),
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "per orang",
                    style: grayTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
                width: 170,
                title: "Book Now",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChooseSeatPage(
                          destination: destination,
                        ),
                      ));
                })
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBgColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                backgroundImage(),
                customShadow(),
                content(),
                // priceAndBookButton()
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0.0,
            right: 0.0,
            child: priceAndBookButton(),
          ),
        ],
      ),
    );
  }
}
