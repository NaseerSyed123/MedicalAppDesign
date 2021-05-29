import 'package:trevashop_v2/Library/Language_Library/lib/easy_localization_delegate.dart';
import 'package:trevashop_v2/Library/Language_Library/lib/easy_localization_provider.dart';
import 'package:trevashop_v2/Library/carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:trevashop_v2/Library/countdown_timer/countDownTimer.dart';
import 'package:trevashop_v2/Model/HomeGridItemRecomended.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/Dr_Home_Screen.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/appointment.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/HomeUIComponent/AppBar_Component/AppbarGradient.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/HomeUIComponent/Detai_Productl_Screen/CategoryDetail.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/HomeUIComponent/Detai_Productl_Screen/DetailProduct.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/HomeUIComponent/Detai_Productl_Screen/MenuDetail.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/HomeUIComponent/Detai_Productl_Screen/PromotionDetail.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/HomeUIComponent/Flash_Sale/FlashSale.dart';
import 'package:trevashop_v2/AppLayer/Provider.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/CategoryPanelHome/Category.dart';
import 'package:flutter/material.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/CategoryPanelHome/CategoryManager.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/B1_Home_Dr_List.dart';
import 'package:trevashop_v2/AppLayer/Overseer.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

/// Component all widget in home
class _MenuState extends State<Menu> with TickerProviderStateMixin {
  int disease = 1;

  /// Declare class GridItem from HomeGridItemReoomended.dart in folder ListItem
  GridItem gridItem;
  bool isPatient = true;

  @override
  Widget build(BuildContext context) {
    CategoryManager manager = Provider.of(context).fetch(CategoryManager);
    var data = EasyLocalizationProvider.of(context).data;
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double size = mediaQueryData.size.height;

    /// Navigation to MenuDetail.dart if user Click icon in category Menu like a example camera
    var onClickMenuIcon = () {
      Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (_, __, ___) => new menuDetail(),
          transitionDuration: Duration(milliseconds: 750),

          /// Set animation with opacity
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
            return Opacity(
              opacity: animation.value,
              child: child,
            );
          }));
    };

    /// Navigation to promoDetail.dart if user Click icon in Week Promotion
    var onClickWeekPromotion = () {
      Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (_, __, ___) => new promoDetail(),
          transitionDuration: Duration(milliseconds: 750),
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
            return Opacity(
              opacity: animation.value,
              child: child,
            );
          }));
    };

    /// Navigation to categoryDetail.dart if user Click icon in Category
    var onClickCategory = () {
      Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (_, __, ___) => new categoryDetail(),
          transitionDuration: Duration(milliseconds: 750),
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
            return Opacity(
              opacity: animation.value,
              child: child,
            );
          }));
    };

    /// CategoryIcon Component
    var categoryIcon = Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 5.0),
      alignment: AlignmentDirectional.centerStart,
      child: StreamBuilder<List<Category>>(
          stream: manager.categoryList,
          builder:
              (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
            List _categoryList = snapshot.data;
            print("--testing ${snapshot.hasData}");
            print("let's c ${_categoryList.length}");
            Category _catList = _categoryList[0];

            print("the length is ${_catList.included.length}");
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => B1HomeDrList()));
                    },
                    child: Text(
                      'Top Specialties',
                      style: TextStyle(
                          fontSize: 13.5,
                          fontFamily: "Sans",
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0)),

                /// Get class CategoryIconValue
                /// TODO: adding stream data

                CategoryIconValue(
                  // tap1: onClickMenuIcon,
                  icon1: "assets/icon/health.png",
                  title1: 'Skin Specialist',
                  // title1: _catList.included[0].attributes.catalogLabel,
                  // tap2: onClickMenuIcon,
                  icon2: "assets/icon/health.png",
                  title2: 'Urologist',
                  // title2: _catList.included[1].attributes.catalogLabel,
                  // tap3: onClickMenuIcon,
                  icon3: "assets/icon/health.png",
                  title3: 'Child Specialist',
                  // title3: _catList.included[2].attributes.catalogLabel,
                  // tap4: onClickMenuIcon,
                  icon4: "assets/icon/health.png",
                  title4: 'Gynecologist',
                  // title4: _catList.included[3].attributes.catalogLabel,
                ),

                Padding(padding: EdgeInsets.only(top: 23.0)),
                CategoryIconValue(
                  icon1: "assets/icon/health.png",
                  // tap1: onClickMenuIcon,
                  // title1: _catList.included[4].attributes.catalogLabel,
                  title1: 'Consultant Physician',
                  icon2: "assets/icon/health.png",
                  // tap2: onClickMenuIcon,
                  // title2: _catList.included[5].attributes.catalogLabel,
                  title2: 'Orthopadic Surgeon',
                  icon3: "assets/icon/health.png",
                  // tap3: onClickMenuIcon,
                  // title3: _catList.included[6].attributes.catalogLabel,
                  title3: 'ENT Specialist',
                  icon4: "assets/icon/health.png",
                  // tap4: onClickMenuIcon,
                  // title4: _catList.included[7].attributes.catalogLabel,
                  title4: 'Dentist',
                ),
                Padding(padding: EdgeInsets.only(top: 23.0)),
              ],
            );
          }),
    );

    /// ListView a WeekPromotion Component
    var PromoHorizontalList = Container(
      color: Colors.white,
      height: 230.0,
      // padding: EdgeInsets.only(bottom: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 10.0, bottom: 3.0, right: 20.0),
              child: Text(
                AppLocalizations.of(context).tr('Book Appointment'),
                style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: "Sans",
                    fontWeight: FontWeight.w700),
              )),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 5.0),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 10)),
                InkWell(
                  // onTap: onClickWeekPromotion,
                  child: Image(
                    width: 165,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/imgPromo/Discount1.jpg'),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 5.0)),
                InkWell(
                  // onTap: onClickWeekPromotion,
                  child: Image(
                    width: 165,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/imgPromo/Discount3.jpg'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //  automaticallyImplyLeading: false,
        //   centerTitle: true,
        //   elevation: 0,
        //   title: Text(
        //     'Islamabad',
        //     style: TextStyle(fontFamily: "Sans", color: Colors.blue),
        //   ),
        //   flexibleSpace: Container(
        //     color: Colors.white,
        //     // decoration: BoxDecoration(
        //     //
        //     //     /// gradient in appbar
        //     //     gradient: LinearGradient(
        //     //         colors: [
        //     //           const Color(0xFFA3BDED),
        //     //           const Color(0xFF6991C7),
        //     //         ],
        //     //         begin: const FractionalOffset(0.0, 0.0),
        //     //         end: const FractionalOffset(1.0, 0.0),
        //     //         stops: [0.0, 1.0],
        //     //         tileMode: TileMode.clamp)),
        //   ),
        // ),

        /// Use Stack to costume a appbar
        body: Stack(
          children: <Widget>[
            ListView(children: [
              Overseer.userRole == 'Patient'
                  ? Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 35.0, left: 3, right: 3),
                          child: Card(
                            color: Colors.purple[100],
                            elevation: 3,
                            child: Container(
                              color: Colors.grey[50],
                              // color: Colors.deepPurple[50],
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),

                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Purpose of Appointment',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    elevation: 4,
                                    child: Container(
                                      height: 40.0,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 10.0,
                                                color: Colors.black12)
                                          ]),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                            icon: Icon(
                                              Icons.keyboard_arrow_down,
                                              color: Color(0xFF6E48AA),
                                            ),
                                            value: disease,
                                            items: [
                                              DropdownMenuItem(
                                                child: Text("Select Purpose"),
                                                value: 1,
                                              ),
                                              DropdownMenuItem(
                                                child: Text(
                                                  "Fever",
                                                  style: TextStyle(
                                                      fontFamily: 'sans'),
                                                ),
                                                value: 2,
                                              ),
                                              DropdownMenuItem(
                                                  child: Text(
                                                    "Cold",
                                                    style: TextStyle(
                                                        fontFamily: 'sans'),
                                                  ),
                                                  value: 3),
                                              DropdownMenuItem(
                                                  child: Text(
                                                    'Cough',
                                                    style: TextStyle(
                                                        fontFamily: 'sans'),
                                                  ),
                                                  value: 4),
                                              DropdownMenuItem(
                                                  child: Text(
                                                    "Cholera",
                                                    style: TextStyle(
                                                        fontFamily: 'sans'),
                                                  ),
                                                  value: 5),
                                            ],
                                            onChanged: (value) {
                                              setState(() {
                                                disease = value;
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    elevation: 4,
                                    child: Container(
                                      height: 90.0,
                                      alignment: AlignmentDirectional.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 10.0,
                                                color: Colors.black12)
                                          ]),
                                      padding: EdgeInsets.only(
                                          left: 20.0,
                                          right: 30.0,
                                          top: 0.0,
                                          bottom: 0.0),
                                      child: TextFormField(
                                        minLines: 6,
                                        // any number you need (It works as the rows for the textarea)
                                        keyboardType: TextInputType.multiline,
                                        maxLines: null,
                                        decoration: InputDecoration(
                                            hintText: 'Enter Detail',
                                            border: InputBorder.none,
                                            labelStyle: TextStyle(
                                                fontSize: 15.0,
                                                fontFamily: 'Sans',
                                                letterSpacing: 0.3,
                                                color: Colors.grey[200],
                                                fontWeight: FontWeight.w600)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25))),
                                    elevation: 5,
                                    child: Container(
                                      height: 45.0,
                                      width: 200,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      B1HomeDrList()));
                                        },
                                        child: Text(
                                          'Find Best Doctor',
                                          style: TextStyle(
                                              color: Colors.white,
                                              letterSpacing: 0.2,
                                              fontFamily: "Sans",
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ),
                                      alignment: FractionalOffset.center,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black38,
                                                blurRadius: 15.0)
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          gradient: LinearGradient(
                                              colors: <Color>[
                                                Color(0xFF121940),
                                                Color(0xFF6E48AA)
                                              ])),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        /// Call var categoryIcon
                        categoryIcon,
                        // Padding(
                        //   padding: EdgeInsets.only(top: 10.0),
                        // ),

                        /// Call var PromoHorizontalList
                        PromoHorizontalList,

                        /// Call var a FlashSell, i am sorry Typo :v
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                          top: 138.0, left: 60, right: 60),
                      child: Appointment())
            ]),

            /// Get a class AppbarGradient
            /// This is a Appbar in home activity
            AppbarGradient(),
          ],
        ),
      ),
    );
  }
}

/// Component item Menu icon bellow a ImageSlider
class CategoryIconValue extends StatelessWidget {
  String icon1, icon2, icon3, icon4, title1, title2, title3, title4;
  GestureTapCallback tap1, tap2, tap3, tap4;

  CategoryIconValue(
      {this.icon1,
      this.tap1,
      this.icon2,
      this.tap2,
      this.icon3,
      this.tap3,
      this.icon4,
      this.tap4,
      this.title1,
      this.title2,
      this.title3,
      this.title4});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: tap1,
          child: Column(
            children: <Widget>[
              Image.asset(
                icon1,
                height: 19.2,
              ),
              Padding(padding: EdgeInsets.only(top: 7.0)),
              Text(
                title1,
                style: TextStyle(
                  fontFamily: "Sans",
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        InkWell(
          onTap: tap2,
          child: Column(
            children: <Widget>[
              Image.asset(
                icon2,
                height: 26.2,
              ),
              Padding(padding: EdgeInsets.only(top: 0.0)),
              Text(
                title2,
                style: TextStyle(
                  fontFamily: "Sans",
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        InkWell(
          onTap: tap3,
          child: Column(
            children: <Widget>[
              Image.asset(
                icon3,
                height: 22.2,
              ),
              Padding(padding: EdgeInsets.only(top: 4.0)),
              Text(
                title3,
                style: TextStyle(
                  fontFamily: "Sans",
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        InkWell(
          onTap: tap4,
          child: Column(
            children: <Widget>[
              Image.asset(
                icon4,
                height: 19.2,
              ),
              Padding(padding: EdgeInsets.only(top: 7.0)),
              Text(
                title4,
                style: TextStyle(
                  fontFamily: "Sans",
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class homeTextFromField extends StatelessWidget {
  String email;
  IconData icon;
  TextInputType inputType;

  homeTextFromField({
    this.email,
    this.icon,
    this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'Disease',
            style: TextStyle(fontFamily: 'sans', fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            height: 40.0,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(blurRadius: 10.0, color: Colors.black12)
                ]),
            padding:
                EdgeInsets.only(left: 20.0, right: 30.0, top: 0.0, bottom: 0.0),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: 'name',
                  border: InputBorder.none,
                  labelText: email,
                  icon: Icon(
                    icon,
                    color: Colors.black38,
                  ),
                  labelStyle: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'Sans',
                      letterSpacing: 0.3,
                      color: Colors.black38,
                      fontWeight: FontWeight.w600)),
              keyboardType: inputType,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            height: 80.0,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(blurRadius: 10.0, color: Colors.black12)
                ]),
            padding:
                EdgeInsets.only(left: 20.0, right: 30.0, top: 0.0, bottom: 0.0),
            child: TextFormField(
              minLines: 6,
              // any number you need (It works as the rows for the textarea)
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                  hintText: 'Enter Detail',
                  border: InputBorder.none,
                  labelStyle: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'Sans',
                      letterSpacing: 0.3,
                      color: Colors.grey[200],
                      fontWeight: FontWeight.w600)),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.0, left: 30, right: 30),
          child: Container(
            height: 45.0,
            child: Text(
              'Send',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 0.2,
                  fontFamily: "Sans",
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800),
            ),
            alignment: FractionalOffset.center,
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 15.0)],
                borderRadius: BorderRadius.circular(30.0),
                gradient: LinearGradient(
                    colors: <Color>[Color(0xFF121940), Color(0xFF6E48AA)])),
          ),
        )
      ],
    );
  }
}
