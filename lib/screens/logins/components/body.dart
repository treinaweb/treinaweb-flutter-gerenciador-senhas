import 'package:flutter/material.dart';
import 'package:treinapass/models/login.dart';
import 'package:treinapass/screens/components/card_login.dart';
import 'package:treinapass/services/login_service.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  LoginService ls = LoginService();
  Future<List> _loadLogins;
  List<Login> _logins;

  @override
  void initState() {
    _loadLogins = _getLogins();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding:
              EdgeInsets.only(left: 24, bottom: 16, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                      'Todos os logins',
                      style: Theme.of(context).textTheme.bodyText1
                  ),
                ],
              )
          ),
          FutureBuilder(
            future: _loadLogins,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                _logins = snapshot.data;
                return Expanded(
                  child: ListView.builder(
                      itemCount: _logins.length,
                      itemBuilder: (context, index) {
                        return cardLogin(context, index, _logins[index]);
                      }
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

            },
          )

        ],
      ),
    );
  }

  Future<List> _getLogins() async {
    return await ls.getAllLogin();
  }

}
