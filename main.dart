import 'package:flutter/material.dart';

class ExpenseList extends StatefulWidget {
  @override
  _ExpenseListState createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  List<Expense> _expenses = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _expenses.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(_expenses[index].id),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            setState(() {
              _expenses.removeAt(index);
            });
          },
          background: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 20.0),
            color: Colors.red,
            child: Icon(Icons.delete, color: Colors.white),
          ),
          child: Card(
            child: ListTile(
              title: Text(_expenses[index].title),
              subtitle: Text(_expenses[index].date),
              trailing: Text('\$${_expenses[index].amount}'),
            ),
          ),
        );
      },
    );
  }
}

class Expense {
  String id;
  String title;
  String date;
  double amount;

  Expense({this.id, this.title, this.date, this.amount});
}
