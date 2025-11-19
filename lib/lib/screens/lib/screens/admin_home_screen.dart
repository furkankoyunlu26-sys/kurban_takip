import 'package:flutter/material.dart';
import '../models/kurban.dart';
import 'kurban_detail_screen.dart';

class AdminHomeScreen extends StatelessWidget {
  static const routeName = '/admin-home';

  final List<Kurban> kurbanlar;

  const AdminHomeScreen({Key? key, required this.kurbanlar}) : super(key: key);

  String _statusText(KurbanStatus status) {
    switch (status) {
      case KurbanStatus.beklemede:
        return 'Beklemede';
      case KurbanStatus.sirada:
        return 'Sırada';
      case KurbanStatus.kesildi:
        return 'Kesildi';
      case KurbanStatus.parcalaniyor:
        return 'Parçalanıyor';
      case KurbanStatus.paketleniyor:
        return 'Paketleniyor';
      case KurbanStatus.teslimEdildi:
        return 'Teslim edildi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KurbanTakip - Admin'),
      ),
      body: ListView.builder(
        itemCount: kurbanlar.length,
        itemBuilder: (ctx, i) {
          final k = kurbanlar[i];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              title: Text('${k.name} (${k.type})'),
              subtitle: Text(
                'Yıl: ${k.year} • Hisse: ${k.hisseler.length} • Durum: ${_statusText(k.status)}',
              ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Yeni kurban ekleme yakında eklenecek.')),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
