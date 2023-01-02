import 'dart:math';

import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';

class SalesDetailView extends StatelessWidget {
  const SalesDetailView({super.key});
  static const routeName = "/salesDetailView";

  @override
  Widget build(BuildContext context) {
    final a = Random().nextInt(10);

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
              const Text(
                "Nama Toko",
                style: TextStyle(
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
                        value: DateTime.now().toString(),
                      ),
                      DetailText(
                        param: "Kode Toko",
                        value: DateTime.now().toString(),
                      ),
                      DetailText(
                        param: "Pilihan Toko",
                        value: DateTime.now().toString(),
                      ),
                      DetailText(
                        param: "Divider Kulkas",
                        value: DateTime.now().toString(),
                      ),
                      DetailText(
                        param: "Jumlah Item Terdisplay",
                        value: DateTime.now().toString(),
                      ),
                      DetailText(
                        param: "Kualitas Produk",
                        value: DateTime.now().toString(),
                      ),
                      DetailText(
                        param: "Sticker Freezer",
                        value: DateTime.now().toString(),
                      ),
                      DetailText(
                        param: "Papan Harga",
                        value: DateTime.now().toString(),
                      ),
                      DetailText(
                        param: "Label Harga",
                        value: DateTime.now().toString(),
                      ),
                      DetailText(
                        param: "Wobler Promo",
                        value: DateTime.now().toString(),
                      ),
                      DetailText(
                        param: "Spanduk",
                        value: DateTime.now().toString(),
                      ),
                      DetailText(
                        param: "Kepenuhan Freezer Atas",
                        value: DateTime.now().toString(),
                      ),
                      DetailText(
                        param: "Kebersihan Debu Freezer",
                        value: DateTime.now().toString(),
                      ),
                      DetailText(
                        param: "Atribut Brand Lain",
                        value: DateTime.now().toString(),
                      ),
                      DetailText(
                        param: "Stock Brand Lain",
                        value: DateTime.now().toString(),
                      ),
                      DetailText(
                        param: "Produk Retur",
                        value: DateTime.now().toString(),
                      ),
                      DetailText(
                        param: "Saran dan Kendala",
                        value: DateTime.now().toString(),
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
                          if (a % 2 == 0) ...[
                            const ImageSalesWidget(
                              url:
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                              title: "Foto Selfie Nama Toko",
                            ),
                            const ImageSalesWidget(
                              url:
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                              title: "Foto Kulkas Dari Jauh",
                            ),
                            const ImageSalesWidget(
                              url:
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                              title: "Foto Kulkas Dari Dekat",
                            ),
                            const ImageSalesWidget(
                              url:
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                              title: "Foto Kulkas Satu",
                            ),
                            const ImageSalesWidget(
                              url:
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                              title: "Foto Kulkas Dua",
                            ),
                            const ImageSalesWidget(
                              url:
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                              title: "Foto Kulkas Tiga",
                            ),
                            const ImageSalesWidget(
                              url:
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                              title: "Foto Kulkas Island Satu",
                            ),
                            const ImageSalesWidget(
                              url:
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                              title: "Foto Kulkas Island Dua",
                            ),
                            const ImageSalesWidget(
                              title: "Foto Kulkas Island Tiga",
                              url:
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                            ),
                            const ImageSalesWidget(
                              title: "Foto Kulkas Bawah",
                              url:
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                            ),
                            const ImageSalesWidget(
                              title: "Foto PO",
                              url:
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                            ),
                            const ImageSalesWidget(
                              title: "Foto Peralatan",
                              url:
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                            ),
                            const ImageSalesWidget(
                              title: "Foto POP",
                              url:
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                            ),
                          ] else ...[
                            const ImageSalesWidget(
                              title: "Foto Selfie",
                              url:
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                            ),
                            const ImageSalesWidget(
                              title: "Foto Kulkas Dari Jauh",
                              url:
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                            ),
                            const ImageSalesWidget(
                              title: "Foto Kulkas Terbuka",
                              url:
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                            ),
                            const ImageSalesWidget(
                              title: "Foto Kulkas Tertutup",
                              url:
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                            ),
                            const ImageSalesWidget(
                              title: "Foto PO",
                              url:
                                  "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
                            ),
                            const ImageSalesWidget(
                              title: "Foto Freezer Bawah",
                              url:
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
