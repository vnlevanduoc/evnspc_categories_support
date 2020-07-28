import 'package:evnspc_categories_support/module/trang_chu/trang_chu_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TrangChuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<TrangChuBloc>.value(
      value: TrangChuBloc(),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            // Box decoration takes a gradient
            gradient: LinearGradient(colors: [
              Color.fromRGBO(116, 116, 191, 1.0),
              Color.fromRGBO(52, 138, 199, 1.0)
            ]),
          ),
          child: Consumer<TrangChuBloc>(
            builder: (context, bloc, child) => TrangChuWidget(bloc),
          ),
        ),
      ),
    );
  }
}

class TrangChuWidget extends StatefulWidget {
  final TrangChuBloc bloc;
  TrangChuWidget(this.bloc);
  @override
  _TrangChuWidgetState createState() => _TrangChuWidgetState();
}

class _TrangChuWidgetState extends State<TrangChuWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              'EVNSPC CATEGORIES SUPPORT',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
