
import 'package:daily_expense/controller/appdata.dart';
import 'package:daily_expense/models/item.dart';
import 'package:flutter/material.dart';


class Items extends StatefulWidget {
  const Items({
    Key? key,
    required this.item,
    required this.deleteItem,
  }) : super(key: key);

  final Item item;
  final Function deleteItem;
  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color: Colors.grey.shade200,
        border: const Border(
          left: BorderSide(
            color: Colors.black,
            width: 3,
          ),
        ) ,
      ),
      padding:const EdgeInsets.all(0),
      child: Row(
        children:[
          const SizedBox(width:  10,),
          Flexible(child: Text(widget.item.name,)),
          const SizedBox(width:  10,),
         Flexible(child: Text("Cost :" + ((widget.item.num)*(widget.item.price)).toString())),
         const Spacer(),
        IconButton(
            color: Colors.red,
            onPressed: () =>
               {
               widget.deleteItem()

              },


            icon: const Icon(Icons.delete_outline),
        ),



        ]
      ),
    );
  }


}

