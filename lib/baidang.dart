class BaiDang {
  String image;
  int views;
  String authorName;
  bool isLiked;

  BaiDang(
      {required this.image,
      required this.views,
      required this.authorName,
      required this.isLiked});

  void set set_views(int views) {
    this.views = views;
  }

  void set set_like(bool like) {
    this.isLiked = like;
  }

  String toString(){
    return 'image: $image view: $views authorName: $authorName isliked: $isLiked';
  }


}
