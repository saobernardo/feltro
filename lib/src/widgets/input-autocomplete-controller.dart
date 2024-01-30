import 'package:church_app/assets/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class InputAutocompleteController<T> extends StatelessWidget {
  final TextEditingController? controller;
  final SuggestionsCallback<T>? suggestionsCallback;
  final ItemBuilder<T>? itemBuilder;
  final bool hideOnEmpty;
  final Widget? noItemsFoundBuilder;
  final bool validator;
  final void Function(T)? onSuggestionSelected;
  final bool hideOnLoading;
  final String hintText;
  final Color? inputColor;

  InputAutocompleteController(
      {Key? key,
      this.controller,
      @required this.suggestionsCallback,
      @required this.itemBuilder,
      this.hideOnEmpty = false,
      this.noItemsFoundBuilder,
      this.validator = false,
      this.hideOnLoading = false,
      @required this.onSuggestionSelected,
      this.hintText = '',
      this.inputColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TypeAheadFormField<T>(
          hideSuggestionsOnKeyboardHide: false,
          textFieldConfiguration: TextFieldConfiguration(
              controller: controller,
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10.0, 9.0, 10.0, 9.0),
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.background,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide(
                      color: inputColor != null
                          ? inputColor!
                          : Theme.of(context).primaryColor,
                      width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide(
                      color: inputColor != null
                          ? inputColor!.withOpacity(0.6)
                          : Theme.of(context).primaryColor.withOpacity(0.6),
                      width: 2.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide(
                      color: inputColor != null
                          ? inputColor!.withOpacity(0.6)
                          : Theme.of(context).primaryColor.withOpacity(0.6),
                      width: 2.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide:
                      BorderSide(color: AppColorLight.redColor, width: 2.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide:
                      BorderSide(color: AppColorLight.redColor, width: 2.0),
                ),
              )),
          suggestionsCallback: suggestionsCallback!,
          itemBuilder: itemBuilder!,
          hideOnEmpty: hideOnEmpty,
          noItemsFoundBuilder: (context) => noItemsFoundBuilder!,
          hideOnLoading: hideOnLoading,
          loadingBuilder: (context) => Container(
                height: 2,
                child: LinearProgressIndicator(
                    backgroundColor: Theme.of(context).primaryColor,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
              ),
          validator: (value) {
            if (value!.isEmpty && validator) {
              return 'Seleção obrigatória!';
            }
          },
          onSuggestionSelected: onSuggestionSelected!),
    );
  }
}
