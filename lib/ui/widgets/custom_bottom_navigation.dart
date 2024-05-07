import 'package:airplane/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class CustomBottomNavigationItem extends StatelessWidget {
  final int id;
  final String imageUrl;
  final bool isSelected;

  const CustomBottomNavigationItem({
    super.key,
    required this.id,
    required this.imageUrl,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(id);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Image.asset(
            imageUrl,
            width: 24,
            height: 24,
            color: context.watch<PageCubit>().state == id
                ? kPrimaryColor
                : kGrayColor,
          ),
          Container(
            width: 30,
            height: 2,
            decoration: BoxDecoration(
                color: context.watch<PageCubit>().state == id
                    ? kPrimaryColor
                    : kTransparentColor,
                borderRadius: BorderRadius.circular(18)),
          )
        ],
      ),
    );
  }
}
