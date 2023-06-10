

class comment {
  final int id;
  final String name;
  final String email;
  final String body;


comment({
  required this.id, 
  required this.name, 
  required this.email, 
  required this.body,
   });

   factory comment.fromMap(Map<String,dynamic> data) {
    return comment(
      id: data ["id"],
      name: data ["name"], 
      email: data ["email"],
      body: data ["body"], 
      );
   }
  }