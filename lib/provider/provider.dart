import 'package:flutter/material.dart';
import 'package:pixle_task/services/services.dart';

import '../model/employee_info.dart';

class ProviderManager extends ChangeNotifier{

  /// -- Create Instance of the service class to access get function

  final _services = Services();

  bool _isLoading = false;
  List<EmployeeInfo> _employees = [];
  List<EmployeeInfo> _filteredEmployees = [];
  String? _errorMessage;
  String _SelectedGender = 'All';
  String _selectedCountry = 'All';
  bool _isSortByIdAscending = true;
  bool _isSortByAgeAscending = true;

  /// -- Create getter for eeach parameter

  List<EmployeeInfo> get employees => _filteredEmployees;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String get selectedGender  => _SelectedGender;
  String get selectedCountry => _selectedCountry;


  /// -- fetch api from get function

  Future<void> fetchEmployees({int limit= 10}) async{
    _isLoading = true;
    notifyListeners();

    try {
      _employees = await _services.getAll(limit: limit);
      _filteredEmployees = _employees;
      _errorMessage = null;
    } catch (error) {
      _errorMessage = error.toString();
      _employees = [];
      _filteredEmployees=[];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// -- Filter data based on Gender and Country

  void filterEmployees(String gender, String country) {
    _SelectedGender = gender;
    _selectedCountry = country;


    // Filter by both gender and country
    _filteredEmployees = _employees.where((employee) {
      final genderMatch = gender == 'All' || employee.gender == gender;
      final countryMatch = country == 'All' || employee.country == country;
      return genderMatch && countryMatch;
    }).toList();

    notifyListeners();
  }

  /// -- Get unique countries from the list

  List<String> get uniqueCountries {
    final countries = _employees.map((e) => e.country).toSet().toList();
    countries.sort();
    return ['All', ...countries];
  }

  /// -- Sort data based on Id adn Age

  void sortById() {
    _isSortByIdAscending = !_isSortByIdAscending;
    _filteredEmployees.sort((a, b) => _isSortByIdAscending ? a.id.compareTo(b.id) : b.id.compareTo(a.id));
    notifyListeners();
  }

  void sortByAge() {
    _isSortByAgeAscending = !_isSortByAgeAscending;
    _filteredEmployees.sort((a, b) => _isSortByAgeAscending ? a.age.compareTo(b.age) : b.age.compareTo(a.age));
    notifyListeners();
  }

  }
