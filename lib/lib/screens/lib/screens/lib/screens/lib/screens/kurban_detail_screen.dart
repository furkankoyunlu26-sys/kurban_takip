import 'package:flutter/material.dart';
import '../models/kurban.dart';

class KurbanDetailScreen extends StatelessWidget {
  static const routeName = '/kurban-detail';

  const KurbanDetailScreen({Key? key}) : super(key: key);

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
    final kurban = ModalRoute.of(context)!.settings.arguments as Kurban;

    return Scaffold(
      appBar: AppBar(
        title: Text(kurban.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tür: ${kurban.type}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text('Yıl: ${kurban.year}'),
            const SizedBox(height: 8),
            Text('Durum: ${_statusText(kurban.status)}'),
            const SizedBox(height: 16),
            const Text(
              'Hissedarlar',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: kurban.hisseler.length,
                itemBuilder: (ctx, i) {
                  final h = kurban.hisseler[i];
                  return Card(
                    child: ListTile(
                      title: Text(h.ownerName),
                      subtitle:
                          Text('Kilo: ${h.kilo.toStringAsFixed(1)} kg'),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(h.isPaid ? 'Ödeme: ✓' : 'Ödeme: ×'),
                          Text(h.isDelivered ? 'Teslim: ✓' : 'Teslim: ×'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
