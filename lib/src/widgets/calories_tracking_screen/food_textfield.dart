import 'package:flutter/material.dart';

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: myController,
        onEditingComplete: () {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text(myController.text),
              );
            },
          );
        },
      ),
    );
    // floatingActionButton: FloatingActionButton(
    //   // When the user presses the button, show an alert dialog containing
    //   // the text that the user has entered into the text field.
    //   onPressed: () {
    //     return showDialog(
    //       context: context,
    //       builder: (context) {
    //         return AlertDialog(
    //           // Retrieve the text the that user has entered by using the
    //           // TextEditingController.
    //           content: Text(myController.text),
    //         );
    //       },
    //     );
    //   },
    //   tooltip: 'Show me the value!',
    //   child: Icon(Icons.text_fields),
    // ),
  }
}
