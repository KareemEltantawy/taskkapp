import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/local/cache_helper.dart';
import '../get_weights/get_weights_screen.dart';
import '../register/register_screen.dart';
import '../weight/weight_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';



class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            showToast(
              msg: state.error,
              backgroundColor: Colors.red,
            );
          }
          if(state is LoginSuccessState) {
            CacheHelper.saveData(
              key: 'uId',
              value: state.uId,
            ).then((value)
            {
              uId=state.uId;
              navigateAndFinish(context, WeightScreen());
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('LOGIN',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        SizedBox(height:20.0),
                        Text('Login now to communicate with friends',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'please enter your email address';
                            }
                          },
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          isPassword: LoginCubit.get(context).isPassword,
                          suffix: LoginCubit.get(context).isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                          suffixPressed: () {
                            LoginCubit.get(context).changePasswordVisibility();
                          },
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'password is too short';
                            }
                          },
                          label: 'Password',
                          prefix: Icons.lock_outline,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        state is! LoginLoadingState ? defaultButton(
                          function: () {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          text: 'login',
                        ) : Center(child: CircularProgressIndicator()),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            defaultTextButton(
                              function: () {
                                navigateTo(context, SocialRegisterScreen());
                              },
                              text: 'register',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
