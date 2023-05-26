// ignore_for_file: file_names

import 'package:egitim/Models/Post.dart';
import 'package:egitim/Widgets/PostWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    // splashColor: Colors.transparent,
                    // highlightColor: Colors.transparent,
                    onPressed: () {},
                    icon: const Icon(Icons.search_rounded),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/user.jpg'),
                      ),
                    ),
                    width: 50,
                    child: AspectRatio(aspectRatio: 1),
                  )
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: FutureBuilder(
                  future: getPosts(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        itemCount: snapshot.data!.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 25),
                        itemBuilder: (context, index) => PostWidget(
                          post: snapshot.data![index],
                        ),
                      );
                    }

                    if (snapshot.hasError) {
                      Text('asdajsdkljasd');
                    }

                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<Post>> getPosts() async {
    final url =
        Uri.parse('https://egitim.azurewebsites.net/Post/GetVideoInformation');

    final response = await http.get(url);

    return postFromJson(response.body);
  }
}
