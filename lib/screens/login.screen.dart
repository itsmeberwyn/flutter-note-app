import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:note_app/screens/home.screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: double.maxFinite,
        width: double.maxFinite,
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                width: 110,
                height: MediaQuery.of(context).size.height / 5,
                child: const Image(
                  width: 10,
                  height: 10,
                  image: AssetImage('images/noteappsample.png'),
                ),
              ),
            ),
            KeyboardVisibilityBuilder(
              builder: (context, isKeyboardVisible) {
                if (isKeyboardVisible) {
                  return const SizedBox(height: 0);
                }
                return const SizedBox(height: 70);
              },
            ),
            RichText(
              text: const TextSpan(
                text: "Log in to Mnemonist",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: MaterialStateTextStyle.resolveWith(
                    (states) => TextStyle(
                      color: states.contains(MaterialState.focused)
                          ? Colors.blue
                          : Colors.white38,
                    ),
                  ),
                  hintText: "email@gmail.com",
                  hintStyle: const TextStyle(color: Colors.white38),
                  border: const OutlineInputBorder(),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white38,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: TextField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                obscureText: isObscure,
                decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: MaterialStateTextStyle.resolveWith((states) {
                      Color color = states.contains(MaterialState.focused)
                          ? Colors.blue
                          : Colors.white38;
                      return TextStyle(color: color);
                    }),
                    hintText: "password123",
                    hintStyle: const TextStyle(color: Colors.white38),
                    border: const OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white38),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isObscure ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                    )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                print("Forgot Password");
              },
              child: RichText(
                text: const TextSpan(
                  text: "Forgot Password?",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.maxFinite,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const HomeScreen();
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                ),
                child: const Text("Login"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
