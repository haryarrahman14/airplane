import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CheckoutDetailsItem extends StatelessWidget {
  final String title;
  final String valueText;
  final Color valueColor;

  const CheckoutDetailsItem(
      {super.key,
      required this.title,
      required this.valueText,
      required this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 16,
      ),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icon-check.png"),
              ),
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          Container(
            margin: const EdgeInsets.only(
              right: 10,
            ),
            child: Text(
              title,
              style: blackTextStyle,
            ),
          ),
          Expanded(
            child: Text(
              valueText,
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                color: valueColor,
              ),
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
