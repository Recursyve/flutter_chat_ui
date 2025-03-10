import 'package:flutter/material.dart';

// For internal usage only. Use values from theme itself.

/// See [ChatTheme.userAvatarNameColors]
const COLORS = [
  Color(0xffff6767),
  Color(0xff66e0da),
  Color(0xfff5a2d9),
  Color(0xfff0c722),
  Color(0xff6a85e5),
  Color(0xfffd9a6f),
  Color(0xff92db6e),
  Color(0xff73b8e5),
  Color(0xfffd7590),
  Color(0xffc78ae5),
];

/// Dark
const DARK = Color(0xff1f1c38);

/// Error
const ERROR = Color(0xffff6767);

/// N0
const NEUTRAL_0 = Color(0xff1d1c21);

/// N2
const NEUTRAL_2 = Color(0xff9e9cab);

/// N7
const NEUTRAL_7 = Color(0xffffffff);

/// N7 with opacity
const NEUTRAL_7_WITH_OPACITY = Color(0x80ffffff);

/// Primary
const PRIMARY = Color(0xff6f61e8);

/// Secondary
const SECONDARY = Color(0xfff5f5f7);

/// Secondary dark
const SECONDARY_DARK = Color(0xff2b2250);

/// Base chat theme containing all required properties to make a theme.
/// Extend this class if you want to create a custom theme.
@immutable
abstract class ChatTheme {
  /// Creates a new chat theme based on provided colors and text styles.
  const ChatTheme({
    required this.attachmentButtonIcon,
    required this.backgroundColor,
    required this.dateDividerTextStyle,
    required this.deliveredIcon,
    required this.documentIcon,
    required this.documentIconSize,
    required this.emptyChatPlaceholderTextStyle,
    required this.errorColor,
    required this.errorIcon,
    required this.inputBackgroundColor,
    this.inputBorder,
    required this.inputBorderRadius,
    required this.inputPadding,
    required this.inputTextColor,
    this.inputTextCursorColor,
    required this.inputTextDecoration,
    required this.inputTextStyle,
    required this.messageBorderRadius,
    required this.useMessageArrow,
    required this.messageInsetsHorizontal,
    required this.messageInsetsVertical,
    required this.primaryColor,
    required this.receivedMessageBodyTextStyle,
    required this.receivedMessageBoxDecoration,
    required this.receivedMessageCaptionTextStyle,
    required this.receivedMessageDocumentIconColor,
    required this.receivedMessageLinkDescriptionTextStyle,
    required this.receivedMessageLinkTitleTextStyle,
    required this.secondaryColor,
    required this.seenIcon,
    required this.sendButtonIcon,
    required this.sendingIcon,
    required this.sentMessageBodyTextStyle,
    required this.sentMessageBoxDecoration,
    required this.sentMessageCaptionTextStyle,
    required this.sentMessageDocumentIconColor,
    required this.sentMessageLinkDescriptionTextStyle,
    required this.sentMessageLinkTitleTextStyle,
    required this.userAvatarImageBackgroundColor,
    required this.userAvatarNameColors,
    required this.userAvatarTextStyle,
    required this.userNameTextStyle,
  });

  /// Icon for select attachment button
  final Widget? attachmentButtonIcon;

  /// Used as a background color of a chat widget
  final Color backgroundColor;

  /// Text style of the date dividers
  final TextStyle dateDividerTextStyle;

  /// Icon for message's `delivered` status. For the best look use size of 16.
  final Widget? deliveredIcon;

  /// Icon inside file message
  final Widget? documentIcon;

  /// Icon size inside file message
  final double? documentIconSize;

  /// Text style of the empty chat placeholder
  final TextStyle emptyChatPlaceholderTextStyle;

  /// Color to indicate something bad happened (usually - shades of red)
  final Color errorColor;

  /// Icon for message's `error` status. For the best look use size of 16.
  final Widget? errorIcon;

  /// Color of the bottom bar where text field is
  final Color inputBackgroundColor;

  /// Border radius of the text field
  final BorderRadius inputBorderRadius;

  /// Border of the text input
  final BoxBorder? inputBorder;

  /// Insets of the bottom bar where text field is
  final EdgeInsetsGeometry inputPadding;

  /// Color of the text field's text and attachment/send buttons
  final Color inputTextColor;

  /// Color of the text field's cursor
  final Color? inputTextCursorColor;

  /// Decoration of the input text field
  final InputDecoration inputTextDecoration;

  /// Text style of the message input. To change the color use [inputTextColor].
  final TextStyle inputTextStyle;

  /// Border radius of message container
  final double messageBorderRadius;

  /// Show an arrow in the direction of the avatar instead of no border radius
  final bool useMessageArrow;

  /// Horizontal message bubble insets
  final double messageInsetsHorizontal;

  /// Vertical message bubble insets
  final double messageInsetsVertical;

  /// Primary color of the chat used as a background of sent messages
  /// and statuses
  final Color primaryColor;

  /// Body text style used for displaying text on different types
  /// of received messages
  final TextStyle receivedMessageBodyTextStyle;

  /// Box decoration for displaying text on different types
  /// of received messages
  final BoxDecoration? receivedMessageBoxDecoration;

  /// Caption text style used for displaying secondary info (e.g. file size)
  /// on different types of received messages
  final TextStyle receivedMessageCaptionTextStyle;

  /// Color of the document icon on received messages. Has no effect when
  /// [documentIcon] is used.
  final Color receivedMessageDocumentIconColor;

  /// Text style used for displaying link description on received messages
  final TextStyle receivedMessageLinkDescriptionTextStyle;

  /// Text style used for displaying link title on received messages
  final TextStyle receivedMessageLinkTitleTextStyle;

  /// Secondary color, used as a background of received messages
  final Color secondaryColor;

  /// Icon for message's `seen` status. For the best look use size of 16.
  final Widget? seenIcon;

  /// Icon for send button
  final Widget? sendButtonIcon;

  /// Icon for message's `sending` status. For the best look use size of 10.
  final Widget? sendingIcon;

  /// Body text style used for displaying text on different types
  /// of sent messages
  final TextStyle sentMessageBodyTextStyle;

  /// Box decoration for displaying text on different types
  /// of sent messages
  final BoxDecoration? sentMessageBoxDecoration;

  /// Caption text style used for displaying secondary info (e.g. file size)
  /// on different types of sent messages
  final TextStyle sentMessageCaptionTextStyle;

  /// Color of the document icon on sent messages. Has no effect when
  /// [documentIcon] is used.
  final Color sentMessageDocumentIconColor;

  /// Text style used for displaying link description on sent messages
  final TextStyle sentMessageLinkDescriptionTextStyle;

  /// Text style used for displaying link title on sent messages
  final TextStyle sentMessageLinkTitleTextStyle;

  /// Color used as a background for user avatar if an image is provided.
  /// Visible if the image has some transparent parts.
  final Color userAvatarImageBackgroundColor;

  /// Colors used as backgrounds for user avatars with no image and so,
  /// corresponding user names.
  /// Calculated based on a user ID, so unique across the whole app.
  final List<Color> userAvatarNameColors;

  /// Text style used for displaying initials on user avatar if no
  /// image is provided
  final TextStyle userAvatarTextStyle;

  /// User names text style. Color will be overwritten with [userAvatarNameColors].
  final TextStyle userNameTextStyle;
}

/// Default chat theme which extends [ChatTheme]
@immutable
class DefaultChatTheme extends ChatTheme {
  /// Creates a default chat theme. Use this constructor if you want to
  /// override only a couple of properties, otherwise create a new class
  /// which extends [ChatTheme]
  const DefaultChatTheme({
    Widget? attachmentButtonIcon,
    Color backgroundColor = NEUTRAL_7,
    TextStyle dateDividerTextStyle = const TextStyle(
      color: NEUTRAL_2,
      fontFamily: 'Avenir',
      fontSize: 12,
      fontWeight: FontWeight.w800,
      height: 1.333,
    ),
    Widget? deliveredIcon,
    Widget? documentIcon,
    double? documentIconSize,
    TextStyle emptyChatPlaceholderTextStyle = const TextStyle(
      color: NEUTRAL_2,
      fontFamily: 'Avenir',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    Color errorColor = ERROR,
    Widget? errorIcon,
    Color inputBackgroundColor = NEUTRAL_0,
    BorderRadius inputBorderRadius = const BorderRadius.vertical(
      top: Radius.circular(20),
    ),
    BoxBorder? inputBorder,
    EdgeInsetsGeometry inputPadding = EdgeInsets.zero,
    Color inputTextColor = NEUTRAL_7,
    Color? inputTextCursorColor,
    InputDecoration inputTextDecoration = const InputDecoration(
      border: InputBorder.none,
      contentPadding: EdgeInsets.zero,
      isCollapsed: true,
    ),
    TextStyle inputTextStyle = const TextStyle(
      fontFamily: 'Avenir',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    double messageBorderRadius = 20.0,
    bool useMessageArrow = false,
    double messageInsetsHorizontal = 20,
    double messageInsetsVertical = 16,
    Color primaryColor = PRIMARY,
    TextStyle receivedMessageBodyTextStyle = const TextStyle(
      color: NEUTRAL_0,
      fontFamily: 'Avenir',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    BoxDecoration? receivedMessageBoxDecoration,
    TextStyle receivedMessageCaptionTextStyle = const TextStyle(
      color: NEUTRAL_2,
      fontFamily: 'Avenir',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.333,
    ),
    Color receivedMessageDocumentIconColor = PRIMARY,
    TextStyle receivedMessageLinkDescriptionTextStyle = const TextStyle(
      color: NEUTRAL_0,
      fontFamily: 'Avenir',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.428,
    ),
    TextStyle receivedMessageLinkTitleTextStyle = const TextStyle(
      color: NEUTRAL_0,
      fontFamily: 'Avenir',
      fontSize: 16,
      fontWeight: FontWeight.w800,
      height: 1.375,
    ),
    Color secondaryColor = SECONDARY,
    Widget? seenIcon,
    Widget? sendButtonIcon,
    Widget? sendingIcon,
    TextStyle sentMessageBodyTextStyle = const TextStyle(
      color: NEUTRAL_7,
      fontFamily: 'Avenir',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    BoxDecoration? sentMessageBoxDecoration,
    TextStyle sentMessageCaptionTextStyle = const TextStyle(
      color: NEUTRAL_7_WITH_OPACITY,
      fontFamily: 'Avenir',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.333,
    ),
    Color sentMessageDocumentIconColor = NEUTRAL_7,
    TextStyle sentMessageLinkDescriptionTextStyle = const TextStyle(
      color: NEUTRAL_7,
      fontFamily: 'Avenir',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.428,
    ),
    TextStyle sentMessageLinkTitleTextStyle = const TextStyle(
      color: NEUTRAL_7,
      fontFamily: 'Avenir',
      fontSize: 16,
      fontWeight: FontWeight.w800,
      height: 1.375,
    ),
    Color userAvatarImageBackgroundColor = Colors.transparent,
    List<Color> userAvatarNameColors = COLORS,
    TextStyle userAvatarTextStyle = const TextStyle(
      color: NEUTRAL_7,
      fontFamily: 'Avenir',
      fontSize: 12,
      fontWeight: FontWeight.w800,
      height: 1.333,
    ),
    TextStyle userNameTextStyle = const TextStyle(
      fontFamily: 'Avenir',
      fontSize: 12,
      fontWeight: FontWeight.w800,
      height: 1.333,
    ),
  }) : super(
          attachmentButtonIcon: attachmentButtonIcon,
          backgroundColor: backgroundColor,
          dateDividerTextStyle: dateDividerTextStyle,
          deliveredIcon: deliveredIcon,
          documentIcon: documentIcon,
          documentIconSize: documentIconSize,
          emptyChatPlaceholderTextStyle: emptyChatPlaceholderTextStyle,
          errorColor: errorColor,
          errorIcon: errorIcon,
          inputBackgroundColor: inputBackgroundColor,
          inputBorderRadius: inputBorderRadius,
          inputBorder: inputBorder,
          inputPadding: inputPadding,
          inputTextColor: inputTextColor,
          inputTextCursorColor: inputTextCursorColor,
          inputTextDecoration: inputTextDecoration,
          inputTextStyle: inputTextStyle,
          messageBorderRadius: messageBorderRadius,
          useMessageArrow: useMessageArrow,
          messageInsetsHorizontal: messageInsetsHorizontal,
          messageInsetsVertical: messageInsetsVertical,
          primaryColor: primaryColor,
          receivedMessageBodyTextStyle: receivedMessageBodyTextStyle,
          receivedMessageBoxDecoration: receivedMessageBoxDecoration,
          receivedMessageCaptionTextStyle: receivedMessageCaptionTextStyle,
          receivedMessageDocumentIconColor: receivedMessageDocumentIconColor,
          receivedMessageLinkDescriptionTextStyle:
              receivedMessageLinkDescriptionTextStyle,
          receivedMessageLinkTitleTextStyle: receivedMessageLinkTitleTextStyle,
          secondaryColor: secondaryColor,
          seenIcon: seenIcon,
          sendButtonIcon: sendButtonIcon,
          sendingIcon: sendingIcon,
          sentMessageBodyTextStyle: sentMessageBodyTextStyle,
          sentMessageBoxDecoration: sentMessageBoxDecoration,
          sentMessageCaptionTextStyle: sentMessageCaptionTextStyle,
          sentMessageDocumentIconColor: sentMessageDocumentIconColor,
          sentMessageLinkDescriptionTextStyle:
              sentMessageLinkDescriptionTextStyle,
          sentMessageLinkTitleTextStyle: sentMessageLinkTitleTextStyle,
          userAvatarImageBackgroundColor: userAvatarImageBackgroundColor,
          userAvatarNameColors: userAvatarNameColors,
          userAvatarTextStyle: userAvatarTextStyle,
          userNameTextStyle: userNameTextStyle,
        );
}

/// Dark chat theme which extends [ChatTheme]
@immutable
class DarkChatTheme extends ChatTheme {
  /// Creates a dark chat theme. Use this constructor if you want to
  /// override only a couple of properties, otherwise create a new class
  /// which extends [ChatTheme]
  const DarkChatTheme({
    Widget? attachmentButtonIcon,
    Color backgroundColor = DARK,
    TextStyle dateDividerTextStyle = const TextStyle(
      color: NEUTRAL_7,
      fontFamily: 'Avenir',
      fontSize: 12,
      fontWeight: FontWeight.w800,
      height: 1.333,
    ),
    Widget? deliveredIcon,
    Widget? documentIcon,
    double? documentIconSize,
    TextStyle emptyChatPlaceholderTextStyle = const TextStyle(
      color: NEUTRAL_2,
      fontFamily: 'Avenir',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    Color errorColor = ERROR,
    Widget? errorIcon,
    Color inputBackgroundColor = SECONDARY_DARK,
    BorderRadius inputBorderRadius = const BorderRadius.vertical(
      top: Radius.circular(20),
    ),
    BoxBorder? inputBorder,
    EdgeInsetsGeometry inputPadding = EdgeInsets.zero,
    Color inputTextColor = NEUTRAL_7,
    Color? inputTextCursorColor,
    InputDecoration inputTextDecoration = const InputDecoration(
      border: InputBorder.none,
      contentPadding: EdgeInsets.zero,
      isCollapsed: true,
    ),
    TextStyle inputTextStyle = const TextStyle(
      fontFamily: 'Avenir',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    double messageBorderRadius = 20.0,
    bool useMessageArrow = false,
    double messageInsetsHorizontal = 20,
    double messageInsetsVertical = 16,
    Color primaryColor = PRIMARY,
    TextStyle receivedMessageBodyTextStyle = const TextStyle(
      color: NEUTRAL_7,
      fontFamily: 'Avenir',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    BoxDecoration? receivedMessageBoxDecoration,
    TextStyle receivedMessageCaptionTextStyle = const TextStyle(
      color: NEUTRAL_7_WITH_OPACITY,
      fontFamily: 'Avenir',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.333,
    ),
    Color receivedMessageDocumentIconColor = PRIMARY,
    TextStyle receivedMessageLinkDescriptionTextStyle = const TextStyle(
      color: NEUTRAL_7,
      fontFamily: 'Avenir',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.428,
    ),
    TextStyle receivedMessageLinkTitleTextStyle = const TextStyle(
      color: NEUTRAL_7,
      fontFamily: 'Avenir',
      fontSize: 16,
      fontWeight: FontWeight.w800,
      height: 1.375,
    ),
    Color secondaryColor = SECONDARY_DARK,
    Widget? seenIcon,
    Widget? sendButtonIcon,
    Widget? sendingIcon,
    TextStyle sentMessageBodyTextStyle = const TextStyle(
      color: NEUTRAL_7,
      fontFamily: 'Avenir',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    BoxDecoration? sentMessageBoxDecoration,
    TextStyle sentMessageCaptionTextStyle = const TextStyle(
      color: NEUTRAL_7_WITH_OPACITY,
      fontFamily: 'Avenir',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.333,
    ),
    Color sentMessageDocumentIconColor = NEUTRAL_7,
    TextStyle sentMessageLinkDescriptionTextStyle = const TextStyle(
      color: NEUTRAL_7,
      fontFamily: 'Avenir',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.428,
    ),
    TextStyle sentMessageLinkTitleTextStyle = const TextStyle(
      color: NEUTRAL_7,
      fontFamily: 'Avenir',
      fontSize: 16,
      fontWeight: FontWeight.w800,
      height: 1.375,
    ),
    Color userAvatarImageBackgroundColor = Colors.transparent,
    List<Color> userAvatarNameColors = COLORS,
    TextStyle userAvatarTextStyle = const TextStyle(
      color: NEUTRAL_7,
      fontFamily: 'Avenir',
      fontSize: 12,
      fontWeight: FontWeight.w800,
      height: 1.333,
    ),
    TextStyle userNameTextStyle = const TextStyle(
      fontFamily: 'Avenir',
      fontSize: 12,
      fontWeight: FontWeight.w800,
      height: 1.333,
    ),
  }) : super(
          attachmentButtonIcon: attachmentButtonIcon,
          backgroundColor: backgroundColor,
          dateDividerTextStyle: dateDividerTextStyle,
          deliveredIcon: deliveredIcon,
          documentIcon: documentIcon,
          documentIconSize: documentIconSize,
          emptyChatPlaceholderTextStyle: emptyChatPlaceholderTextStyle,
          errorColor: errorColor,
          errorIcon: errorIcon,
          inputBackgroundColor: inputBackgroundColor,
          inputBorderRadius: inputBorderRadius,
          inputBorder: inputBorder,
          messageInsetsHorizontal: messageInsetsHorizontal,
          messageInsetsVertical: messageInsetsVertical,
          inputPadding: inputPadding,
          inputTextColor: inputTextColor,
          inputTextCursorColor: inputTextCursorColor,
          inputTextDecoration: inputTextDecoration,
          inputTextStyle: inputTextStyle,
          messageBorderRadius: messageBorderRadius,
          useMessageArrow: useMessageArrow,
          primaryColor: primaryColor,
          receivedMessageBodyTextStyle: receivedMessageBodyTextStyle,
          receivedMessageBoxDecoration: receivedMessageBoxDecoration,
          receivedMessageCaptionTextStyle: receivedMessageCaptionTextStyle,
          receivedMessageDocumentIconColor: receivedMessageDocumentIconColor,
          receivedMessageLinkDescriptionTextStyle:
              receivedMessageLinkDescriptionTextStyle,
          receivedMessageLinkTitleTextStyle: receivedMessageLinkTitleTextStyle,
          secondaryColor: secondaryColor,
          seenIcon: seenIcon,
          sendButtonIcon: sendButtonIcon,
          sendingIcon: sendingIcon,
          sentMessageBodyTextStyle: sentMessageBodyTextStyle,
          sentMessageBoxDecoration: sentMessageBoxDecoration,
          sentMessageCaptionTextStyle: sentMessageCaptionTextStyle,
          sentMessageDocumentIconColor: sentMessageDocumentIconColor,
          sentMessageLinkDescriptionTextStyle:
              sentMessageLinkDescriptionTextStyle,
          sentMessageLinkTitleTextStyle: sentMessageLinkTitleTextStyle,
          userAvatarImageBackgroundColor: userAvatarImageBackgroundColor,
          userAvatarNameColors: userAvatarNameColors,
          userAvatarTextStyle: userAvatarTextStyle,
          userNameTextStyle: userNameTextStyle,
        );
}
