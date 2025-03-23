import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quote_generator_mobile_app/core/helpers/spacing.dart';
import 'package:quote_generator_mobile_app/core/theming/colors.dart';
import 'package:quote_generator_mobile_app/core/theming/styles.dart';
import 'package:quote_generator_mobile_app/core/widgets/app_button.dart';
import 'package:quote_generator_mobile_app/features/favorites/data/models/favorite_quote_response.dart';
import 'package:quote_generator_mobile_app/features/favorites/logic/favorites_cubit.dart';

class FavoritesQuoteCard extends StatelessWidget {
  final FavoriteQuoteResponse quote;

  const FavoritesQuoteCard({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.veryLightGray,
        borderRadius: BorderRadius.circular(6.r),
      ),
      padding: EdgeInsets.only(
        left: 18.w,
        right: 18.w,
        top: 30.h,
        bottom: 20.h,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(quote.quote, style: TextStyles.font26VeryDarkGray),
          verticalSpace(10),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              quote.author,
              style: TextStyles.font22VeryDarkGrayWithOpacity,
            ),
          ),
          verticalSpace(20),
          AppButton(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(6.r),
              bottomRight: Radius.circular(6.r),
            ),
            borderColor: ColorsManager.moderateViolet,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8.w,
              children: [
                Icon(
                  Icons.favorite_border,
                  color: ColorsManager.moderateViolet,
                  size: 30.sp,
                ),
                Text(
                  'Remove From Favorite',
                  style: TextStyles.font22ModerateViolet,
                ),
              ],
            ),
            onPressed: () {
              context.read<FavoritesCubit>().deleteQuote(quote.quote);
            },
          ),
        ],
      ),
    );
  }
}
