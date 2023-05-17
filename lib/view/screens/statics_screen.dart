import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/controller/statistics_controller.dart';
import 'package:budget_planner_app/view/screens/deadlines_screen.dart';
import 'package:budget_planner_app/view/widgets/statistics_element.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaticsScreen extends StatelessWidget {
  StaticsScreen({super.key});
  StatisticsController controller = Get.put(StatisticsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.backgroundColor,
        title: const Text(
          'Statistics',
          style: TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Spent',
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 26,
                    ),
                  ),
                  GetBuilder<StatisticsController>(builder: (c) {
                    return Text(
                      '${controller.spanBudget}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 85,
                      ),
                    );
                  })
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(40, 0, 30, 0),
              child: Divider(
                color: Colors.black12,
              ),
            ),

//xxxxxxxxxxxxxxxxxx

            Expanded(
              child: SizedBox(
                height: double.infinity,
                child: GetBuilder<StatisticsController>(builder: (c) {
                  return ConditionalBuilder(
                    condition: controller.state == 3,
                    fallback: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    builder: (context) {
                      return ListView.separated(
                        itemBuilder: (context, index) => StatisticsContainer(
                          label: controller.model.data?[index].label,
                          // label: "hello ",
                          percentage:
                              '${controller.model.data?[index].totalBudgetPercen}',
                          money:
                              '${controller.model.data?[index].totalExpenses}',
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 1),
                        itemCount: controller.model.data!.length,
                      );
                    },
                  );
                }),
              ),
            ),

            //XXXXXXXXXXXXXXX
            // Expanded(
            //   flex: 10,
            //   child: ListView.builder(
            //     itemCount: 20,
            //     itemBuilder: (context, index) {
            //       return StatisticsContainer(
            //           label: 'Phone Bill', percentage: '45', money: '400');
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
