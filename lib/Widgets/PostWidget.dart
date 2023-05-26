// ignore_for_file: file_names

import 'package:egitim/Extensions/ViewCountExtension.dart';
import 'package:egitim/Models/Post.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatefulWidget {
  final Post post;

  const PostWidget({super.key, required this.post});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool isSub = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://egitim.azurewebsites.net/Post/GetPostImage?path=${widget.post.thumbnailPath}',
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.black.withOpacity(0.5),
                    ),
                    child: Text(
                      widget.post.duration.toString(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          widget.post.title,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Text(
              '${widget.post.viewCount.getAbbrCount()} izlenme',
            ),
            SizedBox(width: MediaQuery.of(context).size.width / 10),
            Text(widget.post.created.differenceLong()),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://egitim.azurewebsites.net/Post/GetProfileImage?path=${widget.post.user.profilePicturePath}'),
            ),
            SizedBox(width: 20),
            Text(widget.post.user.username),
            Spacer(),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: isSub ? subscribedButton() : subscribeButton(),
              switchInCurve: Curves.easeIn,
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: child,
              ),
            )
          ],
        )
      ],
    );
  }

  Widget subscribeButton() {
    return TextButton(
      key: ValueKey('subscribeButton'),
      style: TextButton.styleFrom(
        backgroundColor: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isSub = true;
        });
      },
      child: Text(
        'Subscribe',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget subscribedButton() {
    return TextButton(
      key: ValueKey('subscribedButton'),
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
      ),
      onPressed: () {
        setState(() {
          isSub = false;
        });
      },
      child: Text(
        'Subscribed',
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
    );
  }
}
