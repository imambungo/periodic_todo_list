class Task {
  String task;
  int hariH;
  int periode;

  Task ({ this.task, this.hariH, this.periode });

  Task.fromJson(Map<String, dynamic> json)
      : task = json['task'],
        hariH = json['hariH'],
        periode = json['periode'];

  Map<String, dynamic> toJson() =>
    {
      'task': task,
      'hariH': hariH,
      'periode': periode,
    };
}
