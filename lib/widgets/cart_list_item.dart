import 'package:flutter/material.dart';

import '../utils/theme/materials_colors.dart';
import '../utils/theme/materials_fonts.dart';

class CartListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String imageCategory;
  final VoidCallback onpressed;

  const CartListItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imageCategory,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: whiteColor,
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: backgroundImageProductColor,
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: AssetImage(imageCategory),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  style: fontPoppins.copyWith(
                    fontSize: fSz12,
                    fontWeight: fWBold,
                  ),
                ),
                Text(
                  subtitle,
                  style: fontPoppins.copyWith(
                    fontSize: 9,
                    fontWeight: fWBold,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: fontPoppins.copyWith(
                      fontSize: fSz14,
                    ),
                    children: [
                      const TextSpan(
                        text: 'Total Harga: ',
                      ),
                      TextSpan(
                        text: 'Rp $price',
                        style: TextStyle(
                          color: secondaryColor,
                          fontWeight: fWBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: onpressed,
              icon: const Icon(
                Icons.delete,
                color: errorColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
