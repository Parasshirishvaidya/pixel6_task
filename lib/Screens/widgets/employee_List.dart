import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';

class EmployeeListPage extends StatelessWidget {


   EmployeeListPage({super.key, });

  @override
  Widget build(BuildContext context) {
    final employeeProvider = Provider.of<ProviderManager>(
        context, listen: false);

    // Fetch employees when the page is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      employeeProvider.fetchEmployees();
    });
    return Expanded(
      child: Consumer<ProviderManager>(
        builder: (context, provider, child) {
          if (provider.isLoading) {

            /// -- Display loading Icon while data is loading

            return Center(child: CircularProgressIndicator());
          } else if (provider.errorMessage != null) {

            /// -- Display error in case of failure to fetch data

            return Center(child: Text('Error: ${provider.errorMessage}'));
          } else if (provider.employees.isEmpty) {

            /// -- Display message if no entries present

            return Center(child: Text('No employees found.'));
          } else {

            /// -- Display data

            return ListView.builder(
              itemCount: provider.employees.length,
              itemBuilder: (context, index) {
                final employee = provider.employees[index];
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 30,
                        alignment: Alignment.center,
                        child: Text(employee.id.toString()),
                      ),
                      Container(
                        height: 60,
                        width: 50,
                        alignment: Alignment.center,
                        child: Image.network(
                          employee.image,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 120,
                        alignment: Alignment.center,
                        child: Text('${employee.firstname} ${employee.lastname}'),
                      ),
                      Container(
                        height: 60,
                        width: 100,
                        alignment: Alignment.center,
                        child: Text('${employee.gender}/${employee.age}'),
                      ),
                      Container(
                        height: 60,
                        width: 120,
                        alignment: Alignment.center,
                        child: Text(employee.designation),
                      ),
                      Container(
                        height: 60,
                        width: 100,
                        alignment: Alignment.center,
                        child: Text('${employee.state}, ${employee.country}'),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}