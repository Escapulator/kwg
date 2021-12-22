class PostViewModel {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  PostViewModel({this.postId, this.id, this.name, this.email, this.body});

  factory PostViewModel.fromJson(Map<String, dynamic> json) {
    return PostViewModel(
        postId: json['postId'],
        id: json['id'],
        name: json['name'],
        email: json['email'],
        body: json['body']);
  }
}
