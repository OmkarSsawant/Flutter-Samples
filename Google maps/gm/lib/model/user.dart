class User {
     String email;
     String password;

  User(this.email, this.password);

    Map toJson(){
      return {
        'email' : email,
        'password':password
      };
    }
    User.fromJson(map){
      email = map['email'];
      password=map['password'];
    }

}