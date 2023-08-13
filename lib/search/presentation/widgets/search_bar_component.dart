import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_architecture_course/core/constants/app_colors.dart';
import 'package:movies_app_clean_architecture_course/core/constants/app_strings.dart';
import 'package:movies_app_clean_architecture_course/core/constants/size_config.dart';
import 'package:movies_app_clean_architecture_course/core/constants/styles.dart';
import 'package:movies_app_clean_architecture_course/search/presentation/controllers/search_bloc.dart';

class SearchBarComponent extends StatefulWidget {
  const SearchBarComponent({super.key});

  @override
  State<SearchBarComponent> createState() => _SearchBarComponentState();
}

class _SearchBarComponentState extends State<SearchBarComponent> {
  final _textSearchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _textSearchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        controller: _textSearchController,
        style: Styles.textStyle14Regular,
        onChanged: (title) {
          context.read<SearchBloc>().add(GetSearchResultEvent(title));
        },
        keyboardType: TextInputType.text,
        cursorColor: AppColors.kPrimaryTextColor,
        cursorWidth: CustomSize.cursor1w,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.kPrimaryTextColor,
            ),
            borderRadius: BorderRadius.all(Radius.circular(CustomSize.circular8)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.kPrimaryTextColor,
            ),
            borderRadius: BorderRadius.all(Radius.circular(CustomSize.circular8)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.kPrimaryTextColor,
            ),
            borderRadius: BorderRadius.all(Radius.circular(CustomSize.circular8)),
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: AppColors.kPrimaryTextColor,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              _textSearchController.text = '';
              context.read<SearchBloc>().add(const GetSearchResultEvent(''));
            },
            child: const Icon(
              Icons.clear_rounded,
              color: AppColors.kPrimaryTextColor,
            ),
          ),
          hintText: AppStrings.searchHintText,
          hintStyle: Styles.textStyle14Regular,
        ),
      ),
    );
  }
}
