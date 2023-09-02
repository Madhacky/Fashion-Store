import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learn_provider/constants/ProductList.dart';
import 'package:learn_provider/model/ProductModel.dart';

class ProviderClass extends ChangeNotifier {
  var copyProductList = allproduct;
  int cartTotal = 0;
  List<productModel> cartlist = [];

  //add product
  void addProduct(productModel model) {
    if (cartlist.isEmpty) {
      cartlist.add(model);
      cartTotal = cartTotal + model.price;
      allproduct[allproduct.indexOf(model)].quantity++;
    } else if (cartlist.contains(model)) {
      cartlist.forEach((element) {
        if (element.name == model.name) {
          Fluttertoast.showToast(
              msg: "product already in cart",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      });
    } else {
      cartlist.add(model);
      cartTotal = cartTotal + model.price;
      allproduct[allproduct.indexOf(model)].quantity++;
    }

    notifyListeners();
  }

//increase quantity
  void increasequantity(productModel model) {
    allproduct.forEach((element) {
      if (element.name == model.name) {
        cartTotal = cartTotal + model.price;
        allproduct[allproduct.indexOf(element)].quantity++;

        print(allproduct[allproduct.indexOf(element)].quantity);

        notifyListeners();
      }
    });
  }

//decrease quantity
  void decreasequantity(productModel model) {
    allproduct.forEach((element) {
      if (element.name == model.name) {
        cartTotal = cartTotal - model.price;
        allproduct[allproduct.indexOf(element)].quantity--;

        print(allproduct[allproduct.indexOf(element)].quantity);

        notifyListeners();
      }
    });
  }

  //clear cart

  void clearCart() {
    cartlist.clear();
    searchresult.clear();
    cartTotal = 0;
    allproduct.forEach((element) {
      element.quantity = 0;
    });
    searchresult.forEach((element){
        element.quantity = 0;
    });
    notifyListeners();
  }

  //search
  List<productModel> searchresult = [];

  onSearchTextChanged(String text) async {
    print(text);
    searchresult.clear();
    if (text.isEmpty) {
      // Check textfield is empty or not
 notifyListeners();
      return;
    }

    allproduct.forEach((data) {
      print("okk");
      if (data.name.contains(text.toUpperCase()) ) {
        searchresult.add(
            data); 
            print(data);
            // If not empty then add search data into search data list
      } 
       notifyListeners();
      
      
      // else {
      //   print(data.name);
      //   print('error');
      //   return;
      // }
    });

   
  }
}
