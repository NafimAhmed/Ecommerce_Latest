


import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatelessWidget{

  final String name,id,price,quantity;

  const CheckOut({super.key, required this.name, required this.id, required this.price, required this.quantity});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    double pricedb=double.parse(price.toString());
    double qntt=double.parse(quantity.toString());

    double ttl=pricedb*qntt;



    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(height: 30,),
          Text("Product Name : $name ",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),

          ),

          SizedBox(height: 10,),

          Text("Product ID : $id",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400
            ),
          ),

          SizedBox(height: 20,),


          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Product Quantity : "),
            Text("$quantity"),

          ],
          ),

          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Unit Price : "),
              Text("$price"),

            ],
          ),


          Divider(thickness: 2,),

          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total Amount : "),
              Text("${ttl.toString()}"),

            ],
          ),




          SizedBox(height: 30,),


          ElevatedButton(
              onPressed:() {},
              child: Text("Proceed To Pay")
          )


        ],
      )),



    );
  }

}