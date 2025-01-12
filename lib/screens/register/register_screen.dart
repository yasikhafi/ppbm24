import 'package:demo/screens/core/components/default_button.dart';
import 'package:demo/screens/core/constant/colors.dart';
import 'package:demo/screens/core/constant/regex.dart';
import 'package:demo/screens/core/constant/sizes.dart';
import 'package:demo/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

late bool _passwordVisible;

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'RegisterScreen';
  final void Function()? onPressed;

  const RegisterScreen({super.key, this.onPressed});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _confirmpwdController = TextEditingController();

  void Function()? onPressed;

  void register(BuildContext context) async {
    // get auth service
    final auth = AuthService();

    if (_pwdController.text == _confirmpwdController.text) {
      try {
        auth.createUserWithEmailAndPassword(
            _emailController.text, _pwdController.text);
        // ignore: use_build_context_synchronously
        // Navigator.pushNamedAndRemoveUntil(
        //     context, AppNavBar.routeName, (route) => false);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text('Error'),
                  content: Text(e.toString()),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: const Text('Passwords do not match'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              ));
    }
  }

  final formKey = GlobalKey<FormState>();
  @override

  /// Initializes [_passwordVisible] to true, so that the password is initially
  /// obscured.
  void initState() {
    _passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: ListView(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 300,
                    width: 300,
                  ),
                  const SizedBox(
                    height: kDefaultPadding / 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hi! Welcome to',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: textColorBlack,
                            ),
                      ),
                      Text(
                        ' Wizard Math',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: textColorBlack,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  sizedBox,
                  Text("Let's create an account!",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: textColorBlack)),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kDefaultPadding * 3),
                  topRight: Radius.circular(kDefaultPadding * 3),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding * 1.5),
                child: Column(
                  children: [
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          sizedBox,
                          buildEmailField(),
                          sizedBox,
                          buildPasswordField(),
                          sizedBox,
                          buildConfirmPasswordField(),
                          sizedBox,
                          DefaultButton(
                            onPressed: () => register(context),
                            title: 'Register',
                            buttoncolor: otherColor,
                            textcolor: textColorWhite,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: kDefaultPadding * 2,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Divider(
                            color: textColorWhite,
                            thickness: 1.0,
                            indent: 60,
                            endIndent: 5,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          child: Text(
                            'Already have an account?',
                            style: TextStyle(
                              color: textColorWhite,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Divider(
                            color: textColorWhite,
                            thickness: 1.0,
                            indent: 5,
                            endIndent: 60,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: kDefaultPadding * 2,
                    ),
                    OutlinedButton(
                      onPressed: onPressed,
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            color: backgroundColor,
                            width: 1.0), // Set the border color and width
                        minimumSize: const Size(
                            double.infinity, 60), // Set the width and height
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(kDefaultPadding),
                        ),
                      ),
                      child: const Text(
                        'Login Now',
                        style: TextStyle(
                          color: otherColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildConfirmPasswordField() {
    return TextFormField(
      controller: _confirmpwdController,
      obscureText: _passwordVisible,
      keyboardType: TextInputType.visiblePassword,
      style: const TextStyle(
        color: textColorWhite,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        hintText: 'Enter your confirm password',
        prefixIcon: const Icon(
          Icons.lock,
          color: textColorWhite,
          size: 25,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        isDense: true,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
          icon: Icon(
            _passwordVisible
                ? Icons.visibility_off_outlined
                : Icons.visibility_off_outlined,
          ),
          iconSize: kDefaultPadding,
          color: textColorWhite,
        ),
      ),
      validator: (value) {
        if (value!.length < 5) {
          return 'Password must be at least 5 characters';
        }
        return null;
      },
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(
        color: textColorWhite,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        prefixIcon: Icon(
          Icons.email,
          color: textColorWhite,
          size: 25,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        isDense: true,
      ),
      validator: (value) {
        RegExp regExp = RegExp(emailPattern);
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        } else if (!regExp.hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      controller: _pwdController,
      obscureText: _passwordVisible,
      keyboardType: TextInputType.visiblePassword,
      style: const TextStyle(
        color: textColorWhite,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        prefixIcon: const Icon(
          Icons.lock,
          color: textColorWhite,
          size: 25,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        isDense: true,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
          icon: Icon(
            _passwordVisible
                ? Icons.visibility_off_outlined
                : Icons.visibility_off_outlined,
          ),
          iconSize: kDefaultPadding,
          color: textColorWhite,
        ),
      ),
      validator: (value) {
        if (value!.length < 5) {
          return 'Password must be at least 5 characters';
        }
        return null;
      },
    );
  }
}
