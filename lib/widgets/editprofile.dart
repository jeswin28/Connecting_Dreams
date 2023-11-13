import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final Function(String, String, String,) onUpdateProfile;

  const EditProfilePage({super.key, required this.onUpdateProfile});

  @override
  // ignore: library_private_types_in_public_api
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,color: Color.fromARGB(255, 255, 255, 255),),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Username : ',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Text color
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              cursorWidth: 1.0,
              controller: _usernameController,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                hintText: 'Enter your new username',
                hintStyle: TextStyle(color: Colors.grey), 
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Your Name : ',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Text color
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: _nameController,
              style: const TextStyle(color: Colors.black), // Text color
              decoration: const InputDecoration(
                hintText: 'Enter your Realname',
                hintStyle: TextStyle(color: Colors.grey), // Hint text color
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black), // Border color when focused
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black), // Border color when not focused
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'Your Bio : ',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Text color
              ),
            ),
            const SizedBox(height: 10.0,),
             TextFormField(
              controller: _bioController,
              style: const TextStyle(color: Colors.black), // Text color
              decoration: const InputDecoration(
                hintText: 'Change your bio',
                hintStyle: TextStyle(color: Colors.grey), // Hint text color
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black), // Border color when focused
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black), // Border color when not focused
                ),
              ),
            ),
            const SizedBox(height: 10.0,),
            ElevatedButton(
              onPressed: () {
                // Get new values
                String newUsername = _usernameController.text;
                String newName = _nameController.text;
                String newBio = _bioController.text;

                // Check if the username is empty
                if (newUsername.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Username required!'),
                        content: const Text(
                          'Username cannot be empty!!!.',
                          style: TextStyle(color: Colors.red),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } else if (newName.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Name required'),
                        content: const Text(
                          'Name cannot be empty!!!.',
                          style: TextStyle(color: Colors.red),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  widget.onUpdateProfile(newUsername, newName, newBio);
                  Navigator.pop(context);
                }
              },
              child: const Text('Save Profile Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
