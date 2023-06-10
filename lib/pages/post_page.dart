
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/post_controller.dart';
import 'package:flutter_application_1/models/comment.dart';
import 'package:flutter_application_1/models/post.dart';


class PostPage extends StatefulWidget {
  const PostPage({super.key, required this.post});

  final Post post;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    final PostController postController =PostController();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
      title: const Text("detail Post"),
    ),
    body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
        child: SizedBox(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.post.title, 
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height*0.01,
                ),
              SizedBox(
                width: size.width,
                child: Text(
                  widget.post.body, 
                   textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: size.height*0.02,
              ),
              const Text(
                "komentar",
              ),
              SizedBox(
                height: size.height *0.01,
              ),
              Expanded(
                child: FutureBuilder<List<comment>>(
                  future: postController.fetchcomments(widget.post.id),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.isNotEmpty) {
                        List<comment> Comments = snapshot.data!;
                        return ListView.separated(
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title: Text(Comments[index].name),
                                subtitle: Text(Comments[index].body),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                          return SizedBox(
                            height: size.height * 0.0005,);
                        },
                        itemCount: Comments.length,
                        );
                      } else{
                        return const Text("bwlum ada komentar",
                        );
                      }
                    } else if(snapshot.connectionState == 
                      ConnectionState.waiting){
                        return AspectRatio(
                          aspectRatio: 1 / 1,
                          child: SizedBox(
                          width: size.width *0.2 ,
                          child: CircularProgressIndicator()
                          ),

                          );
                
                          
                    } else {
                      return const Text("err");
                    }
                  },
                  ),
              ),
            ],
          ),
        )
        ),
        ),
    );
  }
}