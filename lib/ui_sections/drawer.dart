import 'package:active_ecommerce_flutter/screens/cart.dart';
import 'package:active_ecommerce_flutter/screens/change_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:active_ecommerce_flutter/screens/main.dart';
import 'package:active_ecommerce_flutter/screens/profile.dart';
import 'package:active_ecommerce_flutter/screens/order_list.dart';
import 'package:active_ecommerce_flutter/screens/wishlist.dart';
import 'package:active_ecommerce_flutter/screens/login.dart';
import 'package:active_ecommerce_flutter/screens/wallet.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:active_ecommerce_flutter/app_config.dart';
import 'package:active_ecommerce_flutter/helpers/auth_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({
    Key key,
  }) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  onTapLogout(context) async {
    AuthHelper().clearUserData();

    /*
    var logoutResponse = await AuthRepository()
            .getLogoutResponse();


    if(logoutResponse.result == true){
         ToastComponent.showDialog(logoutResponse.message, context,
                   gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
         }
         */

    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (_) => Login()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Directionality(
        textDirection:
            app_language_rtl.$ ? TextDirection.rtl : TextDirection.ltr,
        child: Container(
          padding: EdgeInsets.only(top: 50),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                is_logged_in.$ == true
                    ? ListTile(
                        leading: CircleAvatar(
                            child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/placeholder.png',
                            image: avatar_original.$.toString().isNotEmpty
                                ? AppConfig.BASE_PATH + "${avatar_original.$}"
                                : emptyUser,
                            fit: BoxFit.cover,
                            imageErrorBuilder: (context, object, stackTrace) {
                              return Image.network('$emptyUser',
                                  fit: BoxFit.cover);
                            },
                          ),
                        )),
                        title: Text("${user_name.$}"),
                        subtitle: user_name.$ != "" && user_name.$ != null
                            ? Text("${user_name.$}")
                            : Text("${user_phone.$}"))
                    : Text(
                        AppLocalizations.of(context).main_drawer_not_logged_in,
                        style: TextStyle(
                            color: Color.fromRGBO(153, 153, 153, 1),
                            fontSize: 14)),
                Divider(),
                ListTile(
                    visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                    leading: Image.asset("assets/language.png",
                        height: 16, color: Color.fromRGBO(153, 153, 153, 1)),
                    title: Text(
                        AppLocalizations.of(context)
                            .main_drawer_change_language,
                        style: TextStyle(
                            color: Color.fromRGBO(153, 153, 153, 1),
                            fontSize: 14)),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ChangeLanguage();
                      }));
                    }),
                ListTile(
                    visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                    leading: Image.asset("assets/home.png",
                        height: 16, color: Color.fromRGBO(153, 153, 153, 1)),
                    title: Text(AppLocalizations.of(context).main_drawer_home,
                        style: TextStyle(
                            color: Color.fromRGBO(153, 153, 153, 1),
                            fontSize: 14)),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Main();
                      }));
                    }),
                is_logged_in.$ == true
                    ? ListTile(
                        visualDensity:
                            VisualDensity(horizontal: -4, vertical: -4),
                        leading: Image.asset("assets/profile.png",
                            height: 16,
                            color: Color.fromRGBO(153, 153, 153, 1)),
                        title: Text(
                            AppLocalizations.of(context).main_drawer_profile,
                            style: TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1),
                                fontSize: 14)),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Profile(show_back_button: true);
                          }));
                        })
                    : Container(),
                is_logged_in.$ == true
                    ? ListTile(
                        visualDensity:
                            VisualDensity(horizontal: -4, vertical: -4),
                        leading: Image.asset("assets/order.png",
                            height: 16,
                            color: Color.fromRGBO(153, 153, 153, 1)),
                        title: Text(
                            AppLocalizations.of(context).main_drawer_orders,
                            style: TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1),
                                fontSize: 14)),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return OrderList(from_checkout: false);
                          }));
                        })
                    : Container(),
                is_logged_in.$ == true
                    ? ListTile(
                        visualDensity:
                            VisualDensity(horizontal: -4, vertical: -4),
                        leading: Image.asset("assets/heart.png",
                            height: 16,
                            color: Color.fromRGBO(153, 153, 153, 1)),
                        title: Text(
                            AppLocalizations.of(context)
                                .main_drawer_my_wishlist,
                            style: TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1),
                                fontSize: 14)),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Wishlist();
                          }));
                        })
                    : Container(),
                (is_logged_in.$ == true)
                    ? ListTile(
                        visualDensity:
                            VisualDensity(horizontal: -4, vertical: -4),
                        leading: Image.asset("assets/cart.png",
                            height: 16,
                            color: Color.fromRGBO(153, 153, 153, 1)),
                        title: Text(
                            AppLocalizations.of(context)
                                .main_screen_bottom_navigation_cart,
                            style: TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1),
                                fontSize: 14)),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Cart(has_bottomnav: false);
                          }));
                        })
                    : Container(),
                is_logged_in.$ == true
                    ? ListTile(
                        visualDensity:
                            VisualDensity(horizontal: -4, vertical: -4),
                        leading: Image.asset("assets/wallet.png",
                            height: 16,
                            color: Color.fromRGBO(153, 153, 153, 1)),
                        title: Text(
                            AppLocalizations.of(context).main_drawer_wallet,
                            style: TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1),
                                fontSize: 14)),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Wallet();
                          }));
                        })
                    : Container(),
                Divider(height: 24),
                is_logged_in.$ == false
                    ? ListTile(
                        visualDensity:
                            VisualDensity(horizontal: -4, vertical: -4),
                        leading: Image.asset("assets/login.png",
                            height: 16,
                            color: Color.fromRGBO(153, 153, 153, 1)),
                        title: Text(
                            AppLocalizations.of(context).main_drawer_login,
                            style: TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1),
                                fontSize: 14)),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Login();
                          }));
                        })
                    : Container(),
                is_logged_in.$ == true
                    ? ListTile(
                        visualDensity:
                            VisualDensity(horizontal: -4, vertical: -4),
                        leading: Image.asset("assets/logout.png",
                            height: 16,
                            color: Color.fromRGBO(153, 153, 153, 1)),
                        title: Text(
                            AppLocalizations.of(context).main_drawer_logout,
                            style: TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1),
                                fontSize: 14)),
                        onTap: () {
                          onTapLogout(context);
                        })
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
