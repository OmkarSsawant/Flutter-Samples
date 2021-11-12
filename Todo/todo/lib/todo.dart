
class Todo{
  String task;
  String subtask;
  Todo({this.task,this.subtask});
  Todo.fromMap(Map map) :
    this.task = map['task'],
    this.subtask = map['subtask'];

  Map toMap(){
    return {
      'task': this.task,
      'subtask': this.subtask,
    };
  }
}