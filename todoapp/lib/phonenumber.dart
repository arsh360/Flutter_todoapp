import 'package:todoapp/auth.dart';
import 'package:todoapp/forgotpassword.dart';
import 'package:todoapp/otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Phone extends StatefulWidget {
  const Phone({super.key});

static String verify="";
  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  final auth = FirebaseAuth.instance;
  TextEditingController countryController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  void initState() {
    countryController.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => AuthScreen()));
          },
          icon:const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const    Text(
              "Phone Number Verification",
              style: TextStyle(fontSize: 33),
            ),
            const SizedBox(
              height: 10,
            ),
        const    Text("Enter the phone number!!!"),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 55,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 40,
                    child: TextField(
                      controller: countryController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const Text(
                    "|",
                    style: TextStyle(fontSize: 33, color: Colors.grey),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Phone",
                    ),
                  ))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  await auth.verifyPhoneNumber(
                      phoneNumber:
                          '${countryController.text + phoneController.text}',
                      verificationCompleted: (_) {},
                      verificationFailed: (e) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(e.message.toString()),
                            );
                          },
                        );
                      },
                      codeSent: (String verificationId, int? token) {
                        Phone.verify=verificationId;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    MyVerify()));
                      },
                      codeAutoRetrievalTimeout: (e) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(e.toString()),
                            );
                          },
                        );
                      });
                },
                child: const Text("Get OTP"))
          ]),
        ),
      ),
    );
  }
}