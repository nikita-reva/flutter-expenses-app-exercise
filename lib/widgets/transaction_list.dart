import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransaction;

  TransactionList(this.userTransactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  const Text(
                    'No Transactions added yet',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView(
            children: userTransactions
                .map(
                  (tx) => TransactionItem(
                    key: ValueKey(tx.id),
                    transaction: tx,
                    deleteTransaction: deleteTransaction,
                  ),
                )
                .toList(),
          );
    // : ListView.builder(
    //     itemBuilder: (ctx, index) {
    //       return TransactionItem(
    //         transaction: userTransactions[index],
    //         deleteTransaction: deleteTransaction,
    //       );
    //     },
    //     itemCount: userTransactions.length,
    //     // return Card(
    //     //   child: Row(
    //     //     children: <Widget>[
    //     //       Container(
    //     //         margin: EdgeInsets.symmetric(
    //     //           vertical: 10,
    //     //           horizontal: 15,
    //     //         ),
    //     //         padding: EdgeInsets.all(10),
    //     //         decoration: BoxDecoration(
    //     //           border: Border.all(
    //     //             color: Theme.of(context).primaryColor,
    //     //             width: 2,
    //     //           ),
    //     //         ),
    //     //         child: Text(
    //     //           '\$${userTransactions[index].amount.toStringAsFixed(2)}',
    //     //           style: TextStyle(
    //     //             fontWeight: FontWeight.bold,
    //     //             fontSize: 20,
    //     //             color: Theme.of(context).primaryColor,
    //     //           ),
    //     //         ),
    //     //       ),
    //     //       Column(
    //     //         crossAxisAlignment: CrossAxisAlignment.start,
    //     //         children: <Widget>[
    //     //           Text(
    //     //             userTransactions[index].title,
    //     //             style: TextStyle(
    //     //               fontWeight: FontWeight.bold,
    //     //               fontSize: 16,
    //     //             ),
    //     //           ),
    //     //           Text(
    //     //             DateFormat.yMMMd()
    //     //                 .format(userTransactions[index].date),
    //     //             style: TextStyle(
    //     //               color: Colors.grey,
    //     //             ),
    //     //           ),
    //     //         ],
    //     //       )
    //     //     ],
    //     //   ),
    //     // );
  }
}
