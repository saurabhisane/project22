import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  String _text = '';

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // Do something with the valid input, like saving it or processing.
      print('Text entered: $_text');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Notes'),
        titleTextStyle: TextStyle(color: Colors.blue),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 5,
            margin: EdgeInsets.all(20),

            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(
                    "https://st.depositphotos.com/2288675/2452/i/450/depositphotos_24522515-stock-photo-blank-yellow-sticky-note.jpg",
                    width: 200,
                  ),

                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("ID"),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _text = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 7) {
                        return 'Please enter some text (at least 7 characters)';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("password"),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _text = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 7) {
                        return 'Please enter some text (at least 7 characters)';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(

                    onPressed: _submitForm,
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
