import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_generator_mobile_app/core/helpers/spacing.dart';
import 'package:quote_generator_mobile_app/core/theming/styles.dart';
import 'package:quote_generator_mobile_app/features/favorites/logic/favorites_cubit.dart';
import 'package:quote_generator_mobile_app/features/favorites/logic/favorites_state.dart';
import 'package:quote_generator_mobile_app/features/favorites/ui/widgets/favorites_quote_card.dart';


class FavoritesBlocBuilder extends StatelessWidget {
  const FavoritesBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<FavoritesCubit, FavoritesState>(
        buildWhen:
            (previous, current) =>
                current is SuccessGetQuoteFromDatabase ||
                current is ErrorGetQuoteFromDatabase ||
                current is LoadingGetQuoteFromDatabase,
        builder: (context, state) {
          if (state is SuccessGetQuoteFromDatabase) {
            return state.quotes.isNotEmpty
                ? ListView.separated(
                  itemCount: state.quotes.length,
                  itemBuilder:
                      (context, index) => FavoritesQuoteCard(
                        quote: state.quotes[index],
                      ),
                  separatorBuilder:
                      (context, index) => verticalSpace(10),
                )
                : Text(
                  'No Favorites',
                  style: TextStyles.font22White,
                );
          } else if (state is ErrorGetQuoteFromDatabase) {
            return Text(
              state.message,
              style: TextStyles.font22White,
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
