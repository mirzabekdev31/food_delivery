class Item{
  String? image;
  String? name;
  int? price;

  Item(this.image,this.name,this.price);

  static List<Item> item=[
    Item("assets/images/pizzaa.jpg","PIZZAS", 34000),
    Item("assets/images/boshqa.jpg","Boshqa fast foodlar", 45000),
  ];

}