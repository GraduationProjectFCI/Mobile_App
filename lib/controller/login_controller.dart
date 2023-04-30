import 'package:budget_planner_app/helper/cashe_helper.dart';
import 'package:budget_planner_app/model/login_model.dart';
import 'package:budget_planner_app/view/screens/buttom_navigation_bar_screen.dart';
import 'package:budget_planner_app/view/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../helper/http_helper.dart';

class LoginController extends GetxController {
  LoginInfo? loginModel;
  RxBool state = true.obs;
  var val;
  Future onSubmit({
    required String email,
    required String password,
  }) async {
    WidgetsFlutterBinding.ensureInitialized();
    state = false.obs;
    update();
    Http.login(email: email, password: password).then((value) async {
      print("value @@@@ $value");
      print("massage !!!!${value['msg']}");
      loginModel = await LoginInfo.fromjson(value);

      state = true.obs;

      if (loginModel?.status == 200) {
        Get.off(BottomNavigationBarScreen());
        CacheHelper.prefs?.setString('token', '${loginModel?.token}');
        
      } else {
        for (int i = 0; i < loginModel?.message.length; i++)
          toast(msg: loginModel?.message[i]);
      }

      update();
    }).catchError((error) {
      print(error.toString());
    });
    update();
  }
}
