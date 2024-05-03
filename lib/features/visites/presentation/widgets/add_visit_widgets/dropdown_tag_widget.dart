import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_grs/core/colors/light_theme_colors.dart';
import 'package:orange_grs/features/visites/presentation/bloc/dropdown_tag_bloc/dropdown_tag_bloc_bloc.dart';

class DropdownTagWidget extends StatelessWidget {
  final ValueChanged onChangeItem;
  const DropdownTagWidget({super.key, required this.onChangeItem});

  @override
  Widget build(BuildContext context) {
    final dropdownBloc = BlocProvider.of<DropdownTagBlocBloc>(context);

    return BlocBuilder<DropdownTagBlocBloc, DropdownTagState>(
      builder: (context, state) {
        
        if(state is DropdownTagSelectedItemState){
          onChangeItem(state.selectedItem);
          print("from blocbuilder state itemselected dropdown is ${state.selectedItem}");
          return Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: whiteColor,
              border: Border.all(
                width: 1,
                color: greyColor
              )
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: DropdownButton<String>(
                value: state.selectedItem,
                itemHeight: 50,
                underline: Container(),
                borderRadius: BorderRadius.circular(10),
                onChanged: (newValue) {
                  dropdownBloc.add(DropdownTagSelectItemEvent(selectedItem: newValue!));
                },
                items: ['Modification', 'Alert']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          );
        }else{
          return Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: whiteColor,
              border: Border.all(
                width: 1,
                color: greyColor
              )
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: DropdownButton<String>(
                value: 'Modification',
                itemHeight: 50,
                underline: Container(),
                borderRadius: BorderRadius.circular(10),
                onChanged: (newValue) {
                  dropdownBloc.add(DropdownTagSelectItemEvent(selectedItem: newValue!));
                },
                items: ['Modification', 'Alert']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          );
        }
        
      },
    );
  }
}