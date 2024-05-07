import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is TransactionSuccess) {
          if (state.transactions.isEmpty) {
            return const Center(
              child: Text("Kamu belum memiliki transaksi"),
            );
          }

          return SafeArea(
            child: ListView.builder(
              itemCount: state.transactions.length,
              padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin, vertical: defaultMargin),
              itemBuilder: (context, index) {
                return TransactionCard(state.transactions[index]);
              },
            ),
          );
        }

        return const Center(
          child: Text("Transaction Page"),
        );
      },
    );
  }
}
