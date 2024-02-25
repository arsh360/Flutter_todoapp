import 'package:todoapp/note.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Cred extends StatefulWidget {
  const Cred({super.key});

  @override
  State<Cred> createState() => _CredState();
}

class _CredState extends State<Cred> {

static Future<User?> loginUsingEmailPassword({

required String email,
required String password,
required BuildContext context

})async{
  FirebaseAuth auth = FirebaseAuth.instance;
  User ? user;
try{
  UserCredential userCredential=await auth.signInWithEmailAndPassword(email: email, password: password),
  user =userCredential;
} on FirebaseAuthException catch(e){
  if(e.code == "user-not-found"){
    print("No user found for that email");
  }
}


}


  
  @override
  Widget build(BuildContext context) {
     final emailController =TextEditingController();
  final passwordController = TextEditingController();


     return Scaffold(
        body: Center(
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
          Card(
            margin: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                   TextFormField(
                    controller: emailController,
                            decoration: const InputDecoration(
                                labelText: 'Email Address'),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  !value.contains('@')) {
                                return 'Please enter a valid email address.';
                              }
                              return null;
                            },
                           
                          ),
                          const SizedBox(height: 10,),
                         TextFormField(
                          controller: passwordController,
                              decoration:
                                  const InputDecoration(labelText: 'Password'),
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.trim().length < 6) {
                                  return 'Password must be at least 6 characters long.';
                                }
                                return null;
                              },
                             
                            ),
                           SizedBox(height: 10,),
                          ElevatedButton(
                              onPressed: ()async {
                                User?user=await loginUsingEmailPassword(email: emailController.text

                                , password: passwordController.text, context: context);
                                if(user != null){
                                        Navigator.push(context, MaterialPageRoute(builder: (_)=> ChatScreen()));
                                }
                          
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                              ),
                              child: Text('Submit'),
                            ),
                  ],
                ),
              ),
            ),
          ),
        ]))));
  }
}