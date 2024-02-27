import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:todo/common/common.dart';
import 'package:todo/common/dart/extension/context_extension.dart';
import 'package:todo/common/theme/colors.dart';

import '../../../common/widget/w_line.dart';
import '../../../common/widget/w_tap.dart';
import '../../../data/simple_result.dart';

class MessageDialog extends DialogWidget<SimpleResult> {
  final String? message;
  final String? buttonText;
  final bool cancelable;
  final TextAlign textAlign;
  final double fontSize;

  MessageDialog(
    this.message, {
    super.context,
    super.key,
    this.buttonText,
    this.fontSize = 14,
    this.cancelable = true,
    this.textAlign = TextAlign.start,
  });

  @override
  State<StatefulWidget> createState() {
    return _MessageDialogState();
  }
}

class _MessageDialogState extends DialogState<MessageDialog> {
  var isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(),
          ),
          Material(
            color: Colors.transparent,
            child: Container(
                constraints: BoxConstraints(maxHeight: context.deviceHeight),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              widget.message!,
                              style: TextStyle(
                                  fontSize: widget.fontSize,
                                  height: 1.8,
                                  color: darkMainColor),
                              textAlign: widget.textAlign,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        )
                      ],
                    ),
                    const Line(color: grey),
                    Tap(
                      onTap: () {
                        widget.hide(SimpleResult.success());
                      },
                      child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          child: Text(
                            widget.buttonText ?? 'close'.tr(),
                            style: const TextStyle(
                              color: darkMainColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            ),
                          )),
                    )
                  ],
                )),
          ),
          Expanded(
            child: Container(),
          )
        ],
      ),
    );
  }
}
