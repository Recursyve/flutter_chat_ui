import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import '../models/send_button_visibility_mode.dart';

import 'attachment_button.dart';
import 'inherited_chat_theme.dart';
import 'inherited_l10n.dart';
import 'send_button.dart';

class NewLineIntent extends Intent {
  const NewLineIntent();
}

class SendMessageIntent extends Intent {
  const SendMessageIntent();
}

/// A class that represents bottom bar widget with a text field, attachment and
/// send buttons inside. By default hides send button when text field is empty.
class Input extends StatefulWidget {
  /// Creates [Input] widget
  const Input({
    Key? key,
    this.alwaysShowSendButton = false,
    this.isAttachmentUploading,
    this.onAttachmentPressed,
    required this.onSendPressed,
    this.onTextChanged,
    this.onTextFieldTap,
    required this.sendButtonVisibilityMode,
  }) : super(key: key);

  /// See [AttachmentButton.onPressed]
  final void Function()? onAttachmentPressed;

  /// Whether to always show the send button
  final bool alwaysShowSendButton;

  /// Whether attachment is uploading. Will replace attachment button with a
  /// [CircularProgressIndicator]. Since we don't have libraries for
  /// managing media in dependencies we have no way of knowing if
  /// something is uploading so you need to set this manually.
  final bool? isAttachmentUploading;

  /// Will be called on [SendButton] tap. Has [types.PartialText] which can
  /// be transformed to [types.TextMessage] and added to the messages list.
  final void Function(types.PartialText) onSendPressed;

  /// Will be called whenever the text inside [TextField] changes
  final void Function(String)? onTextChanged;

  /// Will be called on [TextField] tap
  final void Function()? onTextFieldTap;

  /// Controls the visibility behavior of the [SendButton] based on the
  /// [TextField] state inside the [Input] widget.
  /// Defaults to [SendButtonVisibilityMode.editing].
  final SendButtonVisibilityMode sendButtonVisibilityMode;

  @override
  _InputState createState() => _InputState();
}

/// [Input] widget state
class _InputState extends State<Input> {
  final _inputFocusNode = FocusNode();
  bool _sendButtonVisible = false;
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textController.addListener(_handleTextControllerChange);

    if (widget.alwaysShowSendButton == true) {
      _sendButtonVisible = true;
    }
  }

  @override
  void dispose() {
    _inputFocusNode.dispose();
    _textController.dispose();
    super.dispose();
  }

  void _handleSendPressed() {
    final trimmedText = _textController.text.trim();
    if (trimmedText != '') {
      final _partialText = types.PartialText(text: trimmedText);
      widget.onSendPressed(_partialText);
      _textController.clear();
    }
  }

  void _handleTextControllerChange() {
    setState(() {
      if (widget.alwaysShowSendButton != true) {
        _sendButtonVisible = _textController.text.trim() != '';
      }
    });
  }

  Widget _leftWidget() {
    if (widget.isAttachmentUploading == true) {
      return Container(
        height: 24,
        margin: const EdgeInsets.only(right: 16),
        width: 24,
        child: CircularProgressIndicator(
          backgroundColor: Colors.transparent,
          strokeWidth: 1.5,
          valueColor: AlwaysStoppedAnimation<Color>(
            InheritedChatTheme.of(context).theme.inputTextColor,
          ),
        ),
      );
    } else {
      return AttachmentButton(onPressed: widget.onAttachmentPressed);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _query = MediaQuery.of(context);

    return GestureDetector(
      onTap: () => _inputFocusNode.requestFocus(),
      child: Shortcuts(
        shortcuts: {
          LogicalKeySet(LogicalKeyboardKey.enter): const SendMessageIntent(),
          LogicalKeySet(LogicalKeyboardKey.enter, LogicalKeyboardKey.alt): const NewLineIntent(),
          LogicalKeySet(LogicalKeyboardKey.enter, LogicalKeyboardKey.shift): const NewLineIntent(),
        },
        child: Actions(
          actions: {
            SendMessageIntent: CallbackAction<SendMessageIntent>(
              onInvoke: (SendMessageIntent intent) => _handleSendPressed(),
            ),
            NewLineIntent: CallbackAction<NewLineIntent>(
              onInvoke: (NewLineIntent intent) {
                final _newValue = '${_textController.text}\r\n';
                _textController.value = TextEditingValue(
                  text: _newValue,
                  selection: TextSelection.fromPosition(
                    TextPosition(offset: _newValue.length),
                  ),
                );
              },
            ),
          },
          child: Focus(
            autofocus: true,
            child: Material(
              color: InheritedChatTheme.of(context).theme.inputBackgroundColor,
              child: Container(
                padding: EdgeInsets.fromLTRB(
                  24 + _query.padding.left,
                  8,
                  24 + _query.padding.right,
                  20 + _query.viewInsets.bottom + _query.padding.bottom,
                ),
                child: Row(
                  children: [
                    if (widget.onAttachmentPressed != null) _leftWidget(),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: InheritedChatTheme.of(context).theme.inputBorder,
                          borderRadius: InheritedChatTheme.of(context).theme.inputBorderRadius,
                        ),
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _textController,
                                decoration: InputDecoration.collapsed(
                                  hintStyle: InheritedChatTheme.of(context).theme.inputTextStyle.copyWith(
                                        color: InheritedChatTheme.of(context).theme.inputTextColor.withOpacity(0.5),
                                      ),
                                  hintText: InheritedL10n.of(context).l10n.inputPlaceholder,
                                ),
                                focusNode: _inputFocusNode,
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                minLines: 1,
                                onChanged: widget.onTextChanged,
                                style: InheritedChatTheme.of(context).theme.inputTextStyle.copyWith(
                                      color: InheritedChatTheme.of(context).theme.inputTextColor,
                                    ),
                                textCapitalization: TextCapitalization.sentences,
                              ),
                            ),
                            Visibility(
                              visible: _sendButtonVisible,
                              child: SendButton(
                                onPressed: _handleSendPressed,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
