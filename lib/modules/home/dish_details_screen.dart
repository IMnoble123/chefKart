import 'package:chefkart/global/constants/app_state.dart';
import 'package:chefkart/global/constants/fonts/font_constants.dart';
import 'package:chefkart/global/constants/string_constants.dart';
import 'package:chefkart/modules/home/controllers/dishes_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../global/constants/fonts/size_config.dart';
import '../../global/text_widgets/build_text.dart';

class DishDetailsScreen extends StatelessWidget {
  static const String routeName = "/disheDetailasScreen";
  DishDetailsScreen({super.key});

  double height = 0.0;
  double width = 0.0;

  List<String> applianceText = [
    'Refrigerator',
    'Refrigerator',
    'Refrigerator',
  ];

  List<Image> applianceImage = [
    Assets.images.fridgeimage.image(),
    Assets.images.fridgeimage.image(),
    Assets.images.fridgeimage.image(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    height = SizeConfig.safeBlockVertical!;
    width = SizeConfig.safeBlockHorizontal!;
    final controller = context.watch<DishesController>();
    return SafeArea(
        child: Scaffold(
      appBar: appbarWidget(context),
      body: SateProvider.widget(state: controller.state, loaded: Stack(
        children: [
          _createBody(controller),
          imageWidget(),
        ],
      ),loading: lodingWidget())
    ));
  }




Widget lodingWidget() {
    return const Center(child:  CircularProgressIndicator(color: ColorName.colorPrimary));
  }


  AppBar appbarWidget(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Assets.icons.arrowbackicon.image()),
    );
  }



  Widget _createBody(DishesController controller) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 3),
        child: Column(
          children: [
            dishDiscription(controller),
            SizedBox(height: height * 2),
            ingredients(controller),
          ],
        ),
      ),
    );
  }





  Widget dishDiscription(DishesController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            BuildText(
              text: controller.particularDish?.name ?? '',
              color: Colors.black,
              family: FontFamily.openSansExtraBold,
              fontSize: 10.0.large23px(),
            ),
            SizedBox(width: width * 2),
            ratingSlug(),
          ],
        ),
        SizedBox(height: height * 2),
        BuildText(
          text: StringConstants.description,
          color: ColorName.colorGray,
          family: FontFamily.openSansRegular,
          fontSize: 10.0.small10px(),
          maxLines: 3,
        ),
        SizedBox(height: height * 3.5),
        Row(
          children: [
            Assets.icons.timericon.image(),
            SizedBox(width: width * 1.8),
            BuildText(
              text: controller.particularDish?.timeToPrepare?? '',
              color: Colors.black,
              family: FontFamily.openSansSemibold,
              fontSize: 10.0.small10px(),
            ),
          ],
        ),
        SizedBox(height: height * 3),
        const Divider(
          height: 2,
          color: Color.fromARGB(255, 238, 233, 233),
          thickness: 2,
        ),
        SizedBox(height: height * 3),
        BuildText(
          text: 'Ingredients',
          color: Colors.black,
          family: FontFamily.openSansBold,
          fontSize: 10.0.medium16px(),
        ),
        SizedBox(height: height * 1.8),
        BuildText(
          text: 'For 2 people',
          color: ColorName.colorGray,
          family: FontFamily.openSansRegular,
          fontSize: 10.0.small10px(),
        ),
        SizedBox(height: height * 1.5),
        const Divider(),
      ],
    );
  }



  Widget ingredients(DishesController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            BuildText(
              text: 'Vegtables (${controller.particularDish?.ingredients.vegetables.length?? 0})',
              color: Colors.black,
              family: FontFamily.openSansBold,
              fontSize: 10.0.small12px(),
            ),
            SizedBox(width: width * 1.5),
            Assets.icons.dropdawnicon.image(),
          ],
        ),
        SizedBox(height: height * 2),
        ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) => SizedBox(height: height * 1.5),
          itemCount:
              controller.particularDish?.ingredients.vegetables.length ?? 0,
          itemBuilder: (context, index) => rowWidget(
              controller.particularDish?.ingredients.vegetables[index].name ??
                  '',
              controller
                      .particularDish?.ingredients.vegetables[index].quantity ??
                  ''),
        ),
        SizedBox(height: height * 2.2),
        Row(
          children: [
            BuildText(
              text: 'Spices ${controller.particularDish?.ingredients.spices.length ?? 0}',
              color: Colors.black,
              family: FontFamily.openSansBold,
              fontSize: 10.0.small12px(),
            ),
            SizedBox(width: width * 1.5),
            Assets.icons.dropdawnicon.image(),
          ],
        ),
        SizedBox(height: height * 2),
        ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) => SizedBox(height: height * 1.5),
          itemCount: controller.particularDish?.ingredients.spices.length ?? 0,
          itemBuilder: (context, index) => rowWidget(
              controller.particularDish?.ingredients.spices[index].name ?? '',
              controller.particularDish?.ingredients.spices[index].quantity ??
                  ''),
        ),
        SizedBox(height: height * 2.5),
        BuildText(
          text: 'Appliances',
          color: Colors.black,
          family: FontFamily.openSansBold,
          fontSize: 10.0.medium16px(),
        ),
        SizedBox(height: height * 2),
        SizedBox(
          height: height * 20,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(),
            itemCount: controller.particularDish?.ingredients.appliances.length?? 0,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  SizedBox(
                    height: 95,
                    width: 72,
                    child: applianceImage[index],
                  ),
                  SizedBox(height: height * 0.5),
                  BuildText(
                    text: controller.particularDish?.ingredients.appliances[index].name?? '',
                    color: Colors.black,
                    family: FontFamily.openSansRegular,
                    fontSize: 10.0.small10px(),
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget rowWidget(String text1, String text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BuildText(
          text: text1,
          color: Colors.black,
          family: FontFamily.openSansRegular,
          fontSize: 10.0.small10px(),
        ),
        BuildText(
          text: text2,
          color: Colors.black,
          family: FontFamily.openSansRegular,
          fontSize: 10.0.small10px(),
        ),
      ],
    );
  }

  Widget ratingSlug() {
    return Container(
      height: 14,
      width: 26,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromARGB(255, 100, 212, 104)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BuildText(
            text: '4.4',
            color: ColorName.colorWhite,
            family: FontFamily.openSansSemibold,
            fontSize: 10.0.small10px(),
          ),
          const Icon(
            Icons.star,
            color: Colors.white,
            size: 8,
          ),
        ],
      ),
    );
  }

  Widget imageWidget() {
    return Positioned(
        left: 180,
        top: 50,
        child: SizedBox(
          height: 130,
          width: 321,
          child: Assets.images.vegimage.image(),
        ));
  }
}
