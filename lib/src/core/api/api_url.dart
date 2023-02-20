class ApiUrl {
  static const _isTest = true;
  static const _url = "192.168.151.183";
  static const _baseUrl = _isTest ? 'http://$_url:8080/api' : "http://";
  static const _baseImageUrl =
      _isTest ? 'http://$_url:8080' : "http://";

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
  static const postImageSpg = "$_baseUrl/image/spg";

  static String? getImage(String? path) =>
      path != null ? '$_baseImageUrl/images$path' : null;
}
