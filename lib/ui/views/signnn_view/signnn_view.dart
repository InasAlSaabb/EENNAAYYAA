import 'package:flutter/material.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button_gr.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_form.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/signn_view/signn_view.dart';
import 'package:flutter_templete/ui/views/signnn_view/signnn_controlller.dart';
import 'package:flutter_templete/ui/views/varification_code/varification_cod_view.dart';
import 'package:get/get.dart';

class SignnnUpView extends StatefulWidget {
  const SignnnUpView({super.key});

  @override
  State<SignnnUpView> createState() => _SignnnUpViewState();
}

class _SignnnUpViewState extends State<SignnnUpView> {
  SignnnUpController controller = Get.put(SignnnUpController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          screenHieght(20).ph,
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: screenWidth(3),
              height: screenHieght(3),
            ),
          ),
          Text(
            'Sign Up',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          screenHieght(20).ph,
          CustomTextFormField(
            hintText: 'Your Email',
            fillColor: AppColors.mainGrey,
            hintTextColor: AppColors.mainback,
            controller: controller.emailController,
            validator: (value) {
              if (value!.isEmpty || !isEmail(value)) {
                return 'please check your email';
              }
              return null;
            },
          ),
          screenHieght(20).ph,
          CustomTextFormField(
            hintText: 'Your password',
            fillColor: AppColors.mainGrey,
            hintTextColor: AppColors.mainback,
            controller: controller.emailController,
            validator: (value) {
              if (value!.isEmpty || !isPassword(value)) {
                return 'please check your password';
              }
              return null;
            },
          ),
          screenHieght(20).ph,
          CustomButtonGer(
            onTap: () {
              Get.to(VerificationCodeView());
            },
            text: 'Create',
            wight: screenWidth(2),
            hight: screenHieght(18),
          ),
          screenHieght(20).ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomButtonGer(
                onTap: () {
                  Get.to(SignnView());
                },
                text: 'back',
                wight: screenWidth(3),
                hight: screenHieght(18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}