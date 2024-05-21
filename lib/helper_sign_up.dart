import 'package:flutter/material.dart';

class HelperSignUpPage extends StatefulWidget {
  const HelperSignUpPage({Key? key}) : super(key: key);

  @override
  _HelperSignUpPageState createState() => _HelperSignUpPageState();
}

class _HelperSignUpPageState extends State<HelperSignUpPage> {
  final _formKey = GlobalKey<FormState>();

  // Form field controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  String _gender = 'Male';
  String _preferredArea = '';
  String _selectedSkill = 'Cooking';
  String _experienceLevel = 'Fresher';

  final List<String> _skills = [
    'Cooking',
    'Tent house helper',
    'Flower decoration',
    'Cleaners',
    'Sports activity',
  ];

  final List<String> _experienceLevels = [
    'Fresher',
    'Experienced',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Enter the details to sign up',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 8 ||
                        !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                            .hasMatch(value)) {
                      return 'Password must be at least 8 characters long and include uppercase, lowercase, number, and special character';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: _gender,
                  items: ['Male', 'Female', 'Other']
                      .map((label) => DropdownMenuItem(
                            child: Text(label),
                            value: label,
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _gender = value!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    prefixIcon: Icon(Icons.people),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Preferred City to Work',
                    prefixIcon: Icon(Icons.location_city),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    _preferredArea = value;
                  },
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: _selectedSkill,
                  items: _skills
                      .map((skill) => DropdownMenuItem(
                            child: Text(skill),
                            value: skill,
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedSkill = value!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Skill that you are interested in',
                    prefixIcon: Icon(Icons.work),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: _experienceLevel,
                  items: _experienceLevels
                      .map((level) => DropdownMenuItem(
                            child: Text(level),
                            value: level,
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _experienceLevel = value!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Experience Level',
                    prefixIcon: Icon(Icons.assessment),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle sign-up logic
                      // For now, just print the values
                      print('Name: ${_nameController.text}');
                      print('Email: ${_emailController.text}');
                      print('Password: ${_passwordController.text}');
                      print('Phone Number: ${_phoneController.text}');
                      print('Gender: $_gender');
                      print('Preferred Area: $_preferredArea');
                      print('Skill: $_selectedSkill');
                      print('Experience Level: $_experienceLevel');
                    }
                  },
                  child: Text('Sign Up'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
