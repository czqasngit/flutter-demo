
class TodoModel {
  bool isDone;
  String title;
  String subTitle;

  TodoModel(this.isDone, this.title, this.subTitle);
  factory TodoModel.create({bool isDone = false, String title = "默认标题", String subTitle = "默认描述"}) => TodoModel(isDone, title, subTitle);
}
class TodoManagment {
  List<TodoModel> todos;
  TodoManagment(): todos = [];
  factory TodoManagment.loading() {
    var mg =  TodoManagment();
    mg.todos.add(TodoModel.create(isDone: false, title: "测试待办事项", subTitle: "我是一个可爱的人"));
    return mg;
  }
  List<TodoModel> getTodos() => this.todos;
  int getTodosCount() => this.todos.length;
  TodoModel getTodoWith({int index}) => this.todos[index];
}