import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_items.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deletetx;

  TransactionList(this.transactions,this.deletetx);

  @override
  Widget build(BuildContext context) {
    return Container(
      //for auto adjustments
      // height: MediaQuery.of(context).size.height*0.6,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                // Container(
                //     height: 200,
                //     child: Image.asset(
                //       'assets/images/waiting.png',
                //       fit: BoxFit.cover,
                //     )),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionItem(transaction: transactions[index], deletetx: deletetx);
              },
              itemCount: transactions.length,
            ),
    );
  }
}

