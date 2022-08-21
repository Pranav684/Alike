import 'package:chatbox/screens/interests/interest.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:validators/validators.dart';
import 'package:chatbox/screens/login/login.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  static String routeName = "/regi";
  State<StatefulWidget> createState() {
    return Regi_State();
  }
}

class Regi_State extends State<Register> {
  static final _auth = FirebaseAuth.instance;
  static final _formkey = GlobalKey<FormState>();
  static String _userName = '';
  static String _userEmail = 'default@.com';
  static String _userPassword = '';
  static String _userGender = 'Male';
  static var Int;

  var isload = false;
  static void submit() async {
    try {
      UserCredential fireauth;
      fireauth = await _auth.createUserWithEmailAndPassword(
          email: _userEmail.trim(), password: _userPassword.trim());
      await FirebaseFirestore.instance
          .collection('users')
          .doc(fireauth.user.uid)
          .set({
        'username': _userName.trim(),
        'gender': _userGender.trim(),
        'interests': Int.toList(),
      });
    } on PlatformException catch (err) {
      var message = "Some error occured please check your credentials !";
      if (err.message != null) {
        message = err.message.toString();
      }
      // ignore: deprecated_member_use

    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    void _trySubmit() {
      final isValid = _formkey.currentState!.validate();
      FocusScope.of(context).unfocus();
      if (isValid) {
        _formkey.currentState!.save();
        //submit();
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            foregroundDecoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/regis.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                ),
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.purple,
                  ),
                  child: Image(
                    image: AssetImage('assets/images/regi.png'),
                  ),
                ),
                Container(
                  child: TextButton(
                    child: Text(
                      '+ Add Profile Picture',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                      ),
                    ),
                    onPressed: () {
                      print('photu daal photu!');
                    },
                  ),
                ),
                Container(
                  width: 200,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        // border: InputBorder.,
                        labelText: 'Name',
                        hintText: 'Enter Your Name'),
                    validator: (value) {
                      if (value == null || value.length < 5) {
                        return "Name must be of atleast 5 letters!";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _userName = value.toString();
                    },
                  ),
                ),
                Container(
                  height: 70,
                  margin: EdgeInsets.all(20),
                  child: GenderPickerWithImage(
                    showOtherGender: true,
                    verticalAlignedText: false,
                    selectedGender: Gender.Male,
                    selectedGenderTextStyle: TextStyle(
                        color: Color(0xFF8b32a8), fontWeight: FontWeight.bold),
                    unSelectedGenderTextStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.normal),
                    onChanged: (Gender? gender) {
                      if (gender!.index == 1) {
                        _userGender = 'Female';
                      } else if (gender.index == 2) {
                        _userGender = 'Others';
                      } else if (gender.index == 0) {
                        _userGender = 'Male';
                      }
                    },
                    equallyAligned: true,
                    animationDuration: Duration(milliseconds: 300),
                    isCircular: true,
                    // default : true,
                    opacityOfGradient: 0.3,
                    padding: const EdgeInsets.all(3),
                    size: 50, //default : 40
                  ),
                ),
                Container(
                  width: 200,
                  child: TextFormField(
                    scrollPadding: EdgeInsets.only(
                      bottom: 40,
                    ),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter Your Email',
                    ),
                    validator: (value) {
                      if (value == null || !value.contains('@')) {
                        return "Enter a valid email please!";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _userEmail = value.toString();
                    },
                  ),
                ),
                Container(
                  width: 200,
                  child: TextFormField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        // border: InputBorder.,
                        labelText: 'Password',
                        hintText: 'Enter Your Password'),
                    validator: (value) {
                      if (value == null || value.length < 8) {
                        return "Must be more then 8 characters!";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _userPassword = value.toString();
                    },
                  ),
                ),
                if (isload)
                  Container(
                    margin: EdgeInsets.all(15),
                    // height: 70,
                    // width: 280,
                    child: const CircularProgressIndicator(),
                  ),
                if (!isload)
                  Container(
                    margin: EdgeInsets.all(15),
                    height: 70,
                    //constraints: BoxConstraints.expand(),
                    width: 280,
                    child: ElevatedButton(
                      onPressed: () {
                        _trySubmit();
                        Navigator.pushNamed(context, Interest.routeName);
                      }, //_trySubmit,
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 27,
                          color: Color.fromARGB(255, 0, 57, 104),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: EdgeInsets.all(10),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.blue, width: 2),
                        ),
                      ),
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text('Already have an account ?'),
                    ),
                    Container(
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Login.routeName);
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        textColor: Color.fromARGB(255, 107, 0, 126),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
