import 'package:flutter/material.dart';
import 'package:foodapp/home/food_item.dart';
import 'package:foodapp/services/firestore.dart';
import 'package:foodapp/services/models.dart';
import 'package:foodapp/shared/error.dart';
import 'package:foodapp/shared/loading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Food>>(
      future: FirestoreService().getFoodItems(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return ErrorMessage(
            message: snapshot.error.toString(),
          );
        } else if (snapshot.hasData) {
          var foods = snapshot.data!;

          return Scaffold(
            appBar: AppBar(
              title: Text('Food App'),
              backgroundColor: Colors.indigoAccent,
            ),
            body: GridView.count(
              primary: false,
              padding: EdgeInsets.all(20.0),
              crossAxisSpacing: 10.0,
              crossAxisCount: 2,
              children: foods.map((item) => FoodItem(item: item)).toList(),
            ),
          );
        } else {
          return const Center(
            child: Text('No food items found in the store.'),
          );
        }
      },
    );
  }
}
