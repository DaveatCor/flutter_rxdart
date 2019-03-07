import 'package:flutter/material.dart';
import '../blocs/blocs.dart';
import '../provider/provider.dart';

class LoginScreen extends StatelessWidget{

  Widget build(BuildContext context){
    final bloc = Provider.of(context);
    
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          passwordField(bloc),
          Container(margin: EdgeInsets.only(top: 20.0),),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc){
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (context, snapshot){
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'you@example.com',
            labelText: 'Email Address',
            errorText: snapshot.error
          ),
          onChanged: bloc.email,
        );
      },
    );
    
  }

  Widget passwordField(Bloc bloc){
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (context, snapshot){
        return TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            errorText: snapshot.error
          ),
          onChanged: bloc.password,
        );
      },
    );
    
  }

  Widget submitButton(Bloc bloc){
    return StreamBuilder(
      stream: bloc.submitValidate,
      builder: (context, snapshot){
        return RaisedButton(
          child: Text('Login'),
          color: Colors.blueAccent,
          onPressed: snapshot.hasData ? () {
            bloc.submit();
          } : null,
        );
      },
    );
  }
}
