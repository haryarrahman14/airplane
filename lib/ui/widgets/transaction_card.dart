import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/checkout_details_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final NumberFormat idrCurrency = NumberFormat.currency(
  locale: 'id',
  symbol: 'Rp ',
  decimalDigits: 0,
);

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionCard(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
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
}
