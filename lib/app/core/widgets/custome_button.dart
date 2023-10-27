
import 'package:flutter/material.dart';
import 'package:tread/app/extensions/padding_extenstion.dart';

import '../values/app_colors.dart';

class CustomButton extends StatelessWidget {
  Function? onTap;
  String? btnName;
  double? width = 150;
  double? height = 50;
  double? borderRadius = 15;
  Color? bgColor = AppColor.primaryColor;
  bool? isLoading = false;
  Color? textColor;
  IconData? icon;

  CustomButton(
      {Key? key,
      this.onTap,
      this.btnName,
      this.width,
      this.height,
      this.bgColor,
      this.borderRadius,
      this.isLoading,
      this.icon,
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => (isLoading ?? false) ? null : onTap!(),
        style: ElevatedButton.styleFrom(
          primary: bgColor,
          padding: const EdgeInsets.all(5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            /*   side: const BorderSide(color: AppColor.primaryColor,width: 2)*/
          ),
          alignment: icon == null?Alignment.center:Alignment.centerLeft,
          minimumSize: Size(width!, height!),
        ),
        child: (isLoading ?? false)
            ? const CircularProgressIndicator(
                color: AppColor.whiteColor,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if(icon!=null)...[
                    10.width,
                    Icon(icon),
                    10.width,
                  ],
                  Text(
                    btnName ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: textColor),
                  )
                ],
              ));
  }
}
