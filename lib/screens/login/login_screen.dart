import 'package:flutter/material.dart';
import 'package:treinapass/models/login.dart';
import 'package:treinapass/screens/home/home_screen.dart';
import 'package:treinapass/services/login_service.dart';
import 'package:treinapass/utils/secure_storage_util.dart';


class LoginScreen extends StatefulWidget {
  int idLogin;

  LoginScreen({this.idLogin});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginService ls = LoginService();
  Future<Login> _loadLogin;
  Login _login;


  @override
  void initState() {
    // TODO: implement initState
    _loadLogin = _getLogin(widget.idLogin);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadLogin,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          _login = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              title: Text("Dados do Login"),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        enabled: false,
                        initialValue: _login.titulo,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Titulo"),
                      ),
                      TextFormField(
                        enabled: false,
                        initialValue: _login.username,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Username"),
                      ),
                      TextFormField(
                        enabled: false,
                        initialValue: _login.descricao,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Descrição"),
                      ),
                      TextFormField(
                        enabled: false,
                        initialValue: _login.senha,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Senha"),
                      ),
                      TextFormField(
                        enabled: false,
                        initialValue: _login.url,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "URL"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<Login> _getLogin(int id) async {
    return await ls.getLogin(id);
  }
}
