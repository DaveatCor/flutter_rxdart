import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators{

  final _emailController = new BehaviorSubject<String>();
  final _passwordController = new BehaviorSubject<String>();
  
  //Add data to Stream
  Function(String) get email => _emailController.sink.add;  
  Function(String) get password => _passwordController.sink.add;

  //retreive data from Stream
  Stream<String> get emailStream => _emailController.stream.transform(validatorEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validatorPassword);

  Stream<bool> get submitValidate => Observable.combineLatest2(emailStream, passwordStream, (e, p) => true);

  submit() {
    print(_emailController.value);
    print(_passwordController.value);
  }

  dispose(){
    _emailController.close();
    _passwordController.close();
  }
  
}
