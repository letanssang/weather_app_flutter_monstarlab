import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_flutter_monstarlab/data/local/database_helper/database_helper.dart';
import 'package:weather_app_flutter_monstarlab/domain/enums/fetching_state.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/search/search_state.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/search/search_view_model.dart';

import '../../../../di/dependency_injection.dart';
import '../../widgets/custom_loading_indicator.dart';
import '../home/home_screen.dart';

final searchViewModelProvider =
    StateNotifierProvider<SearchViewModel, SearchState>(
        (ref) => SearchViewModel(ref, getIt<DatabaseHelper>()));

class SearchScreen extends ConsumerStatefulWidget {
  static const routeName = '/search';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(searchViewModelProvider.notifier).focusOnStart();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(searchViewModelProvider);
    final cities = ref.watch(baseViewModelProvider).cities;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Icon(Icons.search),
                            ),
                            Flexible(
                                child: TextField(
                              textCapitalization: TextCapitalization.words,
                              controller: state.textEditingController,
                              focusNode: state.focusNode,
                              onChanged: (_) {
                                ref
                                    .read(searchViewModelProvider.notifier)
                                    .onChangedHandler();
                              },
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextButton(
                          onPressed: Navigator.of(context).pop,
                          child: const Text(
                            'Cancel',
                            style: TextStyle(fontSize: 18),
                          )),
                    )
                  ],
                ),
              ),
              if (state.fetchingState != FetchingState.init)
                Flexible(
                  child: Container(
                    child: state.fetchingState == FetchingState.success
                        ? ListView.builder(
                            itemCount: state.suggestions.length,
                            itemBuilder: (context, index) {
                              bool isAdded = cities.any((city) =>
                                  city.id == state.suggestions[index].id);
                              return ListTile(
                                title: Text(
                                  state.suggestions[index].name,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                                subtitle: Text(
                                  state.suggestions[index].country,
                                  style: const TextStyle(
                                      color: Colors.black54, fontSize: 16),
                                ),
                                trailing: isAdded
                                    ? Text('Added',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 16))
                                    : IconButton(
                                        icon: const Icon(Icons.add,
                                            color: Colors.black54),
                                        onPressed: () {
                                          if (cities.length >= 5) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        'You can only add 5 cities')));
                                            return;
                                          }
                                          ref
                                              .read(searchViewModelProvider
                                                  .notifier)
                                              .addCityToList(
                                                  state.suggestions[index]);
                                        },
                                      ),
                              );
                            })
                        : state.fetchingState == FetchingState.loading
                            ? const CustomLoadingIndicator()
                            : const Center(
                                child: Text(
                                  'No Results',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
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
