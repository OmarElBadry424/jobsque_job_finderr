import 'package:flutter/material.dart';
import 'package:jobsque/View/Widgets/Default%20Font.dart';
import 'package:sizer/sizer.dart';
import 'color.dart';
import 'countries.dart';
import '../../Register/register_cubit.dart';


class CustomCountryChip extends StatefulWidget {
  final CounrtyModel country;
  const CustomCountryChip(this.country, {super.key});

  @override
  State<CustomCountryChip> createState() => _CustomCountryChipState();
}

class _CustomCountryChipState extends State<CustomCountryChip> {
  late RegisterCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit=RegisterCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(cubit.selectedCountries.contains(widget.country.name)){
          cubit.deleteItemCountry(widget.country.name);
        }
        else{
          cubit.addItemCountry(widget.country.name);
        }
        print(cubit.selectedCountries);
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 42,
          padding:
          const EdgeInsets.only(top: 8, left: 10, right: 14, bottom: 8),
          decoration: ShapeDecoration(
            color: cubit.selectedCountries.contains(widget.country.name)
                ? AppTheme.halfwitmov
                : const Color(0xFFFAFAFA),
            shape: RoundedRectangleBorder(
              side: BorderSide(

                  color: cubit.selectedCountries.contains(widget.country.name)
                      ? AppTheme.midblu
                      : AppTheme.whitii2),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 26,
                height: 26,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.country.label),
                    fit: BoxFit.fill,
                  ),
                  shape: const OvalBorder(),
                ),
              ),
              SizedBox(width: 1.5.w),
              Flexible(
                child: Text(
                  widget.country.name,
                  style: const TextStyle(
                    color: AppTheme.blac,
                    fontSize: 16,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeightManager.regular
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

