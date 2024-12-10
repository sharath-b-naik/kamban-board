// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

class GeneralTextField extends StatefulWidget {
  const GeneralTextField({
    super.key,
    required this.maxLength,
    required this.maxLine,
    this.minLine,
    this.onChange,
    this.textController,
    this.hintText,
  });

  final int maxLength;
  final int? minLine;
  final int maxLine;
  final ValueChanged<String>? onChange;
  final TextEditingController? textController;
  final String? hintText;

  @override
  State<GeneralTextField> createState() => _GeneralTextFieldState();
}

class _GeneralTextFieldState extends State<GeneralTextField> {
  int textLength = 0;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textController,
      maxLength: widget.maxLength,
      maxLines: widget.maxLine,
      minLines: widget.minLine ?? 1,
      decoration: InputDecoration(
        filled: true,
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              height: 1.3,
              fontSize: 13.sp,
              fontWeight: FontWeight.normal,
            ),
        suffix: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            '${widget.maxLength - textLength}',
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          ),
        ),
        counterText: '',
        fillColor: Theme.of(context).colorScheme.secondary,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
      ),
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            height: 1.3,
            fontSize: 13.sp,
            fontWeight: FontWeight.normal,
          ),
      onChanged: (value) {
        widget.onChange?.call(value);
        setState(() {
          textLength = value.length;
        });
      },
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
    );
  }
}
