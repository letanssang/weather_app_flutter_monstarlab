import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_flutter_monstarlab/data/local/database_helper/database_helper.dart';
import 'package:weather_app_flutter_monstarlab/domain/enums/fetching_state.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/search/seach_view_model.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/search/search_state.dart';

import '../../../../di/dependency_injection.dart';

final searchViewModelProvider =
    StateNotifierProvider<SearchViewModel, SearchState>(
        (ref) => SearchViewModel(getIt<DatabaseHelper>()));

class SearchScreen extends ConsumerWidget {
  static const routeName = '/search';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchViewModelProvider);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, top: 10),
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2F2F2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Icon(Icons.search),
                            ),
                            Flexible(
                                child: TextField(
                              controller: state.textEditingController,
                              focusNode: state.focusNode,
                              onChanged: (_) {
                                ref
                                    .read(searchViewModelProvider.notifier)
                                    .onChangedHandler();
                              },
                              onEditingComplete: () {
                                ref
                                    .read(searchViewModelProvider.notifier)
                                    .getSuggestCities();
                                print(state.fetchingState);
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: Navigator.of(context).pop,
                        child: const Text('Cancel'))
                  ],
                ),
              ),
              if (state.fetchingState != FetchingState.init)
                Flexible(
                  child: Container(
                    child: state.fetchingState == FetchingState.success
                        ? ListView.builder(
                            itemCount: state.suggestions.length,
                            itemBuilder: (context, index) =>
                                Text(state.suggestions[index].name))
                        : state.fetchingState == FetchingState.loading
                            ? const CircularProgressIndicator()
                            : const Text(
                                'No Results',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
