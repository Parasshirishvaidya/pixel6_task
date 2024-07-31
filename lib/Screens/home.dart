import 'package:flutter/material.dart';
import 'package:pixle_task/Screens/widgets/Country_drop_down.dart';
import 'package:pixle_task/Screens/widgets/Gender_drop_down.dart';
import 'package:pixle_task/Screens/widgets/employee_List.dart';
import 'package:pixle_task/provider/provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// -- AppBar

      appBar: AppBar(
        backgroundColor: Colors.transparent,
      leading: Text("Pixel6", style: TextStyle(fontSize: 20),),
        actions: [
          Icon(Icons.menu)
        ],
      ),

      body:  Padding(
        padding: const EdgeInsets.only(top: 10,left: 20,right: 20),
        child: Column(
          children: [

            /// -- Country and Gender Filter
            /// -- Separate widget for each to simplify code

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Employees", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
                Row(
                  children: [
                    GenderDropDown(),
                    SizedBox(width: 20,),
                    CountryDropdown(),
                  ],
                )
              ],
            ),


            /// -- Parameter Header with id and Age sort function
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        final provider = Provider.of<ProviderManager>(context, listen: false);
                        provider.sortById();
                      },
                      child: Container(
                        height: 40,
                        width: 30,
                        alignment: Alignment.center,
                        child: Text("ID", style: TextStyle(fontWeight: FontWeight.w700)),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 50,
                      alignment: Alignment.center,
                      child: Text("Image", style: TextStyle(fontWeight: FontWeight.w700)),
                    ),
                    Container(
                      height: 40,
                      width: 120,
                      alignment: Alignment.center,
                      child: Text("Full Name", style: TextStyle(fontWeight: FontWeight.w700)),
                    ),
                    GestureDetector(
                      onTap: (){
                        final provider = Provider.of<ProviderManager>(context, listen: false);
                        provider.sortByAge();
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        alignment: Alignment.center,
                        child: Text("Demography", style: TextStyle(fontWeight: FontWeight.w700)),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 120,
                      alignment: Alignment.center,
                      child: Text("Designation", style: TextStyle(fontWeight: FontWeight.w700)),
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      alignment: Alignment.center,
                      child: Text("Location", style: TextStyle(fontWeight: FontWeight.w700)),
                    ),
                  ],
                ),
              ),
            ),

            /// -- Display entries
            EmployeeListPage(),
          ],
        ),
      ),
    );
  }
}







