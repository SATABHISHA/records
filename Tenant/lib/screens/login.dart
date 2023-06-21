import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tenant/widgets/reusable_common_widgets/constants.dart';
import 'package:tenant/widgets/reusable_common_widgets/rounded_button.dart';
import 'package:auto_size_text/auto_size_text.dart';


final _firestore = FirebaseFirestore.instance;
class Login extends StatefulWidget {
  // const Login({Key? key}) : super(key: key);
  static String id = 'Login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String? validateEmail(String? value) {
    if (value != null) {
      if (value.length > 5 && value.contains('@') && value.endsWith('.com')) {
        return null;
      }
      return 'Enter a Valid Email Address';
    }
  }

  void messagesStream() async {
    await for( var snapshot in _firestore.collection('User').snapshots()){
      for (var message in snapshot.docs){
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    messagesStream();
    var email, pwd;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        // backgroundColor: Color.fromRGBO(2, 72, 254, 1.0),

        /*appBar: AppBar(
          // backgroundColor: Color.fromRGBO(71, 71, 71, 1.0),
          backgroundColor: Color.fromRGBO(2, 72, 254, 1.0),
          centerTitle: false,
          automaticallyImplyLeading: false,
          actions: [
            Builder(
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text('Hello ${EmployeeLogin.employeeJsonData['employee']['employee_full_name']} (${EmployeeLogin.employeeJsonData['user']['user_name']})', style: TextStyle(fontSize: 14, color: Colors.white),),
                        // MediaQuery.of(context).size.width > 950 ? Text('Hello nnnd nfnnfnnf fnnfnfnfnf', style: TextStyle(fontSize: 14, color: Colors.white),) : SizedBox(),

                        SizedBox(width: 10,),

                      ],
                    ),
                  );
                }
            ),
          ],

        ),*/
        body: Container(
          // color: Colors.lightGreenAccent,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  // Color.fromRGBO(2, 72, 254, 1.0),
                  Colors.blue,
                  Colors.yellow,
                  Colors.redAccent,

                ],
              )
              // color: Color.fromRGBO(2, 72, 254, 1.0)
          ),
          child: SafeArea(
            child: Stack(
                children: [
                  /*Column(
                    crossAxisAlignment:CrossAxisAlignment.stretch,
                    mainAxisAlignment:MainAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                            child: Image.asset("images/safetranslogappbarlogo.png", width: 164, height: 48,),
                          )),
                      SizedBox(height: 20,),
                      Image.asset("images/safetransloglogo.png", width: 150, height: 150,),
                      SizedBox(height: 20,),
                      Center(child: Text('SafeTranslog.com', style: TextStyle(color: Color.fromRGBO(
                          250, 250, 250, 1.0), fontSize: 20, fontWeight: FontWeight.bold),)),
                    ],
                  ),*/
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Container(
                          width: double.infinity,
                          // color: Colors.white,
                          decoration: BoxDecoration(
                            /*boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(215, 227, 105, 1.0),
                                blurRadius: 15.0,
                                spreadRadius: 2.0,
                                offset: Offset(0.0, 0.0),
                              )
                            ],*/
                              borderRadius: BorderRadius.circular(20),
                              // color: Colors.white
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.white,
                                Colors.lightGreenAccent,

                              ],
                            )
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                                child: Center(child: Text('Let\'s Start', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19))),
                              ),
                              SizedBox(height: 10,),
                              //---Email Id, code starts---
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Text('Enter your email', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: Color.fromRGBO(
                                    74, 74, 75, 1.0))),
                              ),
                              SizedBox(height: 0,),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: Form(
                                    autovalidateMode: AutovalidateMode.always,
                                    child: TextFormField(
                                      // controller: _controller_user_id,
                                      validator: validateEmail,
                                      textAlign: TextAlign.left,
                                      keyboardType: TextInputType.emailAddress,
                                      onChanged: (value){
                                        // userId = value;

                                      },
                                      style: TextStyle(color: Colors.black, fontFamily: 'Gilroy'),
                                      decoration: kTextFieldDecorationForMFA.copyWith(fillColor: Color.fromRGBO(
                                          246, 242, 242, 1.0),hintText: ''),
                                    ),
                                  ),
                                ),
                              ),
                              //---Email Id, code ends---


                              //---Password, code starts
                              SizedBox(height: 15,),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: AutoSizeText(
                                  'Enter your Password',
                                  style: TextStyle(color: Color.fromRGBO(
                                      86, 85, 85, 1.0),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  wrapWords: true,
                                  minFontSize: 8,
                                  maxFontSize: 15,
                                  maxLines: 1,
                                  textAlign: TextAlign.left,),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: TextField(
                                    // controller: _controller_user_id,
                                    textAlign: TextAlign.left,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: true,
                                    maxLines: 1,
                                    onChanged: (value){
                                      // userId = value;
                                      setState(() {
                                        // CompanyDetails.companyName = value;
                                        /*if(value.isEmpty){
                                          CompanyDetails.companyName = 'ARB Software India Pvt Ltd';
                                        }else{
                                          CompanyDetails.companyName = value;
                                        }*/
                                      });
                                    },
                                    style: TextStyle(color: Colors.black, fontFamily: 'Gilroy'),
                                    decoration: kTextFieldDecorationForMFA.copyWith(fillColor: Color.fromRGBO(246, 242, 242, 1.0),hintText: ''),
                                  ),
                                ),
                              ),
                              //---Password, code ends

                              /*Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: IntlPhoneField(
                                  decoration: InputDecoration(
                                    // hintText: 'Phone Number'
                                    // labelText: 'Phone Number',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                  initialCountryCode: 'IN',
                                  onChanged: (phone) {
                                    print(phone.completeNumber);
                                  },
                                ),
                              ),*/


                              //----button code starts
                              Container(
                                width: double.infinity,
                                height: 85,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: RoundedButton(colour: Color.fromRGBO(6, 66, 222, 1.0), title: 'Continue', onPressed:() async {
                                    // EasyLoading.show(status: 'Loading...');
                                    // Navigator.pushNamed(context, VerifyUserMobile.id);
                                  }
                                  ),
                                ),
                              ),
                              //----button code ends

                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                                child: Center(child: Row(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('New User?', style: TextStyle(color: Color.fromRGBO(0, 70, 164, 1.0)),),
                                    MaterialButton( onPressed: (){}, child: Text('Register Now', style: TextStyle(color: Color.fromRGBO(0, 70, 164, 1.0)),)),
                                  ],
                                )),
                              ),

                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                child: Center(child: Text('Terms & Conditions | Privacy Policy', style: TextStyle(color: Color.fromRGBO(0, 70, 164, 1.0)),)),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(22, 0, 22, 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            // Text('Updated on 28.04.2023', style: TextStyle(color: Colors.white),),
                            Text('Version 1.1', style: TextStyle(color: Colors.white),)
                          ],
                        ),
                      )
                    ],
                  )
                ]
            ),
          ),
        ),
      ),
    );
  }
}
