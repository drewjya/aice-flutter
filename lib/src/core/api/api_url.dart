class ApiUrl {
  static const _isTest = true;
  static const _url = "www.aiceapps.com";
  static const _baseUrl = _isTest ? 'https://$_url/api' : "http://";
  static const _baseImageUrl = _isTest ? 'https://$_url' : "http://";

  static const version = "1.6.2";

  //Auth
  static const login = '$_baseUrl/auth/login';
  static const register = '$_baseUrl/auth/register';

  static const profile = '$_baseUrl/profile/';

  //Transaksi (Sales)
  static const postTransaksi = '$_baseUrl/transaksi/';
  static const getTransaksiDetail = '$_baseUrl/transaksi/detail/x';
  static const getTransaksiHistoryToday = '$_baseUrl/transaksi/historyToday';
  static const getTransaksiHistoryThisWeek =
      '$_baseUrl/transaksi/historyThisWeek';
  static const postImageTransaksi = "$_baseUrl/image/transaksi";

  //Absensi (Spg)
  static const getAbsensiToday = "$_baseUrl/spg/";
  static const getAbsensiDetailToday = "$_baseUrl/spg/detail";
  static const postCheckIn = "$_baseUrl/spg/checkIn";
  static const postCheckOut = "$_baseUrl/spg/checkOut";
  static const postFormAbsensi = "$_baseUrl/spg/formAbsensi";
  static const postListProdukPenjualan = "$_baseUrl/spg/addProdukPenjualan";
  static const getProduk = "$_baseUrl/spg/product";
  static const postImageSpg = "$_baseUrl/image/spg";

  //Versi
  static const versi = "$_baseUrl/version/";

  static String? getImage(String? path) =>
      path != null ? '$_baseImageUrl/images$path' : null;
}
