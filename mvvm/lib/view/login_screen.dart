import 'package:flutter/material.dart';
import 'package:mvvm/uitil/routes/routes_name.dart';
import 'package:mvvm/uitil/routes/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            // Navigator.pushNamed(context, RoutesName.home);
            // Utils.toastMessage("No internet");
            // Utils.flushbarErrorMessage("Error Found in Loading", context);

            Utils.snackBar("Congratulations , You have done your job", context);
          },
          child: Text("Click"),
        ),
      ),
    );
  }
}
