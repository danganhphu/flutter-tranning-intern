import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyFeild extends StatefulWidget {
  const MyFeild({Key? key}) : super(key: key);

  @override
  State<MyFeild> createState() => _MyFeildState();
}

class _MyFeildState extends State<MyFeild> {
  late TextEditingController textFormfieldUsername;
  late TextEditingController textFormFieldPassword;
  late TextEditingController textFormFieldDescription;
  late bool status;
  late bool acctive;
  late String gender;
  late String roleId;
  @override
  void initState() {
    super.initState();
    textFormfieldUsername = TextEditingController(text: "phu");
    textFormFieldPassword = TextEditingController();
    textFormFieldDescription = TextEditingController(text: "");
    status = true;
    acctive = true;
    gender = "male";
    roleId = "role1";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Username"
              ),
              controller: textFormfieldUsername,
            ),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Password"
              ),
              controller: textFormFieldPassword,
              obscureText: true,
            ),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Description"
              ),
              controller: textFormFieldDescription,
              maxLines: 3,
            ),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            CheckboxListTile(
              title: Text("Status"),
              value: status,
              onChanged: (bool? newValue) {
                setState(() {
                  status = newValue!;
                });
              }
            ),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            SwitchListTile(
              title: Text("Acctive"),
              value: acctive,
              onChanged: (bool newValue) {
                setState(() {
                  acctive = newValue;
                });
              },
            ),
            RadioListTile(
              value: "male",
              title: Text("Male"),
              groupValue: gender,
              onChanged: (String? newValue) {
                setState(() {
                  gender =  newValue!;
                });
              },
            ),
            RadioListTile(
              value: "female",
              title: Text("Female"),
              groupValue: gender,
              onChanged: (String? newValue) {
                setState(() {
                  gender =  newValue!;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.all(5),

            ),
            SizedBox(
              width: double.infinity,
              child: DropdownButton(
                value: roleId,
                items: const [
                  DropdownMenuItem(
                    child: Text("Role 1"),
                    value: "role1",
                  ),
                  DropdownMenuItem(
                    child: Text("Role 2"),
                    value: "role2",
                  ),
                  DropdownMenuItem(
                    child: Text("Role 3"),
                    value: "role3",
                  ),
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    roleId = newValue!;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            SizedBox(
              width: double.infinity,
              child:  ElevatedButton(
                style: ElevatedButton.styleFrom(onSurface: Colors.lightBlue),
                onPressed: () {
                  var username = textFormfieldUsername.text;
                  var passsword = textFormFieldPassword.text;
                  var description = textFormFieldDescription;
                  print("username: ${username}");
                  print("password: ${passsword}");
                  print("description: ${description}");
                  print("Status: ${status}");
                  print("Acctive: ${acctive}");
                  print("Gender: ${gender}");
                  print("Role: ${roleId}");
                  // Fluttertoast.showToast(
                  //     msg: username,
                  //     backgroundColor: Colors.red,
                  //     textColor: Colors.white,
                  //     fontSize: 16.0
                  // );
                },
                child: Text('Save'),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(onSurface: Colors.lightBlue),
                onLongPress: () {
                  showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(40, 20, 0, 0),
                    items: [
                      const PopupMenuItem(
                        value: 1,
                        child: Text("Menu 1"),
                      ),
                      const PopupMenuItem(
                        value: 2,
                        child: Text("Menu 2"),
                      ),
                      const PopupMenuItem(
                        value: 3,
                        child: Text("Menu 3"),
                      ),
                    ],
                  ).then((value) => print(value));
                },
                onPressed: () {  },
                child: Text("Context menu"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
