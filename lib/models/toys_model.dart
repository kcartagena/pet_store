class ToysModel {
  String name;
  String imgPath;
  double rating;
  int price;
  bool viewIsSelected;

  ToysModel({
    required this.name,
    required this.imgPath,
    required this.rating,
    required this.price,
    required this.viewIsSelected
  });

  static List<ToysModel> getToys() {
    List<ToysModel> toys = [];

    toys.add(
      ToysModel(
        name: "Ball pit", 
        imgPath: "assets/ball-pit.jpg", 
        rating: 4.5, 
        price: 20, 
        viewIsSelected: true,
        )
    );    
    toys.add(
      ToysModel(
        name: "Cat tower", 
        imgPath: "assets/cat-tower.jpg", 
        rating: 4.4, 
        price: 25, 
        viewIsSelected: false,
        )
    );    
    toys.add(
      ToysModel(
        name: "Dog toys set", 
        imgPath: "assets/dog-toys.jpg", 
        rating: 5.0, 
        price: 30, 
        viewIsSelected: false,
        )
    );    
    toys.add(
      ToysModel(
        name: "Stuffed animal", 
        imgPath: "assets/dogs.jpg", 
        rating: 4.7, 
        price: 10, 
        viewIsSelected: false,
        )
    );

    return toys;
  }
}