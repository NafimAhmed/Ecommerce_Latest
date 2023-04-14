import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';



class ArPage extends StatefulWidget
{
  const ArPage({Key? key}) : super(key: key);

  @override
  State<ArPage> createState() => _ArPageState();
}


class _ArPageState extends State<ArPage> {
  @override






  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:  Column(
          children: [

            Container(
              width: 350,
              height: 600,
              child:  WebView(
                zoomEnabled: true,

                initialUrl: "https://app.vectary.com/p/2l571y4goAjJBOQdDsS33q",
                javascriptMode: JavascriptMode.unrestricted,
              ) ,
            )

           ,


          ],
        ),
      )

     ,
    );
  }
}