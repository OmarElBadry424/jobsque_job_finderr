import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:jobsque/search/view_model/search_cubit.dart';
import 'color.dart';
class DefaultSearch extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  const DefaultSearch({super.key,
    required this.controller,
    required this.hintText, this.onTap, this.keyboardType,
  });

  @override
  State<DefaultSearch> createState() => _DefaultSearchState();
}

class _DefaultSearchState extends State<DefaultSearch> {
  late SearchCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit=SearchCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextFormField(
        style: TextStyle(
          color: AppTheme.lightgre,
          fontSize: 16.0,
        ),
        onTap: widget.onTap,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        onChanged: (value){
          cubit.searchJob(name: value);
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Iconsax.search_normal),
          prefixIconColor: const Color(0xFF292D32),


          hintText: widget.hintText,
          hintStyle: const TextStyle(
            fontSize: 14,
            fontFamily: FontConstants.fontFamily,
            fontWeight: FontWeightManager.regular,
            color: AppTheme.lightgreyyy,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(
              color: AppTheme.whitii,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppTheme.midblu),
          ),
        ),
      ),
    );
  }
}
