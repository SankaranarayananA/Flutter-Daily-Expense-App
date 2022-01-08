import 'package:daily_expense/presentations/add_page/add_page.dart';
import 'package:flutter/material.dart';



class ListPageFAB extends StatelessWidget {
  const ListPageFAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed:(){
       Navigator.of(context).pushReplacement(
           MaterialPageRoute (
             builder: (BuildContext context) => const AddTodoPage(),
           )
       );
      },
      backgroundColor: Colors.deepPurple,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}

