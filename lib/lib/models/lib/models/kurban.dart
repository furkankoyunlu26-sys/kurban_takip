import 'hisse.dart';

enum KurbanStatus {
  beklemede,
  sirada,
  kesildi,
  parcalaniyor,
  paketleniyor,
  teslimEdildi,
}

class Kurban {
  final String id;
  final String name;
  final String type; 
  final int year;
  KurbanStatus status;
  final List<Hisse> hisseler;

  Kurban({
    required this.id,
    required this.name,
    required this.type,
    required this.year,
    required this.status,
    required this.hisseler,
  });
}
