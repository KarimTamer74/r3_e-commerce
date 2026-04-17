// screens/profile_screen.dart
import 'package:first_app/widgets/custom_profile_item.dart';
import 'package:first_app/widgets/profile_item_model.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.myItems,
  });

  final List<ProfileItemModel> myItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios, size: 30),
        ),
        title: Text(
          'My Profile',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings, size: 30)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(23, 32, 23, 43),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/img.png'),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ahmed Ali",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("my_email@gmai.com"),
                    SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
    
            Expanded(
              child: ListView.builder(
                itemCount: myItems.length,
                itemBuilder: (context, index) {
                  return (index == 1 || index == 5 || index == 8)
                      ? Column(
                          children: [
                            CustomProfileItem(
                              title: myItems[index].title,
                              icon: myItems[index].icon,
                            ),
                            Divider(thickness: 3),
                          ],
                        )
                      : CustomProfileItem(
                          title: myItems[index].title,
                          icon: myItems[index].icon,
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
