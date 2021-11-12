abstract class UserEvent {}

class AddUser extends UserEvent{
 final String email;
 final String password;

  AddUser(this.email, this.password);

}
class RemoveUser extends UserEvent{
  final int index;

  RemoveUser(this.index);
  
}


