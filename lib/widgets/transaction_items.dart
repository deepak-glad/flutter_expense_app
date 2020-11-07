import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';



class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deletetx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deletetx;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;
  @override
  void initState() {
    const avalableColors=[
      Colors.red,
      Colors.amber,
      Colors.black,
      Colors.purple,
    ];
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        // leading: CircleAvatar(
        //   radius: 30,
        leading: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: FittedBox(
              child: Text(
                '\$ ${widget.transaction.amount}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
        ),
        trailing:MediaQuery.of(context).size.width > 360
        ? FlatButton.icon(
          icon: Icon(Icons.delete),
          label: Text('delete'),
          textColor:Theme.of(context).errorColor,
          onPressed:()=>widget.deletetx(widget.transaction.id),
        )
        : IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed:()=>widget.deletetx(widget.transaction.id),
        ),
      ),
    );
  }
}