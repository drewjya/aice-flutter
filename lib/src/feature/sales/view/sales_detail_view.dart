import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SalesDetailView extends ConsumerWidget {
  const SalesDetailView({super.key});
  static const routeName = "/salesDetailView";

  @override
  Widget build(BuildContext context, ref) {
    final curr = ref.watch(salesDetailProvider).asData?.value;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Sales Detail',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: SizedBox(
        height: 100.height(context),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                curr?.namaToko ?? "",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
              Expanded(
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverList(
                        delegate: SliverChildListDelegate([
                      DetailText(
                        param: "Tanggal",
                        value: formatDate(curr?.createdAt ?? ''),
                      ),
                      DetailText(
                        param: "Kode Toko",
                        value: curr?.kodeToko,
                      ),
                      DetailText(
                        param: "Pilihan Toko",
                        value: (curr?.pilihanTokoId ?? -1).toString(),
                      ),
                      DetailText(
                        param: "Divider Kulkas",
                        value: curr?.dividerKulkas,
                      ),
                      DetailText(
                        param: "Jumlah Item Terdisplay",
                        value: curr?.jumlahItemTerdisplay.toString(),
                      ),
                      DetailText(
                        param: "Kualitas Produk",
                        value: curr?.kualitasProduk,
                      ),
                      DetailText(
                        param: "Sticker Body Freezer",
                        value: curr?.stickerFreezer,
                      ),
                      DetailText(
                        param: "Papan Harga",
                        value: curr?.papanHarga,
                      ),
                      DetailText(
                        param: "Label Harga",
                        value: curr?.labelHarga,
                      ),
                      DetailText(
                        param: "Wobler Promo",
                        value: curr?.woblerPromo,
                      ),
                      DetailText(
                        param: "Spanduk",
                        value: curr?.spanduk,
                      ),
                      DetailText(
                        param: "Kepenuhan Freezer Atas",
                        value: curr?.kepenuhanFreezerAtas,
                      ),
                      DetailText(
                        param: "Kebersihan Debu Freezer",
                        value: curr?.kebersihanDebuFreezer,
                      ),
                      DetailText(
                        param: "Atribut Brand Lain",
                        value: curr?.brandLain,
                      ),
                      DetailText(
                        param: "Stock Brand Lain",
                        value: curr?.stockBrandLain,
                      ),
                      DetailText(
                        param: "Produk Retur",
                        value: curr?.produkRetur,
                      ),
                      DetailText(
                        param: "Saran dan Kendala",
                        value: curr?.saranDanKendala,
                      ),
                    ])),
                    SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        childAspectRatio: 1.0,
                      ),
                      delegate: SliverChildListDelegate.fixed(
                        [
                          if (curr?.pilihanTokoId == 4) ...[
                            ImageSalesWidget(
                              url: ApiUrl.getImage(curr?.fotoSelfie) ??
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                              title: "Foto Selfie Nama Toko",
                            ),
                            ImageSalesWidget(
                              url: ApiUrl.getImage(curr?.fotoKulkasDariJauh) ??
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                              title: "Foto Kulkas Dari Jauh",
                            ),
                            ImageSalesWidget(
                              url: ApiUrl.getImage(curr?.fotoKulkasTertutup) ??
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                              title: "Foto Kulkas Dari Dekat",
                            ),
                            ImageSalesWidget(
                              url: ApiUrl.getImage(curr?.fotoFreezerTwo) ??
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                              title: "Foto Kulkas Satu",
                            ),
                            ImageSalesWidget(
                              url: ApiUrl.getImage(curr?.fotoFreezerTwo) ??
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                              title: "Foto Kulkas Dua",
                            ),
                            ImageSalesWidget(
                              url: ApiUrl.getImage(curr?.fotoFreezerThree) ??
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                              title: "Foto Kulkas Tiga",
                            ),
                            ImageSalesWidget(
                              url: ApiUrl.getImage(curr?.fotoFreezerIsland1) ??
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                              title: "Foto Kulkas Island Satu",
                            ),
                            ImageSalesWidget(
                              url: ApiUrl.getImage(curr?.fotoFreezerIsland2) ??
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                              title: "Foto Kulkas Island Dua",
                            ),
                            ImageSalesWidget(
                              title: "Foto Kulkas Island Tiga",
                              url: ApiUrl.getImage(curr?.fotoFreezerIsland3) ??
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                            ),
                            ImageSalesWidget(
                              title: "Foto Kulkas Bawah",
                              url: ApiUrl.getImage(curr?.fotoFreezerBawah) ??
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                            ),
                            ImageSalesWidget(
                              title: "Foto PO",
                              url: ApiUrl.getImage(curr?.fotoPo) ??
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                            ),
                            ImageSalesWidget(
                              title: "Foto Peralatan",
                              url: ApiUrl.getImage(curr?.fotoPeralatan) ??
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                            ),
                            ImageSalesWidget(
                              title: "Foto POP",
                              url: ApiUrl.getImage(curr?.fotoPop) ??
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                            ),
                          ] else ...[
                            ImageSalesWidget(
                              title: "Foto Selfie",
                              url: ApiUrl.getImage(curr?.fotoSelfie) ??
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                            ),
                            ImageSalesWidget(
                              title: "Foto Kulkas Dari Jauh",
                              url: ApiUrl.getImage(curr?.fotoKulkasDariJauh) ??
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                            ),
                            ImageSalesWidget(
                              title: "Foto Kulkas Terbuka",
                              url: ApiUrl.getImage(curr?.fotoKulkasTerbuka) ??
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                            ),
                            ImageSalesWidget(
                              title: "Foto Kulkas Tertutup",
                              url: ApiUrl.getImage(curr?.fotoKulkasTertutup) ??
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                            ),
                            ImageSalesWidget(
                              title: "Foto PO",
                              url: ApiUrl.getImage(curr?.fotoPo) ??
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                            ),
                            ImageSalesWidget(
                              title: "Foto Freezer Bawah",
                              url: ApiUrl.getImage(curr?.fotoFreezerBawah) ??
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
