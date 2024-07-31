import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';

class CountryDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderManager>(
      builder: (context, provider, child) {
        return DropdownButton<String>(

          /// -- fetch Parameters from GET result

          value: provider.selectedCountry,
          items: provider.uniqueCountries.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              provider.filterEmployees(provider.selectedGender, newValue);
            }
          },
        );
      },
    );
  }
}