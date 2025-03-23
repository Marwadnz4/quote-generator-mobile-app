import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quote_generator_mobile_app/core/theming/colors.dart';
import 'package:quote_generator_mobile_app/core/theming/styles.dart';
import 'package:quote_generator_mobile_app/features/favorites/logic/favorites_cubit.dart';

class SearchTextFormField extends StatefulWidget {
  const SearchTextFormField({super.key});

  @override
  State<SearchTextFormField> createState() => _SearchTextFormFieldState();
}

class _SearchTextFormFieldState extends State<SearchTextFormField> {
  TextEditingController searchController = TextEditingController();
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    FavoritesCubit cubit = context.read<FavoritesCubit>();
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      child: TextFormField(
        onChanged: (value) {
          cubit.search(value);
        if (searchController.text.isNotEmpty) {
          setState(() {
            isSearch = true;
          });
        } else {
          setState(() {
            isSearch = false;
          });
        }
        },
        controller: searchController,
        cursorColor: ColorsManager.veryDarkGray,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: TextStyles.font22VeryDarkGrayWithOpacity,
          hintText: 'Type Something Here To Search..',
          suffixIcon:
               isSearch
                  ? InkWell(
                    child: const Icon(
                      CupertinoIcons.xmark_circle,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      searchController.clear();
                    },
                  )
                  : null,
        ),
        style: TextStyles.font22VeryDarkGray,
      ),
    );
  }
}
