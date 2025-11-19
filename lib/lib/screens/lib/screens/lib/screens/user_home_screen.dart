import 'package:flutter/material.dart';
import '../models/kurban.dart';
import 'kurban_detail_screen.dart';

class UserHomeScreen extends StatelessWidget {
  static const routeName = '/user-home';

  final List<Kurban> kurbanlar;
  final String currentUserName;

  const UserHomeScreen({
    Key? key,
    required this.kurbanlar,
    required this.currentUserName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Bu kullanıcının hissedar olduğu kurbanları filtrele
    final myKurbanlar = kurbanlar.where((k) {
      return k.hisseler.any((h) => h.ownerName == currentUserName);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Kurbanlarım - $currentUserName'),
      ),
      body: myKurbanlar.isEmpty
          ? Center(
              child: Text(
                'Şu an sana kayıtlı bir kurban görünmüyor.',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            )
          : ListView.builder(
              itemCount: myKurbanlar.length,
              itemBuilder: (ctx, i) {
                final k = myKurbanlar[i];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: ListTile(
                    title: Text('${k.name} (${k.type})'),
                    subtitle: Text('Yıl: ${k.year}'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        KurbanDetailScreen.routeName,
                        arguments: k,
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
