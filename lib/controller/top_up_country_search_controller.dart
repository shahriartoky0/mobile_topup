import 'package:country/country.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopUpLandingController extends GetxController {
  // The full list of countries.
  final List<Country> allCountries = Countries.values;

  // Observable filtered list. Initialize with all countries.
  var filteredCountries = <Country>[].obs;

  // Observable selected index. -1 indicates no selection.
  var selectedIndex = (-1).obs;

  // Text editing controllers are now created once.
  final searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // Initialize with the full list of countries when the controller is initialized.
    filteredCountries.value = List.from(allCountries);
  }

  /// Update filteredCountries based on the search query.
  void updateSearch(String query) {
    if (query.isNotEmpty) {
      final lowerQuery = query.toLowerCase();
      // Make sure to assign a new list to filteredCountries to trigger UI update
      filteredCountries.value = allCountries.where((country) {
        return country.isoLongName.toLowerCase().contains(lowerQuery) ||
            country.countryCode.toLowerCase().contains(lowerQuery);
      }).toList();
    } else {
      // Reset the filtered list when the query is empty
      filteredCountries.value = List.from(allCountries);  // Make sure to create a new list
    }
  }

  /// Update the selected index.
  void selectCountry(int index) {
    selectedIndex.value = index;
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
