// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

//Updated
class TextFieldDatePicker extends StatefulWidget {
  final ValueChanged<DateTime?> onDateChanged;
  final Function(String?)? validatorCallBack;
  VoidCallback? onDeleteCallback;
  DateTime? initialDate = DateTime(DateTime.now().year);
  final DateTime firstDate;
  final bool? fullWidth;
  final DateTime lastDate;
  final DateFormat? dateFormat;
  final FocusNode? focusNode;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon; // fix
  bool? showDeleteButton = false;
  TextEditingController? controller;

  TextFieldDatePicker({
    Key? key,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.dateFormat,
    required this.lastDate,
    required this.firstDate,
    this.initialDate,
    required this.onDateChanged,
    this.validatorCallBack,
    this.fullWidth,
    this.onDeleteCallback,
    this.showDeleteButton,
    this.controller,
  })  : assert(firstDate != null),
        assert(lastDate != null),
        assert(!firstDate.isAfter(lastDate),
        'lastDate must be on or after firstDate'),
        assert(onDateChanged != null, 'onDateChanged must not be null'),
        super(key: key);

  @override
  _MyTextFieldDatePicker createState() => _MyTextFieldDatePicker();
}

class _MyTextFieldDatePicker extends State<TextFieldDatePicker> {
  late double screenWidth;
  TextEditingController _controllerDate = TextEditingController();
  DateFormat? _dateFormat;
  DateTime? _selectedDate;
  FocusNode myFocusNode = new FocusNode();
  bool isDarkMode = false;
  bool isDelete = false;

  @override
  void dispose() {
    super.dispose();
    myFocusNode.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      widget.onDateChanged(widget.initialDate);
    });
    if (widget.dateFormat != null) {
      _dateFormat = widget.dateFormat;
    } else {
      // DateFormat("yyyy-MM-ddTHH:mm:ss").format(value  ?? DateTime.now());
      _dateFormat = DateFormat('dd/MM/yyyy');
    }

    _selectedDate = widget.initialDate;

    widget.controller == null
        ? _controllerDate.text =
    _selectedDate != null ? _dateFormat!.format(_selectedDate!) : ""
        : widget.controller!.text =
    _selectedDate != null ? _dateFormat!.format(_selectedDate!) : "";
  }

  OutlineInputBorder focusedErrorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(
          color: Color(0xFFde350b), width: 2),
    );
  }

  OutlineInputBorder focusedBorderColor() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(
          color: Color(0xff1468b3),
          width: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: widget.fullWidth! ? screenWidth - 32 : (screenWidth - 48.0) / 2,
      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: TextFormField(
        validator: widget.validatorCallBack as String? Function(String?)?,
        focusNode: myFocusNode,
        controller:
        widget.controller == null ? _controllerDate : widget.controller,
        decoration: InputDecoration(
          errorBorder: focusedErrorBorder(),
          contentPadding: EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color(0xFFdfe1e6),
                width: 2),
            borderRadius: BorderRadius.circular(6),
          ),
          focusedBorder: focusedBorderColor(),
          focusedErrorBorder: focusedErrorBorder(),
          border: OutlineInputBorder(
            borderSide: new BorderSide(
                width: 2,
                color: Color(0xFFdfe1e6)),
            borderRadius: BorderRadius.circular(6),
          ),
          prefixIcon: widget.prefixIcon,
          suffixIcon: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // added line
            mainAxisSize: MainAxisSize.min, // added line
            children: <Widget>[
              widget.suffixIcon!,
              widget.showDeleteButton == true
                  ? IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  setState(() {
                    widget.controller == null
                        ? _controllerDate.clear()
                        : widget.controller!.clear();
                  });
                  widget.onDeleteCallback != null
                      ? widget.onDeleteCallback!.call()
                      : null;
                },
              )
                  : Container(),
            ],
          ),
          labelText: widget.labelText,
          errorStyle: TextStyle(
              color: Color(0xFFde350b),
              fontWeight: FontWeight.w400),
          labelStyle:
          TextStyle(color: Theme.of(context).textTheme.bodyText2?.color,),
          floatingLabelStyle:
          MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
            Color? color = states.contains(MaterialState.error)
                ?  Color(0xFFde350b)
                : Color(0xff1468b3);
            color = myFocusNode.hasFocus
                ? color
                : Theme.of(context).textTheme.bodyText2?.color;
            color = states.contains(MaterialState.error)
                ? Color(0xFFde350b)
                : color;
            return TextStyle(color: color, fontWeight: FontWeight.w400);
          }),
        ),
        style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1?.color,
            fontSize: 13
        ),
        onTap: () => _selectDate(context),
        readOnly: true,
      ),
    );
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await DatePicker.showDatePicker(
      context,
      onConfirm: (time) {
        widget.controller == null
            ? _controllerDate.text = _dateFormat!.format(time)
            : widget.controller!.text = _dateFormat!.format(time);

        widget.onDateChanged(time);
      },
      minTime: widget.firstDate,
      maxTime: widget.lastDate,
      currentTime: _selectedDate,
      theme: const DatePickerTheme(
          itemStyle:
          TextStyle(color: Colors.black),
          cancelStyle:
          TextStyle(color: Colors.black),
          backgroundColor: Colors.white),
      showTitleActions: true,
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      _selectedDate = pickedDate;

      widget.controller == null
          ? _controllerDate.text = _dateFormat!.format(_selectedDate!)
          : widget.controller!.text = _dateFormat!.format(_selectedDate!);

      widget.onDateChanged(_selectedDate);
    }

    if (widget.focusNode != null) {
      widget.focusNode!.nextFocus();
    }
  }
}
