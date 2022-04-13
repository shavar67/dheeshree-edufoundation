import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({ Key? key }) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  bool _isVisiblePassword = false;
  bool _isVisibleConfirmPassword = false;
  bool _isEightCharacters = false;
  String _password = "";

  // onPasswordChanged(String password) {
  //   setState(() {
  //     if(password.length >= 8){
  //       _isEightCharacters = true;
  //     }
  //   });
  // }

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async{
    if(_formKey.currentState!.validate()){
      Fluttertoast.showToast(  
        msg: 'Your account has been successfully created',  
        toastLength: Toast.LENGTH_SHORT,  
        gravity: ToastGravity.BOTTOM,  
        backgroundColor: Colors.lightGreen,  
        textColor: Colors.white  
      );  
      // await Future.delayed(Duration(seconds:1));
      // Navigator.pushReplacementNamed(context, 'home');

      //this is for debugging stage only. Above is the correct one to be used
      Navigator.pushNamed(context, 'home');
    }
  }

  @override
  Widget build(BuildContext context) {    
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/register.png'),
          fit: BoxFit.cover,
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(40, 20, 20, 40),
              child: const Text(
                'Happy to\nhave YOU',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 56.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.28, left: 30, right: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  // Text fields to input email and password for signing in
                  children: [
                    TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return "Email cannot be empty";
                        }
                        else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return "Please enter a valid email address";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 40,),
                    TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return "Password cannot be empty";
                        }
                        else if(value.length<8){
                          return "Password has to be 8 characters or more";
                        }
                        setState(() {
                          _password = value;
                        });
                        return null;
                      },
                      obscureText: !_isVisiblePassword,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              _isVisiblePassword = !_isVisiblePassword;
                            });
                          }, 
                          icon: _isVisiblePassword ? Icon(Icons.visibility_off) : Icon(Icons.visibility)
                        ),
                        hintText: 'Password',
                      ),
                    ),
                    const SizedBox(height: 40,),
                    TextFormField(
                      validator: (value){
                        if(value != _password){
                          return "Please enter the same password";
                        }
                        return null;
                      },
                      obscureText: !_isVisibleConfirmPassword,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              _isVisibleConfirmPassword = !_isVisibleConfirmPassword;
                            });
                          }, 
                          icon: _isVisibleConfirmPassword ? Icon(Icons.visibility_off) : Icon(Icons.visibility)
                        ),
                        hintText: 'Confirm Password',
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Button for sign in
                        Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color(0xff4c505b),
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Color(0xff4c505b),
                          radius: 30,
                          child: IconButton(
                            color: Colors.white,
                            onPressed: (){
                              moveToHome(context);
                            }, 
                            icon: Icon(Icons.arrow_forward),
                            ),
                        )
                      ],
                    ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Button for Sign in
                        TextButton(
                          onPressed: (){
                            Navigator.pushReplacementNamed(context, 'login');
                          }, 
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                          ),
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        
                        // // Button for Forget Password
                        // TextButton(
                        //   onPressed: (){}, 
                        //   child: Text(
                        //     'Forget Password?',
                        //     style: TextStyle(
                        //       fontSize: 18,
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}