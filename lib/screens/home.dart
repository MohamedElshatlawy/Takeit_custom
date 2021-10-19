import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:v_room_app/screens/customDrawer.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/screens/widgets/custom_textfield.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');
  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorsUtils.appBackground,
      appBar: AppBar(
        flexibleSpace: SizedBox(
          width: 5,
        ),
        backgroundColor: ColorsUtils.primaryGreen,
        title: Text('Takeit', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leadingWidth: 100,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                _scaffoldKey.currentState.openDrawer();
              },
              icon: Icon(Icons.format_list_bulleted, color: Colors.white),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: Colors.white),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  content: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      height: 400,
                      child: GoogleMap(
                        myLocationEnabled: true,
                        initialCameraPosition: CameraPosition(
                            target:
                                LatLng(37.42796133580664, -122.085749655962),
                            zoom: 14.4746,
                            bearing: 0),
                        onMapCreated: (GoogleMapController controller) {
                          mapController = controller;
                        },
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    CustomRoundedButton(
                      pressed: () {},
                      textColor: ColorsUtils.primaryGreen,
                      text: 'استخدم هذا الموقع',
                      load: false,
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
              );
            },
            icon: Icon(Icons.location_on_outlined, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_alt_outlined, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250.h,
              width: double.infinity,
              child: Carousel(
                autoplay: true,
                dotBgColor: Colors.transparent,
                dotColor: ColorsUtils.greyTextColor,
                dotIncreasedColor: ColorsUtils.primaryGreen,
                dotSize: 8,
                images: [
                  Image.asset(
                    'assets/images/pic4.jpg',
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    'assets/images/logo.jpg',
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    'assets/images/pic1.jpg',
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    'assets/images/pic3.jpg',
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    'assets/images/pic2.jpg',
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50.h,
                      child: CustomTextField(
                        lablel: 'عن ماذا تبحث',
                        sufficIcon: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.grey[400],
                          ),
                          child: Icon(
                            Icons.close,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  CustomRoundedButton(
                    pressed: () {},
                    textColor: Colors.white,
                    text: 'المطاعم',
                    load: false,
                    backgroundColor: ColorsUtils.primaryGreen,
                    borderColor: ColorsUtils.primaryGreen,
                    height: 50.h,
                    width: 80.w,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  CustomRoundedButton(
                    pressed: () {},
                    textColor: ColorsUtils.primaryGreen,
                    text: 'الاصناف',
                    load: false,
                    backgroundColor: ColorsUtils.whiteColor,
                    borderColor: ColorsUtils.primaryGreen,
                    height: 50.h,
                    width: 80.w,
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    color: Color(0xFFeeeaf0),
                    child: IconButton(
                        alignment: Alignment.centerRight,
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                          color: Color(0xFF898589),
                        )),
                  ),
                  onDismissed: (direction) {
                    if (direction == DismissDirection.startToEnd) {
                      print("Add to favorite");
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey[400]))),
                    child: ListTile(
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('subtitle'),
                          Row(
                            children: [
                              Text(
                                '03:00 AM',
                              ),
                              Text('03:00 AM'),
                            ],
                          ),
                        ],
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            children: [
                              Text('title'),
                              Text('title'),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined),
                              Text('3.0'),
                            ],
                          ),
                        ],
                      ),
                      leading: Image.asset(
                        'assets/images/logo.jpg',
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      drawer: CustomDrawer(),
    );
  }
}
