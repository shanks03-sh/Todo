class Todo_inputs{
  String? id;
  String? Text;
  bool status;
  Todo_inputs({
    required this.id,
    required this.Text,
    this.status=false,
});
static List<Todo_inputs> todolist(){
  return[
    Todo_inputs(id:'01', Text:'Get Books'),
    Todo_inputs(id:'02', Text:'Attend Lecture'),
    Todo_inputs(id:'03', Text:'Reach Delhi'),
    Todo_inputs(id:'04', Text:'Call Rajbir'),
  ];
}
}

