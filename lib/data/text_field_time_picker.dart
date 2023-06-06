import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';

class TextFieldTimePicker extends StatefulWidget {
  final Function(DateTime?)? onTimeChanged;
  final Function(String?)? validatorCallBack;
  final DateTime? initialTime;
  final FocusNode? focusNode;
  final bool? fullWidth;
  final String? labelText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;

  TextFieldTimePicker({
    Key? key,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.onTimeChanged,
    this.initialTime,
    this.validatorCallBack,
    this.fullWidth,
  }) : super(key: key);

  @override
  _MyTextFieldDatePicker createState() => _MyTextFieldDatePicker();
}

class _MyTextFieldDatePicker extends State<TextFieldTimePicker> {
  late double screenWidth;
  TextEditingController? _controllerDate;
  DateTime? _selectedTime;
  FocusNode myFocusNode = new FocusNode();
  bool isDarkMode = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      widget.onTimeChanged!(widget.initialTime);
    });
    _selectedTime = widget.initialTime;
    _controllerDate = TextEditingController();
    _controllerDate!.text = _selectedTime != null
        ? DateFormat.jm().format(_selectedTime!).toString()
        : "";
  }

  OutlineInputBorder focusedErrorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(
          color: Color(0xFFde350b), width: 2),
    );
  }

  OutlineInputBorder focusedBorderColor() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(color: Theme.of(context).splashColor, width: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: widget.fullWidth! ? screenWidth - 32.0 : (screenWidth - 48.0) / 2,
      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: TextFormField(
        validator: widget.validatorCallBack as String? Function(String?)?,
        focusNode: myFocusNode,
        //focusNode: widget.focusNode;
        controller: _controllerDate,
        decoration: InputDecoration(
          errorBorder: focusedErrorBorder(),
          contentPadding: EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color(0xFFdfe1e6)),
            borderRadius: BorderRadius.circular(6),
          ),
          border: OutlineInputBorder(
            borderSide: const  BorderSide(
                color: Color(0xFFdfe1e6)),
            borderRadius: BorderRadius.circular(6),
          ),
          focusedBorder: focusedBorderColor(),
          focusedErrorBorder: focusedErrorBorder(),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          labelText: widget.labelText,
          errorStyle: const TextStyle(
              color: Color(0xFFde350b),
              fontWeight: FontWeight.w400),
          labelStyle:
          TextStyle(color: Theme.of(context).textTheme.bodyText2?.color),
          floatingLabelStyle:
          MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
            Color? color = states.contains(MaterialState.error)
                ? const Color(0xFFde350b)
                : Theme.of(context).splashColor;
            color = myFocusNode.hasFocus
                ? color
                : Theme.of(context).textTheme.bodyText2?.color;
            color = states.contains(MaterialState.error)
                ? const Color(0xFFde350b)
                : color;
            return TextStyle(color: color, fontWeight: FontWeight.w400);
          }),
        ),
        onTap: () => _selectDate(context),
        readOnly: true,
        style: TextStyle(color: Theme.of(context).textTheme.bodyText1?.color),
      ),
    );
  }

  @override
  void dispose() {
    _controllerDate!.dispose();
    super.dispose();
  }

  Future<Null> _selectDate(BuildContext context) async {

    final DateTime? pickedTime = await DatePicker.showTime12hPicker(context,
        currentTime: _selectedTime == null ? DateTime.now() : _selectedTime,
    );

    if (pickedTime != null &&
        pickedTime.toString() != _selectedTime.toString()) {
      _selectedTime = pickedTime;
      String value = DateFormat.jm().format(pickedTime);
      _controllerDate!.text = value;
      widget.onTimeChanged!(_selectedTime);
    }

    if (widget.focusNode != null) {
      widget.focusNode!.nextFocus();
    }
  }
}

class DatePickerTheme with DiagnosticableTreeMixin {
  final TextStyle cancelStyle;
  final TextStyle doneStyle;
  final TextStyle itemStyle;
  final Color backgroundColor;
  final Color? headerColor;

  final double containerHeight;
  final double titleHeight;
  final double itemHeight;

  const DatePickerTheme({
    this.cancelStyle = const TextStyle(color: Colors.black54, fontSize: 16),
    this.doneStyle = const TextStyle(color: Colors.blue, fontSize: 16),
    this.itemStyle = const TextStyle(color: Color(0xFF000046), fontSize: 18),
    this.backgroundColor = Colors.white,
    this.headerColor,
    this.containerHeight = 210.0,
    this.titleHeight = 44.0,
    this.itemHeight = 36.0,
  });
}
