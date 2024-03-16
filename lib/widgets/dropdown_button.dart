import 'package:flutter/material.dart';
import 'package:huu_loc63130680_flutter/widgets/wrapper_data.dart';

class MyDropdownButton extends StatefulWidget {
  List<String> labelItems;
  StringWrapper value;
  Widget Function(String label)? itemBuilder;
  MyDropdownButton({required this.labelItems,required this.value, this.itemBuilder,super.key});

  @override
  State<MyDropdownButton> createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        isExpanded: true,
        value: widget.value.value,
        items: widget.labelItems.map(
                (label) => DropdownMenuItem(
                    value: label,
                    child: widget.itemBuilder!=null ?
                        widget.itemBuilder!(label):
                        Text(label)
                )
        ).toList(),
        onChanged: (value) {
          setState(() {
            widget.value.value=value;
          });
        },
    );
  }
}
