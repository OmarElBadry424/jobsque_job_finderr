import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/View/Widgets/default%20search.dart';
import 'package:jobsque/View/Widgets/dfault%20header.dart';
import 'package:jobsque/search/view/screens/search_screen_result.dart';

import 'package:sizer/sizer.dart';
import '../../view_model/search_cubit.dart';
import '../../view_model/search_state.dart';
import '../widgets/search_result_tile.dart';

enum SearchType { recent, popular }

class SearchScreen extends StatefulWidget {
   SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
TextEditingController searchController=TextEditingController();
late SearchCubit cubit;
@override
  void initState() {
    super.initState();
    cubit=SearchCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10.h,
        titleSpacing: 10,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24,right: 12),
          child: IconButton(onPressed: () { Navigator.pop(context); }, icon: const Icon(Iconsax.arrow_left),),
        ),

        title: Padding(
          padding:  const EdgeInsets.only(right: 24,top: 14,bottom: 22),
          child: DefaultSearch(
            keyboardType: TextInputType.text,
            controller: searchController, hintText: 'Type something...',),
        ),


      ),
      body: SingleChildScrollView(
        child: BlocBuilder<SearchCubit, SearchState>(
  builder: (context, state) {
    return BuildCondition(
          condition: cubit.isSearching,
          builder: (context)=>SearchScreenResult(),
          fallback:(context)=>Column(
            children: [
              const DefaultHeader('Recent searches'),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: cubit.recentSearches.length,
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) =>
                      SearchResultTile(cubit.recentSearches[index], SearchType.recent)),
              const DefaultHeader('Popular searches'),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: cubit.popularSearches.length,
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => SearchResultTile(
                     cubit.popularSearches[index], SearchType.popular)),
            ],
          ) ,

        );
  },
),
      ),
    );
  }
}


