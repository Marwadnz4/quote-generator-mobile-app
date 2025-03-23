import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quote_generator_mobile_app/core/theming/colors.dart';
import 'package:quote_generator_mobile_app/core/theming/styles.dart';
import 'package:quote_generator_mobile_app/features/home/data/models/quote_response.dart';
import 'package:quote_generator_mobile_app/features/home/logic/home_cubit.dart';
import 'package:quote_generator_mobile_app/features/home/logic/home_state.dart';
import 'package:quote_generator_mobile_app/features/home/ui/widgets/loading_quote_card.dart';
import 'package:quote_generator_mobile_app/features/home/ui/widgets/quote_card.dart';

class QuoteBlocBuilder extends StatelessWidget {
  const QuoteBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.veryLightGray,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(6.r),
          top: Radius.circular(0),
        ),
      ),
      padding: EdgeInsets.only(
        left: 18.w,
        right: 18.w,
        top: 30.h,
        bottom: 20.h,
      ),
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            current is SuccessRandomQuote ||
            current is ErrorRandomQuote ||
            current is LoadingRandomQuote,
        builder: (context, state) {
          if (state is SuccessRandomQuote) {
            QuoteResponse quote = state.quoteResponse;
            return QuoteCard(quote: quote);
          } else if (state is ErrorRandomQuote) {
            return Center(
              child: Text(
                state.message,
                style: TextStyles.font26VeryDarkGray,
              ),
            );
          }
          return LoadingQuoteCard();
        },
      ),
    );
  }
}