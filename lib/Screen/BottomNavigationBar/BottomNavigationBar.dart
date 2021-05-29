import 'package:trevashop_v2/AppLayer/Overseer.dart';
import 'package:trevashop_v2/Library/Language_Library/lib/easy_localization_delegate.dart';
import 'package:trevashop_v2/Library/Language_Library/lib/easy_localization_provider.dart';
import 'package:flutter/material.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/B1_Home_Profile.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/B1_Home_Screen.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/Calender/dynamic_event.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/Tabbar_View/tabbar_layout.dart';
import 'package:trevashop_v2/Screen/B2_BrandScreen/BrandUIComponent/BrandLayout.dart';
import 'package:trevashop_v2/Screen/B3_CartScreen/B3_Cart/B3_Cart_Screen.dart';
import 'package:trevashop_v2/Screen/B4_ProfileScreen/B4_Profile/B4_Profile_Screen.dart';
import 'file:///F:/welldone/trevashop_v2/lib/Screen/B1_HomeScreen/B1_Home/Tabbar_View/Patient_Tabbar/Tabbar_Patient.dart';

class bottomNavigationBar extends StatefulWidget {
  @override
  _bottomNavigationBarState createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar> {
  int currentIndex = 0;

  /// Set a type current number a layout class
  Widget callPage(int current) {
    switch (current) {
      case 0:
        if(Overseer.userRole == 'Patient'){
          print('0-1 Role(Patient) >> ${Overseer.userRole} ');
          return new Menu();
        }
        else{
          print('0-2 Role(Doctor) >> ${Overseer.userRole} ');
          return new TabbarLayout();
        }
        return null;

      case 1:
        if(Overseer.userRole == 'Patient'){
          print('1-1 Role(Patient) >> ${Overseer.userRole} ');
          return TabbarPatient();
        }
        else{
          print('1-2 Role(Doctor) >> ${Overseer.userRole }');
          return new DynamicEvent();
        }
        return null;

      case 2:
        return new B1HomeProfile();
        break;
      default:
        return TabbarLayout();
    }
  }

  /// Build BottomNavigationBar Widget
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        body: callPage(currentIndex),
        bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Colors.white,
                textTheme: Theme.of(context).textTheme.copyWith(
                    caption:
                        TextStyle(color: Colors.black26.withOpacity(0.15)))),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              fixedColor: Color(0xFF6991C7),
              onTap: (value) {
                currentIndex = value;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      size: 23.0,
                    ),
                    title:
                    Overseer.userRole == 'Patient'?
                    Text(
                      AppLocalizations.of(context).tr('Home'),
                      style:
                          TextStyle(fontFamily: "Sans", letterSpacing: 0.5,
                              fontWeight: FontWeight.bold),
                    ) : Text(
                      AppLocalizations.of(context).tr('Appointment'),
                      style:
                      TextStyle(fontFamily: "Sans", letterSpacing: 0.5,
                          fontWeight: FontWeight.bold),
                    )),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shop),
                    title:
                    Overseer.userRole == 'Patient'?
                    Text(
                      AppLocalizations.of(context).tr('Appointments'),
                      style:
                      TextStyle(fontFamily: "Sans", letterSpacing: 0.5,
                          fontWeight: FontWeight.bold),
                    ):
                    Text(
                      AppLocalizations.of(context).tr('Calender'),
                      style:
                          TextStyle(fontFamily: "Sans", letterSpacing: 0.5,
                              fontWeight: FontWeight.bold),
                    )),
                // BottomNavigationBarItem(
                //     icon: Icon(Icons.shopping_cart),
                //     title: Text(
                //       AppLocalizations.of(context).tr('cart'),
                //       style:
                //           TextStyle(fontFamily: "Sans", letterSpacing: 0.5,
                //               fontWeight: FontWeight.bold),
                //     )),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                      size: 24.0,
                    ),
                    title: Text(
                      AppLocalizations.of(context).tr('Profile'),
                      style:
                          TextStyle(fontFamily: "Sans", letterSpacing: 0.5,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            )),
      ),
    );
  }
}
