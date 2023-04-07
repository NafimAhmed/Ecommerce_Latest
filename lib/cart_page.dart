

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class CartPage extends StatefulWidget
{
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}


class _CartPageState extends State<CartPage>{


  List<dynamic>? list,list1;

  Future getUserData() async
  {
    var response=await http.get(
        Uri.parse('https://fakestoreapi.com/carts')
    );

    setState((){
      list = jsonDecode(response.body);

    });

    //print(list?.length);

  }





  @override
  Widget build(BuildContext context) {

    getUserData();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context,int Index){
                  return ListTile(
                    leading: Image.asset("assets/img3.jpg"),
                    title: Text("Product Name"),
                    subtitle: Column(
                      children: [
                        Text("Product Quantity"),
                        Text("Product price"),
                      ],
                    ),
                  );
                }
            )
          ],
        ),
      )
    );
  }

}