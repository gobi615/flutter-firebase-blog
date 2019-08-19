class Post{
  String title;
  String imageUrl;
  String description;

  Map fireObj = Map();

  Post(this.title, this.imageUrl, this.description);

  Post.fromMap(fireObj){
    title = fireObj['title'];
    imageUrl = fireObj['imageUrl'];
    description = fireObj['description'];
  }

  Post.toMap(){
    fireObj['title'] = title;
    fireObj['imageUrl'] = title;
    fireObj['description'] = title;
  }

}
