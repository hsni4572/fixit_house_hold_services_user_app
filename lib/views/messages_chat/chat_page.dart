import 'package:fixit/constants/colors.dart';
import 'package:fixit/constants/spacing.dart';
import 'package:fixit/ui_helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          10.h,
        ),
        child: AppBar(
          toolbarHeight: 10.h,
          centerTitle: false,
          elevation: 4,
          backgroundColor: AppColors.white,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              UiHelpers.backButton(),
              CircleAvatar(
                backgroundImage:
                    NetworkImage("https://i.postimg.cc/cCsYDjvj/user-2.png"),
              ),
              SizedBox(width: 12.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UiHelpers.appText(
                    title: 'Service Provider',
                    fSize: 16,
                    fweight: FontWeight.w600,
                  ),
                  UiHelpers.appText(
                    title: 'Online',
                    fSize: 12,
                    fweight: FontWeight.w400,
                    fColor: AppColors.tGrey,
                  ),
                ],
              )
            ],
          ),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.local_phone,
                  color: AppColors.black,
                ),
                onPressed: () {}),
            IconButton(
                icon: const Icon(
                  Icons.more_vert_rounded,
                  color: AppColors.black,
                ),
                onPressed: () {}),
            Sp.x(2),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) =>
                    _buildMessage(context, messages[index]),
              ),
            ),
          ),
          _ChatInputField(
            controller: _controller,
            onSend: _handleSend,
          ),
        ],
      ),
    );
  }

  void _handleSend() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add(ChatMessage(
          messageType: ChatMessageType.text,
          text: _controller.text,
          isSender: true,
          messageStatus: MessageStatus.viewed,
        ));
        _controller.clear();
      });
    }
  }

  Widget _buildMessage(BuildContext context, ChatMessage message) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            const CircleAvatar(
              radius: 12,
              backgroundImage:
                  NetworkImage("https://i.postimg.cc/cCsYDjvj/user-2.png"),
            ),
            const SizedBox(width: 8.0),
          ],
          _messageContent(context, message),
          if (message.isSender) _buildMessageStatusDot(context, message),
        ],
      ),
    );
  }

  Widget _messageContent(BuildContext context, ChatMessage message) {
    switch (message.messageType) {
      case ChatMessageType.text:
        return _buildTextMessage(context, message);
      case ChatMessageType.audio:
        return _buildAudioMessage(context, message);
      case ChatMessageType.video:
        return _buildVideoMessage(context);
      default:
        return const SizedBox();
    }
  }

  Widget _buildTextMessage(BuildContext context, ChatMessage message) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: message.isSender ? AppColors.primary : AppColors.tGrey,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Wrap(
          children: [
            UiHelpers.appText(
                title: message.text,
                fColor: message.isSender ? AppColors.white : AppColors.black),
          ],
        ));
  }

  Widget _buildAudioMessage(BuildContext context, ChatMessage message) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color(0xFF00BF6D).withOpacity(message.isSender ? 1 : 0.1),
      ),
      child: Row(
        children: [
          Icon(
            Icons.play_arrow,
            color: message.isSender ? Colors.white : const Color(0xFF00BF6D),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 2,
                    color: message.isSender
                        ? Colors.white
                        : const Color(0xFF00BF6D).withOpacity(0.4),
                  ),
                  Positioned(
                    left: 0,
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: message.isSender
                            ? Colors.white
                            : const Color(0xFF00BF6D),
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Text(
            "0.37",
            style: TextStyle(
              fontSize: 12,
              color: message.isSender ? Colors.white : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoMessage(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: AspectRatio(
        aspectRatio: 1.6,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                  "https://i.postimg.cc/Ls1WtygL/Video-Place-Here.png"),
            ),
            Container(
              height: 25,
              width: 25,
              decoration: const BoxDecoration(
                color: Color(0xFF00BF6D),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.play_arrow,
                size: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageStatusDot(BuildContext context, ChatMessage message) {
    Color dotColor(MessageStatus status) {
      switch (status) {
        case MessageStatus.notSent:
          return const Color(0xFFF03738);
        case MessageStatus.notView:
          return Colors.grey.withOpacity(0.1);
        case MessageStatus.viewed:
          return const Color(0xFF00BF6D);
        default:
          return Colors.transparent;
      }
    }

    return Container(
      margin: const EdgeInsets.only(left: 8.0),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: dotColor(message.messageStatus),
        shape: BoxShape.circle,
      ),
      child: Icon(
        message.messageStatus == MessageStatus.notSent
            ? Icons.close
            : Icons.done,
        size: 8,
        color: Colors.white,
      ),
    );
  }
}

class _ChatInputField extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const _ChatInputField({
    required this.controller,
    required this.onSend,
    super.key,
  });

  @override
  State<_ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<_ChatInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -4),
            blurRadius: 32,
            color: const Color(0xFF087949).withOpacity(0.08),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            const Icon(Icons.mic, color: Color(0xFF00BF6D)),
            const SizedBox(width: 16.0),
            Expanded(
              child: TextField(
                controller: widget.controller,
                decoration: InputDecoration(
                  hintText: "Type message",
                  filled: true,
                  fillColor: const Color(0xFF00BF6D).withOpacity(0.08),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 16.0),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send, color: Color(0xFF00BF6D)),
              onPressed: widget.onSend,
            ),
          ],
        ),
      ),
    );
  }
}

// Enum for ChatMessageType
enum ChatMessageType { text, audio, video }

// Enum for MessageStatus
enum MessageStatus { notSent, notView, viewed }

// Example ChatMessage class
class ChatMessage {
  final ChatMessageType messageType;
  final String text;
  final bool isSender;
  final MessageStatus messageStatus;

  ChatMessage({
    required this.messageType,
    required this.text,
    required this.isSender,
    required this.messageStatus,
  });
}
