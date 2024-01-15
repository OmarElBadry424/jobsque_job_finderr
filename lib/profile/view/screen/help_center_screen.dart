import 'package:flutter/material.dart';
import 'package:jobsque/View/Widgets/default%20appbar.dart';
import 'package:jobsque/View/Widgets/default%20search.dart';


class HelpCenterScreen extends StatelessWidget {
  HelpCenterScreen({super.key});
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar('Help Center',context),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only( top: 25, left: 25 ,right: 25),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: DefaultSearch(controller: searchController, hintText: 'Search',),
                      ),

                    ],
                  ),
                ],
              ),

            ),
            ExpansionTile(
              title: Text('lorem '),
              children: [
                ListTile(
                    leading: CircleAvatar(
                      child: Text("lorem "),
                      backgroundColor: Colors.white,
                    ),
                    title: Text('lorem')
                ),
                ListTile(
                    leading: CircleAvatar(
                      child: Text("lorem "),
                      backgroundColor: Colors.white,
                    ),
                    title: Text('lorem')
                ),
                ListTile(
                    leading: CircleAvatar(
                      child: Text("lorem "),
                      backgroundColor: Colors.white,
                    ),
                    title: Text('lorem')
                ),
                ListTile(
                    leading: CircleAvatar(
                      child: Text("lorem "),
                      backgroundColor: Colors.white,
                    ),
                    title: Text('lorem')
                ),

              ],
            ),
            ExpansionTile(
              title: Text('lorem '),
              children: [
                ListTile(
                    leading: CircleAvatar(
                      child: Text("lorem "),
                      backgroundColor: Colors.white,
                    ),
                    title: Text('lorem')
                ),
                ListTile(
                    leading: CircleAvatar(
                      child: Text("lorem "),
                      backgroundColor: Colors.white,
                    ),
                    title: Text('lorem')
                ),
                ListTile(
                    leading: CircleAvatar(
                      child: Text("lorem "),
                      backgroundColor: Colors.white,
                    ),
                    title: Text('lorem')
                ),
                ListTile(
                    leading: CircleAvatar(
                      child: Text("lorem "),
                      backgroundColor: Colors.white,
                    ),
                    title: Text('lorem')
                ),

              ],
            ),
            ExpansionTile(
              title: Text('lorem '),
              children: [
                ListTile(
                    leading: CircleAvatar(
                      child: Text("lorem "),
                      backgroundColor: Colors.white,
                    ),
                    title: Text('lorem')
                ),
                ListTile(
                    leading: CircleAvatar(
                      child: Text("lorem "),
                      backgroundColor: Colors.white,
                    ),
                    title: Text('lorem')
                ),
                ListTile(
                    leading: CircleAvatar(
                      child: Text("lorem "),
                      backgroundColor: Colors.white,
                    ),
                    title: Text('lorem')
                ),
                ListTile(
                    leading: CircleAvatar(
                      child: Text("lorem "),
                      backgroundColor: Colors.white,
                    ),
                    title: Text('lorem')
                ),

              ],
            ),


          ],
        ),
      ),
    );
  }
}