import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodapp/services/models.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Food>> getFoodItems() async {
    var ref = _db.collection('food_items');
    var snapshot = await ref.get();
    var data = snapshot.docs.map((s) => s.data());
    var food_items = data.map((d) => Food.fromJson(d));
    return food_items.toList();
  }
}
