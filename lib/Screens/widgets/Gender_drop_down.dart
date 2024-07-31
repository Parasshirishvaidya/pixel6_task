import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';

class GenderDropDown extends StatelessWidget {
  const GenderDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderManager>(
      builder: (context, provider, child) {
        return DropdownButton<String>(
          value: provider.selectedGender,
          items: <String>['All', 'male', 'female'].map((String value) {

            /// -- create dropdown menu

            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              provider.filterEmployees(newValue, provider.selectedCountry);
            }
          },
        );
      },
    );
  }
}