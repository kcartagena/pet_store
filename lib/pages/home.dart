import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_store/models/category_model.dart';
import 'package:pet_store/models/toys_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModel> categories = [];
  List<ToysModel> toys = [];

  void getCategories() {
    categories = CategoryModel.getCategories();
  }

  void getToys() {
    toys = ToysModel.getToys();
  }

  void getInitialInfo() {
    categories = CategoryModel.getCategories();
    toys = ToysModel.getToys();
  }

  @override
  Widget build(BuildContext context) {
    getInitialInfo();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              searchField(),
              SizedBox(
                height: 40,
              ),
              categoriesSection(),
              SizedBox(
                height: 40,
              ),
              bestSellersSection(),
            ],
          ),
        ),
      ),
    );
  }

  Column bestSellersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Best sellers',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 300,
          child: ListView.separated(
            itemCount: toys.length,
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            separatorBuilder: (context, index) => SizedBox(
              height: 25,
            ),
            itemBuilder: (context, index) {
              return Container(
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(toys[index].imgPath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      toys[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '\$${toys[index].price}',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '${toys[index].rating.toString()} stars',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Column categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Category',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 150,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            separatorBuilder: (context, index) => SizedBox(
              width: 25,
            ),
            itemBuilder: (context, index) {
              return Container(
                width: 150,
                decoration: BoxDecoration(
                  color: categories[index].boxColor.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(categories[index].iconPath),
                      ),
                    ),
                    Text(
                      categories[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Container searchField() {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(44, 30, 24, 24),
            blurRadius: 40,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(15),
          hintText: 'Search here',
          hintStyle: TextStyle(
            color: Color.fromARGB(50, 12, 15, 19),
            fontSize: 14,
          ),
          prefixIcon: Icon(Icons.search_rounded),
          suffixIcon: SizedBox(
            width: 100,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  VerticalDivider(
                    color: Colors.black,
                    indent: 10,
                    endIndent: 10,
                    thickness: 0.1,
                  ),
                  Icon(Icons.filter_alt_outlined),
                ],
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text('Pet Store'),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.5,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.more_horiz),
        ),
      ],
    );
  }
}
