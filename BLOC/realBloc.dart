//1 // TODO: import here
import 'Employee.dart';
import 'dart:async';


class TBloc{
//TODO : make object list
  List<Employee> _employeelist=[
    Employee(1, '_name', 4887),
    Employee(2, '_name', 4887),
    Employee(3, '_name', 4887),
    Employee(4, '_name', 4887),
    Employee(5, '_name', 4887),
    Employee(6, '_name', 4887),
    Employee(7, '_name', 4887),
  ];
//TODO : Stream Controllers
  final StreamController _streamControllerofEmployeeList=StreamController<List<Employee>>();

  final StreamController _streamControllertoaddEmployeSal=StreamController<Employee>();

  final StreamController _streamControllertoDecreEmployeSal=StreamController<Employee>();

//TODO : Stream gettters


  Stream<List<Employee>> get employeListStream => _streamControllerofEmployeeList.stream;

  StreamSink<List<Employee>> get employeListSink => _streamControllerofEmployeeList.sink;

  StreamSink<Employee> get employesalIncre => _streamControllertoaddEmployeSal.sink;

  StreamSink<Employee> get employesalDecre => _streamControllertoDecreEmployeSal.sink;



  //TODO : Create Constructor 

  TBloc(){
    _streamControllerofEmployeeList.add(_employeelist);

    _streamControllertoaddEmployeSal.stream.listen(_methodtoincrementsal);

    _streamControllertoDecreEmployeSal.stream.listen(_methodtodecrementsal);

   // _streamControllerofEmployeeList.stream.listen(_addEmployee);

  }
//TODO : Core Functions
_methodtoincrementsal(Employee employee){
  double salary= employee.salary;

  double incrementedsal= employee.salary = salary * 20/100;

  //Every object while creating will  need id in BLOC
    //see here how its accessed
  _employeelist[employee.id-1].salary= salary + incrementedsal ;

//Update stream // same as we save every time in shared Preferences
  _streamControllerofEmployeeList.sink.add(_employeelist);

} //  This 2  methods will take parameter as Employee is declared in line 21 , 
_methodtodecrementsal(Employee employee){
  double salary= employee.salary;

  double decrementedsal= employee.salary = salary * 20/100;

  //Every object while creating will  need id in BLOC
    //see here how its accessed
  _employeelist[employee.id-1].salary= salary - decrementedsal ;

//Update stream // same as we save every time in shared Preferences
  _streamControllerofEmployeeList.sink.add(_employeelist);

} //   declared parameter at line 23
/* addEmployee(Employee employee){

//from there  
// emp.id be [index+1]
  _employeelist[employee.id].id=employee.id+1;

  _employeelist[employee.id].salary=employee.salary;

  _employeelist[employee.id].name=employee.name;


} */
//TODO :Dispose 
void dispose(){
  _streamControllerofEmployeeList.close();
_streamControllertoaddEmployeSal.close();
_streamControllertoDecreEmployeSal.close();
}


  


}