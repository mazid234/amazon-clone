import 'package:amazon_clone_app/global_variables.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../utils/common_widget/custom_textfield.dart';
import '../widgets/custiom_button.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _userpasswordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            ListTile(
              tileColor: _auth == Auth.signup
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greybackgroundColor,
              title: const Text(
                "Create Account",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (value) {
                    setState(() {
                      _auth = value!;
                    });
                  }),
            ),
            if (_auth == Auth.signup)
              Form(
                  key: _signUpFormKey,
                  child: Container(
                    color: GlobalVariables.backgroundColor,
                    padding: EdgeInsets.all(6),
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _nameController,
                          hintText: "Name",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: _emailController,
                          hintText: "Email",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: "Password",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                          text: "Sign Up",
                          onTap: () {},
                        )
                      ],
                    ),
                  )),
            ListTile(
              tileColor: _auth == Auth.signin
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greybackgroundColor,
              title: const Text(
                "Sing-In",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      _auth = value!;
                    });
                  }),
            ),
            if (_auth == Auth.signin)
              Form(
                key: _signInFormKey,
                child: Container(
                  color: GlobalVariables.backgroundColor,
                  padding: EdgeInsets.all(6),
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _usernameController,
                        hintText: "Username",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _userpasswordController,
                        hintText: "pass",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        text: "Sign Ip",
                        onTap: () {},
                      )
                    ],
                  ),
                ),
              ),
          ],
        ),
      )),
    );
  }
}






// import 'package:flutter/material.dart';

// import '../../../utils/app_constants.dart';
// import '../../../utils/app_strings.dart';
// import '../../../utils/app_theme.dart';
// import '../../../utils/helper/snackbar_helper.dart';
// import '../../../utils/common_widget/gradient_background.dart';
// import '../widgets/textfield.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();

//   final ValueNotifier<bool> passwordNotifier = ValueNotifier(true);
//   final ValueNotifier<bool> fieldValidNotifier = ValueNotifier(false);

//   late final TextEditingController emailController;
//   late final TextEditingController passwordController;

//   void initializeControllers() {
//     emailController = TextEditingController()..addListener(controllerListener);
//     passwordController = TextEditingController()
//       ..addListener(controllerListener);
//   }

//   void disposeControllers() {
//     emailController.dispose();
//     passwordController.dispose();
//   }

//   void controllerListener() {
//     final email = emailController.text;
//     final password = passwordController.text;

//     if (email.isEmpty && password.isEmpty) return;

//     // if (AppRegex.emailRegex.hasMatch(email) &&
//     //     AppRegex.passwordRegex.hasMatch(password)) {
//     //   fieldValidNotifier.value = true;
//     // } else {
//     //   fieldValidNotifier.value = false;
//     // }
//   }

//   @override
//   void initState() {
//     initializeControllers();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     disposeControllers();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           const GradientBackground(
//             children: [
//               Text(
//                 AppStrings.signInToYourNAccount,
//                 style: AppTheme.titleLarge,
//               ),
//               SizedBox(height: 6),
//               Text(AppStrings.signInToYourAccount, style: AppTheme.bodySmall),
//             ],
//           ),
//           Form(
//             key: _formKey,
//             child: Padding(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   AppTextFormField(
//                     controller: emailController,
//                     labelText: AppStrings.email,
//                     keyboardType: TextInputType.emailAddress,
//                     textInputAction: TextInputAction.next,
//                     onChanged: (_) => _formKey.currentState?.validate(),
//                     validator: (value) {
//                       return value!.isEmpty
//                           ? AppStrings.pleaseEnterEmailAddress
//                           : AppConstants.emailRegex.hasMatch(value)
//                               ? null
//                               : AppStrings.invalidEmailAddress;
//                     },
//                   ),
//                   ValueListenableBuilder(
//                     valueListenable: passwordNotifier,
//                     builder: (_, passwordObscure, __) {
//                       return AppTextFormField(
//                         obscureText: passwordObscure,
//                         controller: passwordController,
//                         labelText: AppStrings.password,
//                         textInputAction: TextInputAction.done,
//                         keyboardType: TextInputType.visiblePassword,
//                         onChanged: (_) => _formKey.currentState?.validate(),
//                         validator: (value) {
//                           return value!.isEmpty
//                               ? AppStrings.pleaseEnterPassword
//                               : AppConstants.passwordRegex.hasMatch(value)
//                                   ? null
//                                   : AppStrings.invalidPassword;
//                         },
//                         suffixIcon: IconButton(
//                           onPressed: () =>
//                               passwordNotifier.value = !passwordObscure,
//                           style: IconButton.styleFrom(
//                             minimumSize: const Size.square(48),
//                           ),
//                           icon: Icon(
//                             passwordObscure
//                                 ? Icons.visibility_off_outlined
//                                 : Icons.visibility_outlined,
//                             size: 20,
//                             color: Colors.black,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: const Text(AppStrings.forgotPassword),
//                   ),
//                   const SizedBox(height: 20),
//                   ValueListenableBuilder(
//                     valueListenable: fieldValidNotifier,
//                     builder: (_, isValid, __) {
//                       return FilledButton(
//                         onPressed: isValid
//                             ? () {
//                                 SnackbarHelper.showSnackBar(
//                                   AppStrings.loggedIn,
//                                 );
//                                 emailController.clear();
//                                 passwordController.clear();
//                               }
//                             : null,
//                         child: const Text(AppStrings.login),
//                       );
//                     },
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     children: [
//                       Expanded(child: Divider(color: Colors.grey.shade200)),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: Text(
//                           AppStrings.orLoginWith,
//                           style: AppTheme.bodySmall.copyWith(
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                       Expanded(child: Divider(color: Colors.grey.shade200)),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: OutlinedButton.icon(
//                           onPressed: () {},
//                           icon: Icon(Icons.g_mobiledata),
//                           // SvgPicture.asset(Vectors.google, width: 14),
//                           label: const Text(
//                             AppStrings.google,
//                             style: TextStyle(color: Colors.black),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 20),
//                       Expanded(
//                         child: OutlinedButton.icon(
//                           onPressed: () {},
//                           icon: Icon(Icons.facebook),
//                           //  SvgPicture.asset(Vectors.facebook, width: 14),
//                           label: const Text(
//                             AppStrings.facebook,
//                             style: TextStyle(color: Colors.black),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 AppStrings.doNotHaveAnAccount,
//                 style: AppTheme.bodySmall.copyWith(color: Colors.black),
//               ),
//               const SizedBox(width: 4),
//               TextButton(
//                 onPressed: () {},
//                 // NavigationHelper.pushReplacementNamed(
//                 //   AppRoutes.register,
//                 // ),
//                 child: const Text(AppStrings.register),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
