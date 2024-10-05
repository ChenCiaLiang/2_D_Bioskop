import 'package:flutter/material.dart';
import 'package:tubez/theme.dart';

bool isObscure = true;

Padding inputForm(Function(String?) validasi, {required TextEditingController controller,
required String hintTxt, bool password = false}) {
    return Padding(
      padding: kDefaultPadding,
      child: SizedBox(
        width: 350,
        child : TextFormField(
          validator: (value) => validasi(value),
          autofocus: true,
          controller: controller,
          obscureText: password,
          decoration: InputDecoration(
            hintText: hintTxt,
          ),
        )
      ),
    );
}

Padding inputFormPassword(Function(String?) validasi, {required TextEditingController controller,
required String hintTxt, required IconData iconData, bool password = false}) {
    return Padding(
      padding: kDefaultPadding,
      child: SizedBox(
        width: 350,
        child : TextFormField(
          validator: (value) => validasi(value),
          autofocus: true,
          controller: controller,
          obscureText: password,
          decoration: InputDecoration(
            hintText: hintTxt,
            suffixIcon: password
                ? IconButton(
                    onPressed: () {          
                      if(isObscure == true){
                        isObscure = false;
                      }else{
                        isObscure = true;
                      }
                    },
                    icon: Icon(
                      isObscure ? Icons.visibility_off : Icons.visibility,
                      color: kTextFieldColor,
                    ),
                  )
                : null
          ),
        )
      ),
    );
}