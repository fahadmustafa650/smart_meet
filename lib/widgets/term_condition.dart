import 'package:flutter/material.dart';

class TermsCondition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Text(
        'By Creating An Account I agree to certain terms and conditions',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
