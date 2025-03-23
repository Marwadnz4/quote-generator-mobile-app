import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quote_generator_mobile_app/core/helpers/extensions.dart';
import 'package:quote_generator_mobile_app/core/helpers/spacing.dart';
import 'package:quote_generator_mobile_app/core/theming/colors.dart';
import 'package:quote_generator_mobile_app/core/theming/styles.dart';
import 'package:quote_generator_mobile_app/core/widgets/app_button.dart';
import 'package:quote_generator_mobile_app/features/favorites/ui/widgets/favorites_bloc_builder.dart';
import 'package:quote_generator_mobile_app/features/favorites/ui/widgets/search_text_form_field.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ColorsManager.vividViolet, ColorsManager.moderateViolet],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  borderColor: ColorsManager.verySoftViolet,
                  borderRadius: BorderRadius.circular(6.r),
                  backgroundColor: ColorsManager.verySoftViolet,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        color: ColorsManager.veryDarkGray,
                        size: 25.sp,
                      ),
                      Text(
                        'Back To Home Screen',
                        style: TextStyles.font26VeryDarkGray,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  onPressed: () {
                    context.pop();
                  },
                ),
                verticalSpace(20),
                SearchTextFormField(),
                verticalSpace(20),
                FavoritesBlocBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
