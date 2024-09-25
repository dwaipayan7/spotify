import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';
import 'package:spotify/domain/usecases/auth/signin.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';
import 'package:spotify/presentation/auth/pages/signup.dart';
import 'package:spotify/presentation/home/pages/home.dart';
import '../../../common/widgets/appbar/app_bar.dart';
import '../../../common/widgets/button/basic_app_button.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../../../service_locator.dart';

class SigninPage extends StatelessWidget {
   SigninPage({super.key});

  final TextEditingController _email = TextEditingController();
  
  final TextEditingController _password = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 30
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _registerText(),
              SizedBox(height: 50,),
              _emailField(context),
              SizedBox(height:20 ,),
              _passwordField(context),
              SizedBox(height:20 ,),
              BasicAppButton(
                  onPressed: () async{
                    var result = await sl<SigninUseCase>().call(
                      params: SigninUserReq(
                          email: _email.text.toString(),
                          password: _password.text.toString()),
                    );
                    result.fold(
                            (l){
                              var snackbar = SnackBar(content: Text(l),
                              behavior: SnackBarBehavior.floating,);
                              ScaffoldMessenger.of(context).showSnackBar(snackbar);
                            },
                            (r){
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
                            }
                    );
                  },
                  title: 'Sign In'
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: _signinText(context),
    );
  }

  Widget _registerText(){
    return const Text(
      'Sign In',
      style: TextStyle(fontSize: 25,
          fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  Widget _emailField(BuildContext context){
    return TextField(
      controller: _email,
      decoration: InputDecoration(
          hintText: 'Email'
      ).applyDefaults(
          Theme.of(context).inputDecorationTheme
      ),
    );
  }

  Widget _passwordField(BuildContext context){
    return TextField(
      controller: _password,
      decoration: InputDecoration(
          hintText: 'Password'
      ).applyDefaults(
          Theme.of(context).inputDecorationTheme
      ),
    );
  }

  Widget _signinText(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Not a member?',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14
            ),),
          TextButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupPage()));
              },
              child: Text(
                'Register Now', style: TextStyle(color: Colors.blue),
              )),
        ],
      ),
    );
  }

}
