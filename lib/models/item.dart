

class Item{
  String name;
  int num;
  double price;
Item({required this.name, this.num = 1 , required this.price});

  double amount(){
  return price*num ;
}
factory Item.fromJson(Map<String,dynamic>data) => Item(name: data["name"], num: data["num"],price: data["price"]);
  Map<String,dynamic> toJson() =>{
    'name': name,
    'num' : num,
    'price': price
  };
}