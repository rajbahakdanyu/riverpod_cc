import 'package:flutter/material.dart';

class CustomTextButton extends StatefulWidget {
  const CustomTextButton({
    Key? key,
    required this.func,
    required this.title,
  }) : super(key: key);

  final VoidCallback func;
  final String title;

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
      ),
      onPressed: widget.func,
      child: Text(widget.title),
    );
  }
}
