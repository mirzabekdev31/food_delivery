class Item{
  String? image;
  String? name;
  int? price;

  Item(this.image,this.name,this.price);

  static List<Item> item=[
    Item("assets/images/chili_pizza.jpg","Chili pizza", 34000),
    Item("assets/images/mushroom.jpg","Mushroom pizza", 45000),
    Item("assets/images/peperoin.jpg","Peperoin pizza", 50000),
    Item("assets/images/royality.jpg","Royality pizza", 66000),
    Item("assets/images/sausage.jpg","Sausage pizza", 77000),
    Item("assets/images/tomato.jpg","Tomato pizza", 88000),
    Item("assets/images/vectors.jpg","Vectories pizza", 100000),
  ];

}