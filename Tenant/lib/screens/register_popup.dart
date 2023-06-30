import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:tenant/widgets/reusable_common_widgets/constants.dart';
import 'package:tenant/widgets/reusable_common_widgets/rounded_button.dart';

class RegisterPopup extends StatefulWidget {
  // const RegisterPopup({Key? key}) : super(key: key);
  // VoidCallback onPressed;
  RegisterPopup();



  @override
  State<RegisterPopup> createState() => _RegisterPopupState();
}

class _RegisterPopupState extends State<RegisterPopup> {
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  String? validateEmail(String? value) {
    if (value != null) {
      if (value.length > 5 && value.contains('@') && value.endsWith('.com')) {
        return null;
      }
      return 'Enter a Valid Email Address';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        /*borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
          side: BorderSide(width: 2, color: GlobalConstants.colorAppBar)*/
        // borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)), //---commented on 26th Oct 2022
        borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5), bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5) ),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: contentBox(context),
    );
  }
  contentBox(context){

    return Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                // height: (MediaQuery.of(context).size.height-75),
                width: 350,
                // height: 250,
                // decoration: BoxDecoration(color: GlobalConstants.colorGridHeaderBackground,borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5))), //---commented on 26th Oct
                decoration: BoxDecoration(color: Color.fromRGBO(
                    228, 232, 238, 1.0),borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5), bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5) )),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText('Register', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),),
                              InkWell(onTap: (){
                                Navigator.pop(context);
                              },child: Image.asset('images/close.png', width: 25, height: 21.88,)),
                            ],
                          ),

                          //---Full Name, code starts
                          SizedBox(height: 15,),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: TextField(
                                controller: _nameController,
                                textAlign: TextAlign.left,
                                keyboardType: TextInputType.text,
                                maxLines: 1,
                                onChanged: (value){
                                  // userId = value;
                                  setState(() {
                                   /* if(value.isEmpty){
                                      DriverPopup.name = '';
                                      widget.driverName = '';
                                    }else{
                                      DriverPopup.name = value;
                                      widget.driverName = value;
                                    }*/

                                  });
                                },
                                style: TextStyle(color: Colors.black, fontFamily: 'Gilroy'),
                                decoration: kTextFieldDecorationForMFA.copyWith(fillColor: Color.fromRGBO(
                                    255, 255, 255, 1.0),hintText: 'Full Name'),
                              ),
                            ),
                          ),
                          //---Full Name, code ends

                          SizedBox(height: 15,),

                          //---Email Id, code starts---
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                      246, 242, 242, 1.0),hintText: 'Enter your email'),
                                ),
                              ),
                            ),
                          ),
                          //---Email Id, code ends---
                          // ---Mobile Number, code starts
                          SizedBox(height: 15,),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: SizedBox(
                              width: double.infinity,
                              height: 70,
                              child: TextField(
                                controller: _passwordController,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                obscureText: true,
                                onChanged: (value){
                                  // userId = value;
                                  setState(() {
                                    /*if(value.isEmpty){
                                      DriverPopup.mobno = '';
                                      widget.driverMobNo = '';
                                    }else{
                                      DriverPopup.mobno = value;
                                      widget.driverMobNo = value;
                                    }*/
                                  });
                                },
                                style: TextStyle(color: Colors.black, fontFamily: 'Gilroy'),
                                decoration: kTextFieldDecorationForMFA.copyWith(fillColor: Color.fromRGBO(
                                    255, 255, 255, 1.0),hintText: 'Password'),
                              ),
                            ),
                          ),
                          //---Mobile Number, code ends

                          SizedBox(height: 10,),

                          Container(
                            width: double.infinity,
                            height: 85,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: RoundedButton(colour: Color.fromRGBO(223, 137, 0, 1.0), title: 'Register', onPressed: () async {

                                Navigator.pop(context);
                              } ,

                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                  ],

                ),
              )
            ],
          ),]
    );
  }
}
