import 'package:daily_expense/controller/appdata.dart';
import 'package:daily_expense/models/item.dart';

 double totalAmount(){
   double amt=0;
   for(int i=0;i< AppData.getItems().length;i++){
     Item list = AppData.getItems()[i];
     amt+= list.amount();
   }
   return amt;
 }