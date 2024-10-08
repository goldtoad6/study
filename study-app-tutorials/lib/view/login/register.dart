import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tutorials/component/log/logs.dart';
import 'package:tutorials/component/toast/Toasts.dart';
import 'package:tutorials/constant/color_constant.dart';
import 'package:tutorials/constant/route_constant.dart';
import 'package:tutorials/locale/translations.dart';
import 'package:tutorials/request/model/register/register_request_param.dart';
import 'package:tutorials/request/model/security_code_request_param.dart';
import 'package:tutorials/request/security_code_requests.dart';
import 'package:tutorials/utils/app_utils.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _obscureText = true;
  bool _obscureText2 = true;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordAgainController = TextEditingController();
  TextEditingController securityCodeController = TextEditingController();


  @override
  void initState() {
    super.initState();
    userNameController.text = ('bage1001@qq.com');
    passwordController.text = ('123456');
    passwordAgainController.text = ('123456');
    securityCodeController.text = ('5374');
  }

  @override
  Widget build(BuildContext context) {
    String _imageUrl = SecurityCodeRequests.url(SecurityCodeRequestParam());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: ColorConstant.app_bar_only_back_color),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(image: AssetImage("assets/images/logo128.png")),
                const SizedBox(height: 16),
                Text(
                  Translations.textOf(context, 'register.hint'),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF262626),
                  ),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: userNameController,
                  decoration: InputDecoration(
                    hintText:
                        Translations.textOf(context, 'register.mail.hint'),
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFA8A8A8),
                    ),
                    // suffixIcon: const Icon(Icons.email, color: Color(0xFFA8A8A8)),
                    prefixIcon:
                        const Icon(Icons.email, color: Color(0xFFA8A8A8)),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 17, vertical: 22),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFD0D0D0))),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFD0D0D0))),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFD0D0D0))),
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: passwordController,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          hintText: Translations.textOf(
                              context, 'register.password.hint'),
                          hintStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFA8A8A8),
                          ),
                          suffixIcon: IconButton(
                              icon: Icon(!_obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              }),
                          prefixIcon: const Icon(Icons.vpn_key,
                              color: Color(0xFFA8A8A8)),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 17, vertical: 22),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFD0D0D0))),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFD0D0D0))),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFD0D0D0))),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        obscureText: _obscureText2,
                        controller: passwordAgainController,
                        decoration: InputDecoration(
                          hintText: Translations.textOf(
                              context, 'register.password.again.hint'),
                          hintStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFA8A8A8),
                          ),
                          suffixIcon: IconButton(
                              icon: Icon(!_obscureText2
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _obscureText2 = !_obscureText2;
                                });
                              }),
                          prefixIcon: const Icon(Icons.vpn_key,
                              color: Color(0xFFA8A8A8)),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 17, vertical: 22),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFD0D0D0))),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFD0D0D0))),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFD0D0D0))),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: securityCodeController,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: Translations.textOf(
                              context, 'register.security.hint'),
                          hintStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFA8A8A8),
                          ),
                          prefixIcon: const Icon(Icons.security_rounded,
                              color: Color(0xFFA8A8A8)),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 17, vertical: 22),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFD0D0D0))),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFD0D0D0))),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFD0D0D0))),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        _imageUrl = SecurityCodeRequests.url(
                            SecurityCodeRequestParam());
                      },
                      child: Container(
                        width: 120,
                        height: 64,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFFD0D0D0),
                          ),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: _imageUrl,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => const Image(
                              image: AssetImage("assets/images/user_null.png")),
                          height: 64,
                          width: 64,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    next();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF0043CE),
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    fixedSize: const Size(342, 64),
                  ),
                  child: Text(
                    Translations.textOf(context, 'register.next'),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFF4F4F4),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void next() {
    RegisterRequestParam param = RegisterRequestParam();
    param.userName = userNameController.text;
    param.password = passwordController.text;
    param.securityCode = securityCodeController.text;

    bool fail = checkParam(param);
    if(fail){
      return ;
    }
    String str = json.encode(param.toJson());
    Logs.info("json : $str");
    AppUtils.toPage(context, RouteNameConstant.route_name_register_verify,
        args: str);
  }


  bool checkParam(RegisterRequestParam param) {
    if((param.userName?.length??0) <= 0){
      Toasts.show('user name can not be empty');
      return true;
    }
    if((param.password?.length??0) <= 0){
      Toasts.show('password can not be empty');
      return true;
    }
    if((param.password?.length??0) != (passwordAgainController.text?.length??0)){
      Toasts.show('password not same');
      return true;
    }
    if((param.securityCode?.length??0) <= 0){
      Toasts.show('security code can not be empty');
      return true;
    }
    return false;

  }
}
