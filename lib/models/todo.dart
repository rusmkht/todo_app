class ToDo {
  String? title;
  String? text;
  String? createdTime;
  bool? isDone;

  ToDo({this.title, this.text, this.isDone, this.createdTime});

  set setTitle(String value) {
    title = value;
  }

  set setText(String value) {
    text = value;
  }

  set setCreatedTime(String value) {
    createdTime = value;
  }

  set setIsDone(bool value) {
    isDone = value;
  }

  get getTitle {
    return title;
  }

  get getText {
    return text;
  }

  get getCreatedTime {
    return createdTime;
  }

  get getIsDone {
    return isDone;
  }

  ToDo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    text = json['text'];
    createdTime = json['createdTime'];
    isDone = json['isDone'] as bool?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['text'] = text;
    data['createdTime'] = createdTime;
    data['isDone'] = isDone;
    return data;
  }
}
