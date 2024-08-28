import 'package:flutter/material.dart';

import '../utils/theme/materials_colors.dart';
import '../utils/theme/materials_fonts.dart';

class CardProduct extends StatelessWidget {
  final String imageUrl;
  final String locations;
  final String storeName;
  final int scales;
  final String price;
  final String massUnit;
  final String productDate;
  final String expiredDate;
  final VoidCallback goDetails;
  const CardProduct({
    super.key,
    required this.imageUrl,
    required this.locations,
    required this.storeName,
    required this.scales,
    required this.price,
    required this.massUnit,
    required this.productDate,
    required this.expiredDate,
    required this.goDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 20),
      width: 185,
      height: 360,
      child: Stack(
        children: [
          Card(
            shadowColor: blackColor,
            elevation: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              width: 210,
              height: 330,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: whiteColor),
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: backgroundImageProductColor,
                      image: DecorationImage(
                          image: AssetImage(imageUrl), fit: BoxFit.contain),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildDescriptionRow(
                    Icons.location_on,
                    locations,
                    "",
                    0,
                  ),
                  _buildDescriptionRow(
                    Icons.person,
                    storeName,
                    "",
                    0,
                  ),
                  const Divider(
                    height: 1,
                    color: greyColor,
                  ),
                  _buildDescriptionRow(
                    Icons.scale,
                    '$scales $massUnit',
                    "Rp $price /$massUnit",
                    30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tanggal Produksi",
                              style: fontPoppins.copyWith(
                                  fontSize: 7,
                                  color: primaryColor,
                                  fontWeight: fWBold),
                            ),
                            Text(
                              productDate,
                              style: fontPoppins.copyWith(
                                  fontSize: 10, color: textGreyColor),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Tanggal kadaluarsa",
                              style: fontPoppins.copyWith(
                                  fontSize: 7,
                                  color: primaryColor,
                                  fontWeight: fWBold),
                            ),
                            Text(
                              expiredDate,
                              style: fontPoppins.copyWith(
                                  fontSize: 10, color: textGreyColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: -10,
              left: 0,
              right: 0,
              child: Center(
                child: ElevatedButton(
                  onPressed: goDetails,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    elevation: MaterialStateProperty.all(1),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(secondaryColor),
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                  child: Text(
                    "Lihat Details Product",
                    style: fontPoppins.copyWith(
                        fontSize: fSz11, fontWeight: fWBold, color: whiteColor),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

Widget _buildDescriptionRow(
    IconData icon, String title, String secondaryTitle, double range) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6),
    child: Row(
      children: <Widget>[
        Icon(icon, size: 20, color: fiveColor),
        const SizedBox(width: 7),
        Text(
          title,
          style: const TextStyle(
              fontSize: fSz11, color: fiveColor, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: range,
        ),
        Text(
          secondaryTitle,
          style: const TextStyle(
              fontSize: fSz11, color: fiveColor, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
