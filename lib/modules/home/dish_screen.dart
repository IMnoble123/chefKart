import 'package:chefkart/gen/colors.gen.dart';
import 'package:chefkart/global/constants/app_state.dart';
import 'package:chefkart/global/constants/fonts/font_constants.dart';
import 'package:chefkart/global/models/dishes_model.dart';
import 'package:chefkart/global/widgets/custom_card_horizontal.dart';
import 'package:chefkart/modules/home/controllers/dishes_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../gen/assets.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../global/constants/fonts/size_config.dart';
import '../../global/text_widgets/build_text.dart';

class DishesScreen extends StatelessWidget {
  static const String routeName = "/dishesScreen";
  DishesScreen({super.key});

  double height = 0.0;
  double width = 0.0;

  List<String> foodTypeText = ['Italian', 'Indian', 'Indian', 'Indian'];

  List<String> biryaniText = [
    'Biryani',
    'Biryani',
    'Biryani',
    'Biryani',
    'Biryani'
  ];

  List<Image> biryaniImage = [
    Assets.images.biriyaniimage.image(),
    Assets.images.biriyaniimage.image(),
    Assets.images.biriyaniimage.image(),
    Assets.images.biriyaniimage.image(),
    Assets.images.biriyaniimage.image()
  ];

  List<Image> mugalimasalaImage = [
    Assets.images.masalamugalai.image(),
    Assets.images.masalamugalai.image(),
    Assets.images.masalamugalai.image(),
    Assets.images.masalamugalai.image(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    height = SizeConfig.safeBlockVertical!;
    width = SizeConfig.safeBlockHorizontal!;
    final controller = context.watch<DishesController>();
    return SafeArea(
        child: Scaffold(
      appBar: appbarWidget(),
      body:SateProvider.widget(state: controller.state, loaded: _createBody(controller),loading:lodingWidget() )
    ));
  }

  AppBar appbarWidget() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Assets.icons.arrowbackicon.image(),
      title: BuildText(
        text: 'Select Dishes',
        color: Colors.black,
        family: FontFamily.openSansSemibold,
        fontSize: 10.0.medium16px(),
      ),
    );
  }

  Widget lodingWidget() {
    return const Center(child:  CircularProgressIndicator(color: ColorName.colorPrimary));
  }

  Widget _createBody(DishesController controller) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Stack(
        children: [
          Column(
            children: [
              firstSection(),
              SizedBox(height: height * 10),
              secondSection(controller),
              SizedBox(height: height * 1.5),
              recommentedFood(controller),
            ],
          ),
          sechduleWidget(),
          selectedButton(),
        ],
      ),
    );
  }

  Widget firstSection() {
    return Container(
      height: height * 8,
      color: Colors.black,
    );
  }

  Widget sechduleWidget() {
    return Positioned(
      top: 40,
      left: 15,
      right: 15,
      child: Container(
        height: 63,
        width: 314,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorName.colorWhite,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Assets.icons.calandericon.image(),
              BuildText(
                text: '21 May 2021',
                color: Colors.black,
                family: FontFamily.openSansBold,
                fontSize: 10.0.small12px(),
              ),
              Assets.icons.timericon.image(),
              BuildText(
                text: '10:30 Pm-12:30 Pm',
                color: Colors.black,
                family: FontFamily.openSansBold,
                fontSize: 10.0.small12px(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget secondSection(DishesController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          foodStyle(),
          SizedBox(height: height * 3),
          popularDishes(controller),
          SizedBox(height: height * 1.8),
        ],
      ),
    );
  }

  Widget foodStyle() {
    return SizedBox(
      height: 24,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: width * 2),
        itemCount: foodTypeText.length,
        itemBuilder: (context, index) {
          return Container(
            height: 24,
            width: 76,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 0, color: ColorName.colorPrimary)),
            child: Center(
              child: BuildText(
                text: foodTypeText[index],
                color: ColorName.colorPrimary,
                family: FontFamily.openSansBold,
                fontSize: 10.0.small12px(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget popularDishes(DishesController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildText(
          text: 'Popular Dishes',
          color: Colors.black,
          family: FontFamily.openSansBold,
          fontSize: 10.0.small14px(),
        ),
        SizedBox(height: height * 2),
        SizedBox(
          height: 63,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: width * 2),
            itemCount: controller.dishes?.popularDishes.length ?? 0,
            itemBuilder: (context, index) {
              return Container(
                height: 63,
                width: 63,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          controller.dishes?.popularDishes[index].image ?? ''),
                      fit: BoxFit.cover,
                      colorFilter: const ColorFilter.mode(
                        Colors.black26,
                        BlendMode.darken,
                      )),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 1, color: ColorName.colorPrimary),
                ),
                child: Center(
                  child: BuildText(
                    text: controller.dishes?.popularDishes[index].name ?? '',
                    color: ColorName.colorWhite,
                    family: FontFamily.openSansSemibold,
                    fontSize: 10.0.small10px(),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: height * 1.5),
        const Divider(
          height: 2,
          color: Color.fromARGB(255, 238, 233, 233),
          thickness: 2,
        )
      ],
    );
  }

  Widget recommentedFood(DishesController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 3),
      child: Column(
        children: [
          Row(
            children: [
              BuildText(
                text: 'Recommented',
                color: Colors.black,
                family: FontFamily.openSansBold,
                fontSize: 10.0.medium16px(),
              ),
              SizedBox(width: width * 1.5),
              Assets.icons.dropdawnicon.image(),
              const Spacer(),
              Container(
                height: 22,
                width: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black,
                ),
                child: Center(
                  child: BuildText(
                    text: 'Menu',
                    color: ColorName.colorWhite,
                    family: FontFamily.openSansBold,
                    fontSize: 10.0.small10px(),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: height * 2.5),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: controller.dishes?.dishes.length ?? 0,
            itemBuilder: (context, index) {
              return CustomCardHorizontal(
                  images: Image.network(
                      controller.dishes?.dishes[index].image ?? ''),
                rating: controller.dishes?.dishes[index].rating?? 0,
                text: controller.dishes?.dishes[index].description ?? '',
              );
            },
          ),
          SizedBox(height: height * 5),
        ],
      ),
    );
  }

  Widget selectedButton() {
    return Positioned(
      bottom: 120,
      left: 25,
      right: 25,
      child: Container(
        height: 40,
        width: 125,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.black),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Assets.icons.snaksicon.image(),
            BuildText(
              text: '3 food items selected',
              color: ColorName.colorWhite,
              family: FontFamily.openSansSemibold,
              fontSize: 10.0.small12px(),
            ),
            const Icon(
              Icons.arrow_forward_sharp,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
