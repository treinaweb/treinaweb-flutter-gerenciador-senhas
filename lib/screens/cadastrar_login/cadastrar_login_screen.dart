import 'package:flutter/material.dart';
import 'package:treinapass/models/login.dart';


class CadastrarLoginScreen extends StatelessWidget {
  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _senhaController = TextEditingController();
  final _usernameController = TextEditingController();
  final _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar Login"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _tituloController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Titulo"),
                ),
                TextFormField(
                  controller: _usernameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Username"),
                ),
                TextFormField(
                  controller: _descricaoController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Descrição"),
                ),
                TextFormField(
                  controller: _senhaController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Senha"),
                ),
                TextFormField(
                  controller: _urlController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "URL"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                        Login novoLogin = Login(
                          titulo: _tituloController.text,
                          descricao: _descricaoController.text,
                          senha: _senhaController.text,
                          username: _usernameController.text,
                          url: _urlController.text,
                        );
                        print(novoLogin.titulo);
                      },
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(
                          color: Colors.white, fontSize: 16
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}