

import 'package:daily_expense/controller/appdata.dart';
import 'package:daily_expense/controller/price_calculator.dart';
import 'package:flutter/material.dart';
import 'list_page_element.dart';
import 'list_page_fab.dart';
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
     bool isLoading= false;

  @override
  Widget build(BuildContext context) {

    return isLoading ?
     const Scaffold(
     body: Center(child: CircularProgressIndicator(color: Colors.black,),)
    ):

    Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          bottom:  10,
          right:  100,
          top: 100,
        ),
        child:Column(
          children:[
            const Text("Daily Expense",
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50,),


            Expanded(

              child:ListView.builder(
                itemBuilder: (context,index){
                  return Items(
                      item: AppData.getItems()[index],
                     deleteItem: (){
                        setState(() {
                          AppData.removeItems(index);
                        });
                     },
                  );
                },
                itemCount: AppData.getItems().length,
              ),
            ),
            Expanded(child: Text(" Total Expense: ₹ "+totalAmount().toString(),
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )),
          ],
        ),
      ),
      floatingActionButton: const ListPageFAB(),

    );
  }
}