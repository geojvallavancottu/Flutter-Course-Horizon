import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () async {
                try {
                  final GoogleSignInAccount googleSignInAccount =
                      await googleSignIn.signIn();
                  final GoogleSignInAuthentication googleSignInAuthentication =
                      await googleSignInAccount.authentication;
                  final AuthCredential credential =
                      GoogleAuthProvider.getCredential(
                    idToken: googleSignInAuthentication.idToken,
                    accessToken: googleSignInAuthentication.accessToken,
                  );
                  final AuthResult authResult =
                      await auth.signInWithCredential(credential);
                  final FirebaseUser user = authResult.user;
                  if (!user.isAnonymous) {
                    print(user.displayName);
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: Text("Sign In With Google"),
            ),
          ],
        ),
      ),
    );
  }
}
