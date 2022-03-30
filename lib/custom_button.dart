import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({
    Key key, this.textButton, this.color, this.onPress
  }) : super(key: key, );

  final String textButton;
  final Color color;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
        ),
        onPressed: 
          onPress,
        
        child:  Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 50.0,
            vertical: 30.0,
          ),
          child:  Text(
            textButton,
            style: const TextStyle(
              fontSize: 26.0,
            ),
          ),
        ),
      ),
    );
  }
}