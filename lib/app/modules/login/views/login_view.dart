import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../core/base/base_screen_size.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/widgets/custome_button.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  Function? wp;
  Function? hp;

  LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    wp = Screen(MediaQuery.of(context).size).wp;
    hp = Screen(MediaQuery.of(context).size).hp;

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: hp!(100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Trade',
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: hp!(2),),

                      _loginCard()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginCard() {
    return Container(
      margin: const EdgeInsets.all(30),
      child: Card(
        color: AppColor.whiteGreyLight,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
        ),
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                    controller: controller.idController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.account_circle),
                        label: Text('Id')
                    ),
                    validator: (v)=>v!.isEmpty?'Id Required':null
                ),

                SizedBox(height: hp!(2),),

                Obx(()=> TextFormField(
                    controller: controller.passwordController,
                    obscureText: !controller.isShowingPass.value,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        label: const Text('Password'),
                        suffixIcon: IconButton(
                          onPressed: ()=>controller.isShowingPass.value = !controller.isShowingPass.value,
                          icon: Icon(controller.isShowingPass.value?CupertinoIcons.eye_solid:CupertinoIcons.eye_slash_fill),
                        )
                    ),

                    validator: (v)=>v!.isEmpty?'Password required':null
                ),
                ),

                SizedBox(height: hp!(3),),

                Obx(()=> CustomButton(
                  width: wp!(60),
                  height: 40,
                  textColor: AppColor.whiteColor,
                  bgColor: AppColor.blueColor,
                  btnName: 'Login',
                  borderRadius: 20,
                  isLoading: controller.isLoading.value,
                  onTap: (){
                    if(controller.formKey.currentState!=null){
                      if(controller.formKey.currentState!.validate()){
                        controller.loginOperation();
                      }
                    }
                  },
                ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
