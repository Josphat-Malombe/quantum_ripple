import 'package:flutter/material.dart';
import 'dart:js' as js; // Required for EmailJS in Flutter Web

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ContactForm(),
  ));
}

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  String? name, email, phone, message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message Us'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (value) => name = value,
                        validator: (value) =>
                        value!.isEmpty ? 'Please enter your name' : null,
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (value) => email = value,
                        validator: (value) => value!.contains('@')
                            ? null
                            : 'Please enter a valid email address',
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (value) => phone = value,
                        validator: (value) => value!.length >= 10
                            ? null
                            : 'Please enter a valid phone number',
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Message',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 3,
                        onSaved: (value) => message = value,
                        validator: (value) =>
                        value!.isEmpty ? 'Please enter a message' : null,
                      ),
                      SizedBox(height: 15),
                      Spacer(),
                      Center(
                        child: ElevatedButton(
                          onPressed: _submitForm,
                          child: Text('Submit'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Sending the form data to EmailJS
      js.context.callMethod('sendEmail', [
        {
          'name': name,
          'email': email,
          'phone': phone,
          'message': message,
        }
      ]);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Message sent successfully!')),
      );
    }
  }
}


