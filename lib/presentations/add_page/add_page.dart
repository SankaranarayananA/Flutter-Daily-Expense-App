
import 'package:daily_expense/controller/appdata.dart';
import 'package:daily_expense/controller/price_calculator.dart';
import 'package:daily_expense/models/item.dart';
import 'package:daily_expense/presentations/list_page/list_page.dart';


import 'package:flutter/material.dart';
class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  String itemName="";
 int number = 1;
 double price =0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          bottom:  10,
          right:  100,
          top: 100,
        ),
        child:Column(
          children:[
            const Text("Add Item",
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50,),
           Padding(
             padding: const EdgeInsets.symmetric(
               horizontal: 40,
             ),
             child: TextFormField(

              decoration: const InputDecoration(
                hintText: "Type the Item",
              ),
               onChanged: (str){
                 setState(() {
                   itemName = str;
                 });

               },
             ),
           ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: TextFormField(

                decoration: const InputDecoration(
                  hintText: "Type the no of items",
                ),
                keyboardType: TextInputType.number,
                onChanged: (n){
                  setState(() {
                    number = int.parse(n);
                  });

                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: TextFormField(

                decoration: const InputDecoration(
                  hintText: "Type the Price",
                ),
                keyboardType: TextInputType.number,
                onChanged: (pr){
                  setState(() {
                    price = double.parse(pr);
                  });

                },
              ),
            )
          ],
        ),
      ),
        floatingActionButton:
        Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              left: 30,
              bottom: 20,
              child: FloatingActionButton(
                heroTag: 'back',
                onPressed: (){
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute (
                        builder: (BuildContext context) => const Homepage(),
                      )
                  );
                },
                backgroundColor: Colors.black,
                child: const Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.white,
                ),
              ),
            ),

            Positioned(
              right: 30,
              bottom: 20,
              child: FloatingActionButton(
                heroTag: 'save',
                onPressed: (){
                  if(itemName.isNotEmpty ) {
                    AppData.addItem(Item(name: itemName,num: number,price : price));
                    totalAmount();
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (
                              BuildContext context) => const Homepage(),
                        )
                    );
                  }
                },
                backgroundColor: Colors.black,
                child: const Icon(
                  Icons.save,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        )
    );
  }
}
