import 'package:budget_planner_app/constants/app_color.dart';
import 'package:budget_planner_app/controller/register_controller.dart';
import 'package:budget_planner_app/functions/valid_input.dart';
import 'package:budget_planner_app/view/widgets/date_time.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/update_profile_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textformfield.dart';

class UpdateProfileScreen extends StatelessWidget {
  UpdateProfileScreen({super.key});
  UpdateProfileController controller = Get.put(UpdateProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 150, 10, 195),
          width: double.infinity,
          color: AppColor.backgroundColor,
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 1, 17),
                  child: const Text(
                    'Update Profile',
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 30,
                    ),
                  ),
                ),
                CustomTextFormField(
                  hintText: 'Name',
                  fieldType: TextInputType.name,
                  textController: controller.nameTextController,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                    validator: (value) {
                      return validInput(value!, 5, 100, 'email');
                    },
                    hintText: 'E-mail',
                    textController: controller.emailTextController),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                            hintText: 'Gender',
                            fieldType: TextInputType.text,
                            textController: controller.genderTextController),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: CustomTextFormField(
                            fieldType: TextInputType.number,
                            hintText: 'Age',
                            textController: controller.ageTextController),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                    hintText: 'Monthly Budget Average',
                    fieldType: TextInputType.number,
                    textController: controller.budgetAverageTextController),
                const SizedBox(height: 10),
                CustomTextFormField(
                    hintText: 'Preferred currency',
                    textController: controller.currencyTextController),
                const SizedBox(height: 10),
                // Container(
                //   width: double.infinity,
                //   child: Row(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Expanded(
                //         child: CustomTextFormField(
                //             validator: (value) {
                //               return validInput(value!, 8, 100, 'password');
                //             },
                //             hintText: 'Enter Passwoed',
                //             textController: controller.passwordTextController),
                //       ),
                //       const SizedBox(width: 8),
                //       Expanded(
                //         child: CustomTextFormField(
                //             validator: (value) {
                //               return validInput(value!, 8, 100, 'password');
                //             },
                //             hintText: 'Re-enter Password',
                //             textController:
                //                 controller.rePasswordTextController),
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 10),
                CustomTextFormField(
                    hintText: 'birthdate',
                    textController: controller.birthdateTextController),
                    const SizedBox(height: 20),
                // picker(dateTimeController: controller.birthdateTextController),
                Container(
                  margin: const EdgeInsets.only(top: 6, left: 134, right: 134),
                  child: GetBuilder<UpdateProfileController>(
                    builder: (c) => ConditionalBuilder(
                      condition: controller.state.isTrue,
                      builder: (context) {
                        return CustomButton(
                          textButton: 'Update',
                          onPressed: () async {
                            var res2 = await controller.updateprofile();

                          },
                        );
                      },
                      fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ),
                
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
