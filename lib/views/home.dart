
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../helpers/constant.dart';
class Home extends StatefulWidget {
  const Home( {Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  int currentPos = 0;
  List<String> listPaths = [
    "assets/nature1.jpg",
    "assets/nature2.jpg",
    "assets/nature3.jpg",
    "assets/nature4.jpg",
    "assets/nature5.jpg",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        leading: InkWell(
            customBorder: new CircleBorder(),
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                'assets/images/logo.png',
                color: appColor,
                height: 15.0,
                width: 10.0,
              ),
            )),
        centerTitle: true,

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Center(
                child: Column(
                    children: [
                      CarouselSlider.builder(
                        itemCount: listPaths.length,
                        options: CarouselOptions(
                            autoPlay: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentPos = index;
                              });
                            }
                        ),
                        itemBuilder: (context,int index,_){
                          return MyImageView(listPaths[index]);
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: listPaths.map((url) {
                          int index = listPaths.indexOf(url);
                          return Container(
                            width: 10.0,
                            height: 10.0,
                            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentPos == index
                                  ? Color(0xFF4E5FED)
                                  : Color.fromRGBO(0, 0, 0, 0.3),
                            ),
                          );
                        }).toList(),
                      ),

                    ]
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 20,left: 20),
                child: Text('Categories')),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      mainAxisExtent: 256),
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) =>
                      Padding(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: Container(
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5)),
                                side:  BorderSide(
                                    width: 1, color: appColor)),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [


                                Text('Abhilasha',
                               // Text(servicesModel?.data?[index].categoryName??"",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 20.0),

                                const SizedBox(height: 20.0),

                                Center(
                                  child: Container(
                                    width: 85.0,
                                    height: 30.0,
                                    child: Text(
                                      "Category Name",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 3.0),
                                Text('Service Charges',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.w700,
                                    )
                                ),
                                SizedBox(height: 15.0),
                              ],
                            ),
                          ),
                        ),
                      )
              ),
            ),
          ],

      ),
    );
  }
}

class MyImageView extends StatelessWidget{

  String imgPath;

  MyImageView(this.imgPath);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: FittedBox(
          fit: BoxFit.fill,
          child: Image.asset(imgPath),
        )
    );
  }

}
