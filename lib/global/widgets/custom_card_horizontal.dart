import 'package:chefkart/global/constants/fonts/font_constants.dart';
import 'package:chefkart/global/constants/string_constants.dart';
import 'package:chefkart/modules/home/dish_details_screen.dart';
import 'package:flutter/material.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../constants/fonts/size_config.dart';
import '../text_widgets/build_text.dart';

class CustomCardHorizontal extends StatefulWidget {
  CustomCardHorizontal({
    Key? key,
    required this.images,
    required this.rating,
    required this.text,
  }) : super(key: key);

  Image images;
  double rating;
  String text;

  @override
  State<CustomCardHorizontal> createState() => _CustomCardHorizontalState();
}

class _CustomCardHorizontalState extends State<CustomCardHorizontal> {
  //height & width
  double height = 0.0;
  double width = 0.0;

  @override
  void initState() {
    height = SizeConfig.safeBlockVertical!;
    width = SizeConfig.safeBlockHorizontal!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 12.5,
      width: 156,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    BuildText(
                      text: 'Masala Mugali',
                      color: Colors.black,
                      family: FontFamily.openSansSemibold,
                      fontSize: 10.0.small12px(),
                    ),
                    SizedBox(width: width * 1.5),
                    Image(image: Assets.icons.nonvegicon.image().image),
                    SizedBox(width: width * 1.5),
                    Container(
                      height: 14,
                      width: 24,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 100, 212, 104)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BuildText(
                            text: '${widget.rating}',
                            color: ColorName.colorWhite,
                            family: FontFamily.openSansSemibold,
                            fontSize: 10.0.small10px(),
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 1),
                Row(
                  children: [
                    Assets.icons.fridgeicon.image(),
                    SizedBox(width: width * 2),
                    Assets.icons.fridgeicon.image(),
                    SizedBox(width: width * 2),
                    const VerticalDivider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                    SizedBox(width: width * 2),
                    BuildText(
                      text: 'Ingredients',
                      color: Colors.black,
                      family: FontFamily.openSansBold,
                      fontSize: 10.0.small10px(),
                    ),
                    SizedBox(height: height * 1),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: width * 14),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(DishDetailsScreen.routeName);
                      },
                      child: BuildText(
                        text: 'View list  >',
                        color: ColorName.colorPrimary,
                        family: FontFamily.openSansSemibold,
                        fontSize: 10.0.small10px(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 1.8),
                Expanded(
                  child: BuildText(
                    text: widget.text,
                    color: ColorName.colorGray,
                    family: FontFamily.openSansRegular,
                    fontSize: 10.0.small10px(),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: width * 3),
          Container(
            height: 68,
            width: 92,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: widget.images.image,
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 21,
                      width: 58,
                      decoration: BoxDecoration(
                          color: ColorName.colorWhite,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              width: 1, color: ColorName.colorPrimary)),
                      child: Center(
                        child: BuildText(
                          text: 'Add',
                          color: ColorName.colorPrimary,
                          family: FontFamily.openSansSemibold,
                          fontSize: 10.0.small10px(),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
