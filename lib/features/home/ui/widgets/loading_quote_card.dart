import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quote_generator_mobile_app/core/helpers/spacing.dart';
import 'package:quote_generator_mobile_app/core/theming/colors.dart';
import 'package:quote_generator_mobile_app/core/theming/styles.dart';
import 'package:quote_generator_mobile_app/core/widgets/app_text_button.dart';
import 'package:shimmer/shimmer.dart';

class LoadingQuoteCard extends StatelessWidget {

  const LoadingQuoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Shimmer.fromColors(
      baseColor: ColorsManager.veryLightGray,
      highlightColor: ColorsManager.moderateViolet,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Loading', style: TextStyles.font26VeryDarkGray),
            verticalSpace(10),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'Loading',
                style: TextStyles.font22VeryDarkGrayWithOpacity,
              ),
            ),
            verticalSpace(20),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: AppButton(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(6.r),
                      top: Radius.circular(0),
                    ),
                    backgroundColor: ColorsManager.moderateViolet,
                    child: Text(
                      'Generate Another Quote',
                      style: TextStyles.font22White,
                    ),
                    borderColor: Colors.white,
                    onPressed: () {},
                  ),
                ),
                horizontalSpace(10),
                Expanded(
                  child: AppButton(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(6.r),
                      top: Radius.circular(0),
                    ),
                    backgroundColor: ColorsManager.veryLightGray,
                    child: Icon(
                      Icons.favorite,
                      color: ColorsManager.moderateViolet,
                      size: 30.sp,
                    ),
                    borderColor: ColorsManager.moderateViolet,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
      ),
    );
  }
}
