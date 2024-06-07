import 'package:flutter/material.dart';
import 'package:mvvm/resource/components/round_button.dart';
import 'package:mvvm/uitil/routes/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode _emailfocusNode = FocusNode();
  FocusNode _passwordfocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _obsecurePassword.dispose();
    _emailfocusNode.dispose();
    _passwordfocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              focusNode: _emailfocusNode,
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email",
                labelText: "Email",
                prefixIcon: Icon(Icons.email),
              ),
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(
                    context, _emailfocusNode, _passwordfocusNode);
              },
            ),
            ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: _obsecurePassword.value,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      hintText: "password",
                      labelText: "password",
                      prefixIcon: Icon(Icons.lock_open_outlined),
                      suffixIcon: InkWell(
                          onTap: () {
                            _obsecurePassword.value = !_obsecurePassword.value;
                          },
                          child: _obsecurePassword.value
                              ? Icon(Icons.visibility_off_outlined)
                              : Icon(Icons.visibility)),
                    ),
                  );
                }),
            SizedBox(
              height: height * 0.085,
            ),
            RoundButton(
              title: "Login",
              onpress: () {
                if (_emailController.text.isEmpty) {
                  Utils.flushbarErrorMessage("Please Enter Email", context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.flushbarErrorMessage('Please Enter Password', context);
                } else if (_passwordController.text.length < 6) {
                  Utils.flushbarErrorMessage(
                      "Please Enter 6 digit password", context);
                } else {
                  print('api hit');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
