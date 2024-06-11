import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CycleController extends GetxController {
  var informationList = [].obs;
  var topArticlesList = [].obs;
  var myplant = [].obs;
  late String uid;  // No need to initialize this here

  @override
  void onInit() {
    getTipsAndInformation();
    getTopArticles();
    getMyplant();
    super.onInit();
  }

  void getTipsAndInformation() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("TipsAndInformation").get();
    informationList.assignAll(querySnapshot.docs);
  }

  void getTopArticles() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("TopArticles").get();
    topArticlesList.assignAll(querySnapshot.docs);
  }

  Future<bool> fetchFavoriteState(String articleName) async {
    try {
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection("TopArticles");
      QuerySnapshot querySnapshot =
          await collectionReference.where("name", isEqualTo: articleName).get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot docSnapshot = querySnapshot.docs.first;
        bool favorite = docSnapshot.get("favorite");
        return favorite;
      } else {
        print("Article not found: $articleName");
        return false;
      }
    } catch (e) {
      print("Error fetching favorite state: $e");
      return false;
    }
  }

  Future<void> toggleFavorite(String articleName, bool currentFavorite) async {
    try {
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection("TopArticles");
      QuerySnapshot querySnapshot =
          await collectionReference.where("name", isEqualTo: articleName).get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentReference docRef = querySnapshot.docs.first.reference;
        bool newFavorite = currentFavorite;
        await docRef.update({"favorite": newFavorite});
        print("Favorite toggled successfully: $newFavorite");
      } else {
        print("Article not found: $articleName");
      }
    } catch (e) {
      print("Error toggling favorite: $e");
    }
  }

  Future<void> getMyplant() async {
    try {
      // Fetch documents from TipsAndInformation collection
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("TipsAndInformation").get();
      
      // Add fetched documents to myplant list
      myplant.assignAll(querySnapshot.docs);
      
      // Get the current user's ID
      uid = FirebaseAuth.instance.currentUser!.uid;

      // Reference to the user's document in the users collection
      DocumentReference userDoc = FirebaseFirestore.instance
          .collection('users')
          .doc(uid);

      // Create a list to hold the tips data
      List<Map<String, dynamic>> tipsData = [];

      // Extract data from each document and add to the tipsData list
      for (var doc in myplant) {
        tipsData.add(doc.data() as Map<String, dynamic>);
      }

      // Add the tips data to the myplant field in the user's document
      await userDoc.update({
        'myplant': FieldValue.arrayUnion(tipsData)
      });

      print('Tips added to myplant successfully');
    } catch (e) {
      print('Error adding tips to myplant: $e');
    }
  }
}
