import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:huu_loc63130680_flutter/widget_connect_firebase.dart';

class PageUIAuth extends StatelessWidget {
  const PageUIAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return MyFirebaseConnect(
        errorMessage: "errorMessage",
        connectingMessage: "connectingMessage",
        builder: (context) => MaterialApp(
          home: PageSignIn(),
        ),
    );
  }
}

class PageSignIn extends StatelessWidget {
  const PageSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return SignInScreen(
              providerConfigs: [
                EmailProviderConfiguration(),
                PhoneProviderConfiguration(),
              ],
            );
          }
          return PageHomeAuth();
        },
    );
  }
}

class PageHomeAuth extends StatelessWidget {
  const PageHomeAuth({super.key});

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Auth"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Xin chao: ${user.displayName?? user.email?? user.phoneNumber??""}"),
            Text("User ID: ${user.uid}"),
            ElevatedButton(
                onPressed: () async{
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                      context, MaterialPageRoute(
                    builder: (context) => PageSignIn(),
                  ), (route) => false);
                },
                child: Text("Sign out")
            ),
          ],
        ),
      ),
    );
  }
}

