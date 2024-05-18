import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/cupertino.dart';
import 'package:store_redirect/store_redirect.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool examCheck1 = false;
  bool examCheck2 = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 40, 45, 68),
      appBar: AppBar(
        title: Text('Ayarlar',
            style: TextStyle(
                color: Colors.white, fontFamily: 'SF-UI-Display-Regular')),
        centerTitle: true,
        backgroundColor: Color(0xFF0F111D),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 10.0),
                Card(
                  color: Color(0xFF0F111D),
                  elevation: 8.0,
                  margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.star,
                          color: Colors.blue,
                        ),
                        title: Text("Bu Uygulamayı Değerlendir",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'SF-UI-Display-Regular')),
                        trailing: Icon(Icons.keyboard_arrow_right,
                            color: Colors.white),
                        onTap: () {
                          StoreRedirect.redirect(
                            androidAppId: 'com.flash_light_lethforz',
                          );
                        },
                      ),
                      _buildDivider(),
                      _buildDivider(),
                      ListTile(
                        leading: Icon(
                          Icons.update,
                          color: Colors.green,
                        ),
                        title: Text("Güncellemeleri Kontrol Et",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'SF-UI-Display-Regular')),
                        trailing: Icon(Icons.keyboard_arrow_right,
                            color: Colors.white),
                        onTap: () {
                          StoreRedirect.redirect(
                            androidAppId: 'com.flash_light_lethforz',
                          );
                        },
                      ),
                      _buildDivider(),
                      _buildDivider(),
                      ListTile(
                        leading: Icon(
                          Icons.apps,
                          color: Colors.orange,
                        ),
                        title: Text("Diğer Uygulamalar",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'SF-UI-Display-Regular')),
                        trailing: Icon(Icons.keyboard_arrow_right,
                            color: Colors.white),
                        onTap: () {
                          StoreRedirect.redirect(
                            androidAppId: 'com.flash_light_lethforz',
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Color(0xFF0F111D),
                  elevation: 8.0,
                  margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.ios_share,
                          color: Colors.blueAccent,
                        ),
                        title: Text("Uygulamamızı Paylaşın",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'SF-UI-Display-Regular')),
                        trailing: Icon(Icons.keyboard_arrow_right,
                            color: Colors.white),
                        onTap: () {
                          showCupertinoDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                CupertinoAlertDialog(
                              title: const Text('Çok Yakında !'),
                              actions: <Widget>[
                                CupertinoDialogAction(
                                  child: const Text('Tamam'),
                                  onPressed: () {
                                    Navigator.pop(context, 'ok');
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      _buildDivider(),
                      _buildDivider(),
                      ListTile(
                        leading: Icon(
                          Icons.light_mode,
                          color: Colors.amber,
                        ),
                        title: Text("Açık Tema  /  Koyu Tema",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'SF-UI-Display-Regular')),
                        trailing: Icon(Icons.keyboard_arrow_right,
                            color: Colors.white),
                        onTap: () {
                          showCupertinoDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                CupertinoAlertDialog(
                              title: const Text('Çok Yakında !'),
                              actions: <Widget>[
                                CupertinoDialogAction(
                                  child: const Text('Tamam'),
                                  onPressed: () {
                                    Navigator.pop(context, 'ok');
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Color(0xFF0F111D),
                  elevation: 8.0,
                  margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.ads_click_outlined,
                          color: Colors.pink,
                        ),
                        title: Text("Reklamlar Hakkında",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'SF-UI-Display-Regular')),
                        trailing: Icon(Icons.keyboard_arrow_right,
                            color: Colors.white),
                        onTap: () {
                          showCupertinoDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                CupertinoAlertDialog(
                              title: const Text(
                                  'Ülkemizde yaşanan ekonomik sıkıntılar sebebi ile uygulamamız içerisindeki reklamları arttırmak zorunda kaldık. İnanın bu durumdan bizler de hiç memnun değiliz. Ne yazık ki giderlerimizi karşılayabilmek için reklam gelirlerine ihtiyaç duyuyoruz. Anlayışınız için teşekkür ederiz.'),
                              actions: <Widget>[
                                CupertinoDialogAction(
                                  child: const Text('Tamam'),
                                  onPressed: () {
                                    Navigator.pop(context, 'ok');
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}
