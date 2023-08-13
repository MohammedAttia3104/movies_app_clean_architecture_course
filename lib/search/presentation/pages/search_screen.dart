import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_architecture_course/core/constants/size_config.dart';
import 'package:movies_app_clean_architecture_course/core/services/services_locator.dart';
import 'package:movies_app_clean_architecture_course/search/presentation/controllers/search_bloc.dart';
import 'package:movies_app_clean_architecture_course/search/presentation/widgets/empty_search_results.dart';
import 'package:movies_app_clean_architecture_course/search/presentation/widgets/search_bar_component.dart';
import 'package:movies_app_clean_architecture_course/search/presentation/widgets/search_grid_view.dart';

class SearchScreen extends StatelessWidget {
  final String title;

  const SearchScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (_) => sl<SearchBloc>()..add(GetSearchResultEvent(title)),
      child: const Scaffold(
        body: SearchContent(),
      ),
    );
  }
}

class SearchContent extends StatelessWidget {
  const SearchContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(PaddingSize.padding21),
        child: Column(
          children: [
            const SearchBarComponent(),
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is EmptySearchResultState) {
                  return const EmptySearchResultsComponent();
                }
                if (state is SearchResultLoadingState) {
                  return SizedBox(
                    height: PaddingSize.padding350h,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (state is SearchResultLoadedState) {
                  return SearchGridView(searchResults: state.searchList);
                }
                if (state is SearchResultErrorState) {
                  return Text(state.message);
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
