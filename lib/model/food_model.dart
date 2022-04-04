class MyFood{
  String? pizzaName;
  int? price;
  String? imageUrl;


  MyFood(this.pizzaName,this.price,this.imageUrl);

  MyFood.fromJson(Map<String, dynamic> data)
      : pizzaName = data['pizzaName'],
        price = data['price'],
        imageUrl = data['imageUrl'];


  Map<String, dynamic> toJson() {
    return {
      'pizzaName': pizzaName,
      'price': price,
      'imageUrl': imageUrl,
    };
  }


}