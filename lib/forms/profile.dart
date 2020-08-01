import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final formkey = GlobalKey<FormState>();
  String name;
  bool checkValue = true;
  bool checkTileValue = false;
  bool switchTile = false;
  int radioGroup = 1;
  int langRadioGroup = 1;

  submit() {
    if(formkey.currentState.validate()){
      formkey.currentState.save();
      print("Valid");
    }
    print('Submitted');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                initialValue: "",
                decoration: InputDecoration(
                  labelText: "Your Name",
                  hintText: "Enter Your Full Name",
                  // helperText: "Please enter your name",
                ),
                validator: (String arg) {
                  if (arg.isEmpty) {
                    return 'Please enter a valid name';
                  } else {
                    return null;
                  }
                },
                onSaved: (input) => name = input,
                onChanged: (input) {
                  print(input);
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                initialValue: "",
                decoration: InputDecoration(
                  labelText: "Your Mobile",
                  hintText: "Enter Your Mobile",
                  // helperText: "Please enter your name",
                ),
                validator: (String arg) {
                  if (arg.isEmpty) {
                    return 'Please enter a valid mobile';
                  } else {
                    return null;
                  }
                },
                onSaved: (input) => name = input,
                onChanged: (input) {
                  print(input);
                },
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                initialValue: "",
                decoration: InputDecoration(
                  labelText: "Your Email",
                  hintText: "Enter Your Email",
                  // helperText: "Please enter your name",
                ),
                validator: (String arg) {
                  if (arg.isEmpty) {
                    return 'Please enter a valid Email';
                  } else {
                    return null;
                  }
                },
                onSaved: (input) => name = input,
                onChanged: (input) {
                  print(input);
                },
              ),
              Checkbox(
                onChanged: (bool value) {
                  setState(() {
                    checkValue = value;
                  });
                  print(checkValue);
                },
                value: checkValue,
              ),
              SwitchListTile(
                title: Text("Do you want our news letters?"),
                value: switchTile,
                onChanged: (bool val) {
                  setState(() {
                    switchTile = val;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Gender"),
              ),
              RadioListTile(
                title: Text("Male"),
                groupValue: radioGroup,
                onChanged: (value) {
                  setState(() {
                    radioGroup = value;
                  });
                  print(radioGroup);
                },
                value: 1,
              ),
              RadioListTile(
                title: Text("Female"),
                groupValue: radioGroup,
                onChanged: (value) {
                  setState(() {
                    radioGroup = value;
                    print(radioGroup);
                  });
                },
                value: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Languages"),
              ),
              RadioListTile(
                title: Text("C++"),
                groupValue: langRadioGroup,
                onChanged: (value) {
                  setState(() {
                    langRadioGroup = value;
                  });
                  print(langRadioGroup);
                },
                value: 1,
              ),
              RadioListTile(
                title: Text("Dart"),
                groupValue: langRadioGroup,
                onChanged: (value) {
                  setState(() {
                    langRadioGroup = value;
                    print(langRadioGroup);
                  });
                },
                value: 2,
              ),
              CheckboxListTile(
                // activeColor: Colors.green,
                // checkColor: Colors.red,
                title: Text("Do you agree our terms & conditions?"),
                // secondary: Icon(Icons.question_answer),
                subtitle: Text("subtitle"),
                onChanged: (bool val) {
                  setState(() {
                    checkTileValue = val;
                  });
                },
                value: checkTileValue,
              ),
              Center(
                child: RaisedButton(
                  onPressed: checkTileValue ? submit: null,
                  child: Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
