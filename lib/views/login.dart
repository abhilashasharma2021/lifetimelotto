import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:lifetimelotto/views/bottom_navigation.dart';
import 'package:lifetimelotto/views/splash.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late bool _obscureText=true;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate() {
    if (formkey.currentState!.validate()) {
      print("Validated");
    } else {
      print("Not Validated");
    }
  }


  String? validatepass(value) {
    if (value.isEmpty) {
      return ("Required");
    } else if (value.length < 6) {
      return "Should Be at least 6 Charaters";
    } else if (value.length > 15) {
      return "Should Not Be More Than  15 Charaters";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: width,
                height: 300,
                child: Container(
                  alignment: Alignment.center,
                  width: 120,
                  height: 120,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.cover,
                    height: 200,
                    width: 200,
                  ),
                  decoration: new BoxDecoration(
                    //You can just put the six digit hexa after (0xFF**......**):
                    color:  const Color(0xFFEEF0FF),
                    borderRadius: new BorderRadius.all(new Radius.circular(25)),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 15, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(padding: EdgeInsets.all(5)),
                    Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold,),
                      textAlign: TextAlign.left,

                    ),
                    Text(
                      'Please Login To Continue',
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.all(25),
                child: Center(
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: 'User Email'),
                          //       validator: EmailValidator(errorText: "Not A Valid Email"),
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required *"),
                            EmailValidator(errorText: "Not A Valid Email"),
                          ]),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 20,
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              suffixIcon:GestureDetector(
                                onTap: (){
                                  setState((){
                                    _obscureText=!_obscureText;
                                  });
                                },
                                child: Icon(_obscureText
                                    ?Icons.visibility:
                                Icons.visibility_off),
                              ),
                              border: OutlineInputBorder(),
                              labelText: 'Password',),

                            validator: validatepass,
                            obscureText: _obscureText,
                            //validator: MinLengthValidator(6,errorText:"Should Be at least 6 Characters"),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                              top: 40.0,
                            ),
                            child: SizedBox(
                              width: width,
                              height: 50.0,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (formkey.currentState!.validate()) {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => BottomNavigation(),
                                      ),
                                    );
                                  }
                                },
                                child: Text("Log In",
                                    style: TextStyle(fontSize: 14)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF4E5FED),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        25), // <-- Radius
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

