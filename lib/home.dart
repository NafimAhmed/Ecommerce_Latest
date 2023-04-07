
import 'dart:async';
import 'dart:convert';
import 'dart:io';

//import 'package:brain_station_test/Event_Detail.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:leads_test/product_detail.dart';
import 'package:sizer/sizer.dart';
//import 'package:shared_preferences/shared_preferences.dart';








class Home extends StatefulWidget
{
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {



  Widget image_carousel=new Container(
      height: 270,
      width: 100.w,
      child: CarouselSlider(

        options: CarouselOptions(height: 250.0,

          aspectRatio: 16/9,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          // onPageChanged:BorderRadiusDirectional.circular(12.0),
          scrollDirection: Axis.horizontal,




        ),
        items: [
          "assets/img3.jpg",
          "assets/img4.png",
          "assets/img5.png",
        ].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: Colors.black
                  ),
                  child: Image.asset("${i}")//Text('text $i', style: TextStyle(fontSize: 16.0),)
              );
            },
          );
        }).toList(),
      )
  );

  // Timer.periodic(Duration(seconds: 1), (timer) {
  //
  // });

  File? img;
  Future getImage()async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(image==null)
    {
      return;
    }
    else{
      final temp=File(image.path);
      setState((){
        this.img=temp;
      });
    }

  }




//Map <String,dynamic>? sharedPreferenceMap;






  Map <String, dynamic>? apiMap;
  List<dynamic>? list,list1;

  Future getUserData() async
  {
    var response=await http.get(
        Uri.parse('https://fakestoreapi.com/products')
    );

    setState((){
      list = jsonDecode(response.body);

    });

    //print(list?.length);

  }


  @override
  Widget build(BuildContext context) {

    getUserData();
    //filter(Category);

    // var response=await http.get(
    //     Uri.parse('https://fakestoreapi.com/products')
    // );
    // list = jsonDecode(response.body);

    // TODO: implement build
    return list!=null? MaterialApp(
      home: Scaffold(

        appBar: AppBar(

          title: Row(
            children: [
              Text("Home"),

            ],
          )

        ),

          body: SingleChildScrollView(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              image_carousel,

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Category : "),
              ),

              Row(

                children: [

                  InkWell(
                    onTap: (){
                      //filter("emp");
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      child: Column(
                        children: [

                          Text("All",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),
                  ),


                  InkWell(onTap: (){
                    //filter("men's clothing");
                  },

                    child: Container(

                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: Column(
                        children: [
                          Image.asset("assets/shirt.png",
                            width: 60,
                            height: 40,
                          ),
                          Text("Men's wear")
                        ],
                      ),
                    ),

                  ),

                  InkWell(
                    onTap: (){
                      //filter("women's clothing");
                    },
                    child:Container(

                      child: Column(
                        children: [
                          Image.asset("assets/women.png",
                            width: 60,
                            height: 40,
                          ),
                          Text("Women's wear")
                        ],
                      ),
                    ) ,
                  ),

                  InkWell(
                    onTap: (){
                      //filter("jewelery");
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: Column(
                        children: [
                          Image.asset("assets/jwelary.png",
                            width: 60,
                            height: 40,
                          ),
                          Text("Jewellery")
                        ],
                      ),
                    ),
                  ),



                ],
              ),



              Card(
                child:
                ListView.builder(
                    itemCount: list?.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (_HomeState, index){



                      return ListTile(
                        leading: Image.network(list![index]['image'].toString()),
                        title: Text( list![index]['title'].toString()),//list![index]['actor']['id'].toString()),
                        subtitle: Text("Price :"+"${list![index]['price'].toString()}"),

                        onTap: (){


                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductDetail(
                                  description: "${list![index]['description'].toString()}",
                                  price: "${list![index]['price'].toString()}",
                                  title: "${list![index]['title'].toString()}",
                                  imgUrl: "${list![index]['image'].toString()}",
                                    id:"${list![index]['id'].toString()}"

                                );
                              },
                            ),
                          );


                        },

                      );

                      //Text(list![index]['id']);
                    }
                ),
              )
            ],
          ),),


        drawer: new Drawer(
          child: ListView(
            children: [
              new UserAccountsDrawerHeader(
                accountName: Text("Name"),
                accountEmail: Text("Email"),
                currentAccountPicture: GestureDetector(
                    child: InkWell(
                      onTap: (){
                        getImage();
                      },
                      child: CircleAvatar(
                        child: img!=null?Image.file(img!,width:50,height: 50,):Icon(Icons.person,size: 50,),
                        radius: 30,


                      ),
                    )

                ),
                decoration: new BoxDecoration(
                    color: Colors.pink
                ),



              ),

              ListTile(
                title: Text("home"),
                leading: Icon(Icons.home),
                onTap: (){

                },
              ),


              ListTile(
                title: Text("My Account"),
                leading: Icon(Icons.person),
                onTap: (){

                },
              ),


              ListTile(
                title: Text("My Orders"),
                leading: Icon(Icons.shopping_basket_rounded),
                onTap: (){

                },
              ),


              ListTile(
                title: Text("Catagories"),
                leading: Icon(Icons.dashboard),
                onTap: (){

                },
              ),


              ListTile(
                title: Text("Favorites"),
                leading: Icon(Icons.favorite),
                onTap: (){

                },
              ),



              // ListTile(
              //   title: Text("Favorites"),
              //   leading: Icon(Icons.favorite),
              //   onTap: (){
              //
              //   },
              // ),

              Divider(),

              ListTile(
                title: Text("Settings"),
                leading: Icon(Icons.settings),
                onTap: (){

                },
              ),


              ListTile(
                title: Text("About"),
                leading: Icon(Icons.help),
                onTap: (){

                },
              ),

              ListTile(
                title: Text("Share"),
                leading: Icon(Icons.share),
                onTap: (){

                },
              ),








            ],
          ),
        ),


      ),










    ):Scaffold(
        body: Center(
          child: Text("Loading-----------",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),


          ),
        )
    );
  }



  void filter(String txt)
  {

    int k=list!.length;

    if(txt=="emp"){
      list1=list;
    }
    else{
      for(int i=0;i<k;i++){

        if(list![i]['category'].toString()==txt){
          list1![i]=list![i];
        }

      }

    }



    setState((){
      list=list1;
    });







  }

  // @override
  // void initState() {
  //
  //   getUserData();
  //
  //   super.initState();
  //
  //
  // }
}


