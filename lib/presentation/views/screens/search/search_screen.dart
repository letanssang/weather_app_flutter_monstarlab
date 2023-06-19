import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_flutter_monstarlab/data/local/database_helper/database_helper.dart';
import 'package:weather_app_flutter_monstarlab/domain/enums/fetching_state.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/search/search_state.dart';
import 'package:weather_app_flutter_monstarlab/presentation/views/screens/search/search_view_model.dart';
import 'package:weather_app_flutter_monstarlab/utils/constants/numbers.dart';

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
          padding: EdgeInsets.all(ScreenUtil().screenWidth * 0.05),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: ScreenUtil().setWidth(10),
                    top: ScreenUtil().setHeight(10)),
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        height: ScreenUtil().setHeight(50),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2F2F2),
                          borderRadius: BorderRadius.circular(
                            ScreenUtil().setHeight(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: ScreenUtil().setWidth(20)),
                              child: Icon(Icons.search,
                                  size: ScreenUtil().setHeight(20)),
                            ),
                            Flexible(
                                child: TextField(
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(16),
                              ),
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
                      padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(10),
                      ),
                      child: TextButton(
                          onPressed: Navigator.of(context).pop,
                          child: Text(
                            AppLocalizations.of(context)!.cancel,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(18),
                            ),
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
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: Text(
                                    state.suggestions[index].name,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: ScreenUtil().setSp(18)),
                                  ),
                                  subtitle: Text(
                                    state.suggestions[index].country,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: ScreenUtil().setSp(16)),
                                  ),
                                  trailing: isAdded
                                      ? Text(
                                          AppLocalizations.of(context)!.added,
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: ScreenUtil().setSp(16)))
                                      : IconButton(
                                          icon: Icon(
                                            Icons.add,
                                            color: Colors.black54,
                                            size: ScreenUtil().setHeight(20),
                                          ),
                                          onPressed: () {
                                            if (cities.length >= maxCities) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .youCanOnlyAdd5Cities)));
                                              return;
                                            }
                                            ref
                                                .read(searchViewModelProvider
                                                    .notifier)
                                                .addCityToList(
                                                    state.suggestions[index]);
                                          },
                                        ),
                                ),
                              );
                            })
                        : state.fetchingState == FetchingState.loading
                            ? const CustomLoadingIndicator()
                            : Center(
                                child: Text(
                                  AppLocalizations.of(context)!.noResult,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: ScreenUtil().setSp(18)),
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
