import 'package:flutter/material.dart';

import 'models/kurban.dart';
import 'models/hisse.dart';
import 'screens/login_screen.dart';
import 'screens/admin_home_screen.dart';
import 'screens/user_home_screen.dart';
import 'screens/kurban_detail_screen.dart';

void main() {
  runApp(const KurbanTakipApp());
}

class KurbanTakipApp extends StatefulWidget {
  const KurbanTakipApp({Key? key}) : super(key: key);

  @override
  State<KurbanTakipApp> createState() => _KurbanTakipAppState();
}

class _KurbanTakipAppState extends State<KurbanTakipApp> {
  final List<Kurban> _kurbanlar = [
    Kurban(
      id: 'k1',
      name: 'Kurban #1',
      type: 'Büyükbaş',
      year: DateTime.now().year,
      status: KurbanStatus.sirada,
      hisseler: [
        Hisse(
          id: 'h1',
          ownerName: 'Ahmet Yılmaz',
          kilo: 18,
          isPaid: true,
          isDelivered: false,
        ),
        Hisse(
          id: 'h2',
          ownerName: 'Mehmet Demir',
          kilo: 17.5,
          isPaid: true,
          isDelivered: false,
        ),
      ],
    ),
    Kurban(
      id: 'k2',
      name: 'Kurban #2',
      type: 'Küçükbaş',
      year: DateTime.now().year,
      status: KurbanStatus.beklemede,
      hisseler: [
        Hisse(
          id: 'h3',
          ownerName: 'Furkan Koyunlu',
          kilo: 20,
          isPaid: false,
          isDelivered: false,
        ),
      ],
    ),
  ];

  bool _isAdmin = false;
  String _currentUserName = 'Furkan';

  void setUserRole({required bool isAdmin, required String name}) {
    setState(() {
      _isAdmin = isAdmin;
      _currentUserName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KurbanTakip',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(onLogin: setUserRole),
      routes: {
        AdminHomeScreen.routeName: (ctx) =>
            AdminHomeScreen(kurbanlar: _kurbanlar),
        UserHomeScreen.routeName: (ctx) =>
            UserHomeScreen(kurbanlar: _kurbanlar, currentUserName: _currentUserName),
        KurbanDetailScreen.routeName: (ctx) =>
            const KurbanDetailScreen(),
      },
    );
  }
}
