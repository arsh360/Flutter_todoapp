import 'package:todoapp/auth.dart';
import 'package:todoapp/newtodo.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ChatScreen extends StatelessWidget{
  const ChatScreen({super.key});

Future<void> logout() async{
  final GoogleSignIn googleSignIn= GoogleSignIn();
  await googleSignIn.signOut();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note App'),
        actions: [
          
          IconButton(onPressed: () async{ 
              await logout();
              Navigator.push(context,MaterialPageRoute(builder: (_) =>AuthScreen() ));
          }, icon: Icon(Icons.exit_to_app,color: Theme.of(context).colorScheme.primary,),),
        ],
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
        
     floatingActionButton: FloatingActionButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (_)=> Newtodo()));
     },child: Icon(Icons.add),),
    );
  }
}