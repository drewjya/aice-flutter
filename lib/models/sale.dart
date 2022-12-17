import 'dart:io';

class Sale {
  final String id;
  final String distributorName;
  final String storeName;
  final String storeCode;
  final File image;

  Sale({
    required this.id,
    required this.distributorName,
    required this.storeName,
    required this.storeCode,
    required this.image,
  });
}

/**
 * 
 * Tanggal dan jam : otomatis dari sistem

Nama distributor : option (nanti diberikan list)
Nama toko : isi manual
Kode toko : isi manual

Form :
1. Kualitas produk : option (baik / 1-10 pcs rusak / 11-20 pcs rusak / hampir semua rusak / semua rusak )
2. Stiker freezer : option (ada / tidak ada)
3. Papan harga : option (ada / tidak ada)
4. Label harga : option (ada/ tidak ada)
5. Wobler promo : option (ada/tidak ada)
6. Spanduk : option (ada/tidak ada)
7. Jumlah item terdisplay : option ( 1 - 10 )
8. Kepenuhan freezer bagian atas : option ( 90 - 100% / 70 - 90% / dibawah 70%)
9. Kebersihan freezer : option (ada debu/ tidak ada debu )
10. Kebersihan freezer : option (ada bekas lem / tidak ada bekas lem)
11. Posisi freezer : option ( sudah bagus / proses negosiasi / negosiasi tapi ditolak orang toko )
12. PO : option ( 1 - 10 dus )
13. Apakah ada atribut brand lain di area freezer Aice : option (ada/tidak ada)
14. Saran dan kendala : bebas tulis.

Slot foto : 5 foto
1. Selfie dengan depan pintu yang kelihatan kode toko dan nama toko ;
2. Foto freezer dari jauh ( kelihatan stiker freezer )
3. Foto freezer dari dekat dan jangan buka kaca freezer ( kelihatan papan harga, label harga, wobler promo )
4. Foto freezer dari dekat dan geser kaca freezer (kelihatan display produk)
5. Foto PO yang sudah ambil ke toko.

END REPORT

Terus end reportnya ada 2 :
1. Nama salesman, tanggal berapa, jumlah tokonya berapa, postingan pertama jam berapa;

Budi | 12 Maret | 17 | 18:00
Anto | 12 Maret | 20 | 19:00 
Anto | 12 Maret | 4 | 19:00 
Anto | 12 Maret | 4 | 19:00 
Anto | 12 Maret | 4 | 19:00 
Anto | 12 Maret | 4 | 19:00 

2. Format laporan yang dari form dan foto diatas

Report Harian

Nama Salesman | Date Created | Jumlah Toko | Postingan pertama jam berapa |
______________|______________|_____________|______________________________|


 */
