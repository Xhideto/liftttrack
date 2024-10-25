import 'package:flutter/material.dart';

class AccountInfoPage extends StatefulWidget {
  @override
  _AccountInfoPageState createState() => _AccountInfoPageState();
}

class _AccountInfoPageState extends State<AccountInfoPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _bio = '';
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ACCOUNT INFORMATION', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepOrange.shade400,
        elevation: 3,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              _buildProfilePicture(),
              const SizedBox(height: 15),
              _buildNameField(),
              const SizedBox(height: 40),
              Center(child: _buildButtonColumn()), // Centering the button column
              const SizedBox(height: 40),
              _buildInfoContainer(),
              const SizedBox(height: 10),
              Center(child: _buildSaveChangesButton()), // Centering the save button
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePicture() {
    return Center(
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.grey[300],
        child: Icon(Icons.person, size: 50, color: Colors.white),
      ),
    );
  }

  Widget _buildNameField() {
    return Center(
      child: Text(
        _name.isEmpty ? 'Name' : _name,
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  Widget _buildButtonColumn() {
    return Column(
      children: [
        ListTile(
          title: Text('Edit Profile'),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => EditProfileDialog(
                initialName: _name,
                onSave: (newName) {
                  setState(() {
                    _name = newName;
                  });
                },
              ),
            );
          },
          tileColor: Colors.transparent, // Make the tile background transparent
        ),
        const SizedBox(height: 10), // Space between buttons
        ListTile(
          title: Text('Account Settings'),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AccountSettingsDialog(),
            );
          },
          tileColor: Colors.transparent, // Make the tile background transparent
        ),
      ],
    );
  }

  Widget _buildInfoContainer() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBioField(),
          SizedBox(height: 20),
          _buildEmailField(),
        ],
      ),
    );
  }

  Widget _buildBioField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter your bio',
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your bio';
        }
        return null;
      },
      onSaved: (value) => _bio = value!,
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter your email',
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your email';
        } else if (!value.contains('@')) {
          return 'Please enter a valid email';
        }
        return null;
      },
      onSaved: (value) => _email = value!,
    );
  }

  Widget _buildSaveChangesButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          // Save changes to database or API
          print('Name: $_name');
          print('Bio: $_bio');
          print('Email: $_email');
        }
      },
      child: Text('Save Changes'),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepOrange.shade400,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}

class EditProfileDialog extends StatefulWidget {
  final String initialName;
  final Function(String) onSave;

  EditProfileDialog({required this.initialName, required this.onSave});

  @override
  _EditProfileDialogState createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<EditProfileDialog> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';

  @override
  void initState() {
    super.initState();
    _name = widget.initialName;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Profile'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          initialValue: _name,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Enter your name',
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your name';
            }
            return null;
          },
          onSaved: (value) => _name = value!,
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.grey,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              widget.onSave(_name);
              Navigator.of(context).pop();
            }
          },
          child: Text('Save'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.deepOrange.shade400,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ],
    );
  }
}

class AccountSettingsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Account Settings'),
      content: Text('Account settings content'),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.grey,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ],
    );
  }
}