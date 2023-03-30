import 'package:health_app/utils/font_style.dart';
import 'package:health_app/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/utils/image_path.dart';
import 'package:health_app/utils/loading_shimmer.dart';
import 'package:health_app/widgets/error.dart' as error;
import 'package:health_app/controller/health_repository.dart';
import 'package:health_app/widgets/home_card.dart';

class Home extends GetView<HelthRepository> {
  const Home({Key? key}) : super(key: key);

  /// route: '/home'
  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 50, 16, 10),

        /// featch data from repository
        child: Obx(() {
          final healthPoint = controller.healthPoint;
          String steps;
          String calories;
          if (controller.error.isNotEmpty) {
            return error.Error(controller: controller);
          }

          /// get data from repository and assing to steps and calories
          if (healthPoint.isNotEmpty) {
            steps = healthPoint.first.value.toString();
            calories = healthPoint.last.value.toString();
          } else {
            steps = 0.toString();
            calories = 0.toString();
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                AppText.hi,
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: AppFont.nunito,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 40),

              /// if steps is null show shimmer
              LoadingShimmer(
                loading: controller.isLoading.value,
                //if steps is not null show steps
                child: HomeCard(
                  iconPath: ImagePath(context).iconFootSteps,
                  heading: AppText.steps,
                  value: double.tryParse(steps)! / 100,
                  title: '$steps',
                  goal: '15,000',
                ),
              ),

              const SizedBox(
                height: 32,
              ),

              /// if calories is null show shimmer
              LoadingShimmer(
                loading: controller.isLoading.value,
                //if calories is not null show calories
                child: HomeCard(
                  iconPath: ImagePath(context).iconKcal,
                  heading: AppText.caloriesBurned,
                  value: double.tryParse(calories)! / 100,
                  title: '$calories',
                  goal: '15,000',
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
