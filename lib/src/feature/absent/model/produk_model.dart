import 'dart:convert';

import 'package:aice/src/src.dart';
import 'package:collection/collection.dart';

extension GetTotalListProdukReport on List<ProdukReportModel> {
  int getTotal() {
    return map((e) => e.totalPrice).sum;
  }
}

class ProdukModel {
  final String kodeProduk;
  final String namaProduk;
  ProdukModel({
    required this.kodeProduk,
    required this.namaProduk,
  });

  static List<ProdukModel> produkList() {
    return _data.map((e) => ProdukModel.fromMap(e)).toList();
  }

  ProdukModel copyWith({
    String? kodeProduk,
    String? namaProduk,
  }) {
    return ProdukModel(
      kodeProduk: kodeProduk ?? this.kodeProduk,
      namaProduk: namaProduk ?? this.namaProduk,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kodeProduk': kodeProduk,
      'namaProduk': namaProduk,
    };
  }

  factory ProdukModel.fromMap(Map<String, dynamic> map) {
    return ProdukModel(
      kodeProduk: map['kodeProduk'] as String,
      namaProduk: map['namaProduk'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdukModel.fromJson(String source) =>
      ProdukModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ProdukModel(kodeProduk: $kodeProduk, namaProduk: $namaProduk)';

  @override
  bool operator ==(covariant ProdukModel other) {
    if (identical(this, other)) return true;

    return other.kodeProduk == kodeProduk && other.namaProduk == namaProduk;
  }

  @override
  int get hashCode => kodeProduk.hashCode ^ namaProduk.hashCode;
}

final _data = [
  {
    "kodeProduk": "AC001",
    "namaProduk": "AICE MOCHI VANILLA FAMILY PACK 390GR",
  },
  {
    "kodeProduk": "AC002",
    "namaProduk": "AICE MOCHI CHOCOLATE FAMILY PACK 390GR",
  },
  {
    "kodeProduk": "AC003",
    "namaProduk": "AICE MOCHI STRAWBERRY FAMILY PACK 390 GR",
  },
  {
    "kodeProduk": "AC004",
    "namaProduk": "AICE MOCHI DURIAN FAMILY PACK 390GR",
  },
  {
    "kodeProduk": "AC005",
    "namaProduk": "AICE MOCHI KLEPON FAMILY PACK 270ML",
  },
  {
    "kodeProduk": "AC006",
    "namaProduk": "AICE ALPUKAT STRAWBERRY 800ML",
  },
  {
    "kodeProduk": "AC007",
    "namaProduk": "AICE MANGO LF LESS SUGAR FAM PACK 6X65GR",
  },
  {
    "kodeProduk": "AC008",
    "namaProduk": "AICE CHOCOLATE CRISPY FAMILY PACK 6X60GR",
  },
  {
    "kodeProduk": "AC009",
    "namaProduk": "AICE FAMILY 3IN1 8LT",
  },
  {
    "kodeProduk": "AC0010",
    "namaProduk": "AICE FAMILY VANILA 8LT",
  },
  {
    "kodeProduk": "AC0011",
    "namaProduk": "AICE FAMILY AVOCADO 8LT",
  },
  {
    "kodeProduk": "AC0012",
    "namaProduk": "AICE FAMILY CHOCOLATE 8LT",
  },
  {
    "kodeProduk": "AC0013",
    "namaProduk": "AICE FAMILY STRAWBERRY 8LT",
  },
  {
    "kodeProduk": "AC0014",
    "namaProduk": "AICE FAMILY MANGO 8LT",
  },
  {
    "kodeProduk": "AC0015",
    "namaProduk": "AICE CHOCOLATE VANILLA SUNDAE 800 ML",
  },
  {
    "kodeProduk": "AC0016",
    "namaProduk": "AICE SESAME CRISPY 55GR",
  },
  {
    "kodeProduk": "AC0017",
    "namaProduk": "AICE MANGO LOW FAT LESS SUGAR 65GR",
  },
  {
    "kodeProduk": "AC0018",
    "namaProduk": "AICE TRIPLE PACK SUNDAE 300ML",
  },
  {
    "kodeProduk": "AC0019",
    "namaProduk": "AICE BINGO CHOCO MILK 40GR",
  },
  {
    "kodeProduk": "AC0020",
    "namaProduk": "AICE MILK MELON 50GR",
  },
  {
    "kodeProduk": "AC0021",
    "namaProduk": "AICE CHOCO COOKIES 60GR",
  },
  {
    "kodeProduk": "AC0022",
    "namaProduk": "AICE MANGOSLUSH 65GR",
  },
  {
    "kodeProduk": "AC0023",
    "namaProduk": "AICE CHOCOLATE CRISPY 60GR",
  },
  {
    "kodeProduk": "AC0024",
    "namaProduk": "AICE STRAWBERRY CRISPY 55GR",
  },
  {
    "kodeProduk": "AC0025",
    "namaProduk": "AICE OBOR KOPI 65GR",
  },
  {
    "kodeProduk": "AC0026",
    "namaProduk": "AICE CHOCOLATE CONDENSED MILK 100ML",
  },
  {
    "kodeProduk": "AC0027",
    "namaProduk": "AICE STRAWBERRY CONE 100ML",
  },
  {
    "kodeProduk": "AC0028",
    "namaProduk": "AICE MOCHI DURIAN 45GR",
  },
  {
    "kodeProduk": "AC0029",
    "namaProduk": "AICE MOCHI CHOCOLATE 45ML",
  },
  {
    "kodeProduk": "AC0030",
    "namaProduk": "AICE SWEET CORN 52GR",
  },
  {
    "kodeProduk": "AC0031",
    "namaProduk": "AICE MOCHI VANILA 30GR",
  },
  {
    "kodeProduk": "AC0032",
    "namaProduk": "AICE CHOCOLATE SUNDAE 100ML",
  },
  {
    "kodeProduk": "AC0033",
    "namaProduk": "AICE STRAWBERRY SUNDAE 100ML",
  },
  {
    "kodeProduk": "AC0034",
    "namaProduk": "AICE VANILLA CHOCOLATE CUP 90ML",
  },
  {
    "kodeProduk": "AC0035",
    "namaProduk": "AICE DURIAN CUP 85GR",
  },
  {
    "kodeProduk": "AC0036",
    "namaProduk": "AICE STRAWBERRY CUP",
  },
  {
    "kodeProduk": "AC0037",
    "namaProduk": "AICE STRAWBERRY CUP 50GR",
  },
  {
    "kodeProduk": "AC0038",
    "namaProduk": "AICE SWEET CORN FAMILY PACK 6S",
  },
  {
    "kodeProduk": "AC0039",
    "namaProduk": "AICE MOCHI ASSORTMENT FAMILY PACK 438ML",
  },
  {
    "kodeProduk": "AC0040",
    "namaProduk": "AICE SUSU TELUR FAMILY PACK 325ML",
  },
  {
    "kodeProduk": "AC0041",
    "namaProduk": "AICE MANGO 1.5LT",
  },
  {
    "kodeProduk": "AC0042",
    "namaProduk": "AICE AVOCADO 1.5LT",
  },
  {
    "kodeProduk": "AC0043",
    "namaProduk": "AICE TARO 1.5LT",
  },
  {
    "kodeProduk": "AC0044",
    "namaProduk": "AICE DURIAN 1.5LT",
  },
  {
    "kodeProduk": "AC0045",
    "namaProduk": "3IN1 COLORS 95 GR",
  },
  {
    "kodeProduk": "AC0046",
    "namaProduk": "AICE COFFE CRISPY 45GR",
  },
  {
    "kodeProduk": "AC0047",
    "namaProduk": "BELGIAN BERRY CHOCO 95ML/C",
  },
  {
    "kodeProduk": "AC0048",
    "namaProduk": "SANDWICH BISCUIT 95ML/C",
  },
  {
    "kodeProduk": "AC0049",
    "namaProduk": "CHOCO MEETS OATS 90 ML/C",
  },
  {
    "kodeProduk": "AC0050",
    "namaProduk": "CHOCOLATE ALMOND 90ML/C",
  },
  {
    "kodeProduk": "AC0051",
    "namaProduk": "3IN1 1.5 LT",
  },
  {
    "kodeProduk": "AC0052",
    "namaProduk": "AICE MANGO SLUSH LOW FAT 65GR",
  },
  {
    "kodeProduk": "AC0053",
    "namaProduk": "AICE BLUEBERRY COOKIES",
  },
  {
    "kodeProduk": "AC0054",
    "namaProduk": "AICE CHOCO STRIKE",
  },
  {
    "kodeProduk": "AC0055",
    "namaProduk": "AICE MACCHIATO",
  },
  {
    "kodeProduk": "AC0056",
    "namaProduk": "AICE MOCHI KLEPON 45ML/PC",
  },
  {
    "kodeProduk": "AC0057",
    "namaProduk": "AICE HISTERIA STICK 70 ML",
  },
  {
    "kodeProduk": "AC0058",
    "namaProduk": "AICE BOBA MILK TEA",
  },
  {"kodeProduk": "AC0059", "namaProduk": "AICE BINGO COOKIES CONE"}
];
