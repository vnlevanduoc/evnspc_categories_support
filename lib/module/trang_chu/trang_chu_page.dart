import 'dart:convert';

import 'package:evnspc_categories_support/module/trang_chu/trang_chu_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TrangChuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<TrangChuBloc>.value(
      value: TrangChuBloc(),
      child: Container(
        // decoration: BoxDecoration(
        //   // Box decoration takes a gradient
        //   gradient: LinearGradient(colors: [
        //     Color.fromRGBO(116, 116, 191, 1.0),
        //     Color.fromRGBO(52, 138, 199, 1.0)
        //   ]),
        // ),
        child: Consumer<TrangChuBloc>(
          builder: (context, bloc, child) => TrangChuWidget(bloc),
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
    widget.bloc.initData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: widget.bloc.dataStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting &&
            !snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        Map<String, dynamic> data = jsonDecode(snapshot.data);
        var dataNav =
            data['Sheet1'].map((item) => item["LinhVuc"]).toSet().toList();
        return Container(
          child: DefaultTabController(
            length: dataNav.length,
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1.0,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  child: TabBar(
                    //indicatorWeight: 3,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 3,
                      ),
                      insets: EdgeInsets.symmetric(horizontal: 20),
                    ),
                    tabs: List<Widget>.generate(
                      dataNav.length,
                      (int index) {
                        return Tab(text: "${dataNav[index]}");
                      },
                    ),
                    isScrollable: true,
                    labelColor: Color(0xFF1976D2),
                    unselectedLabelColor: Colors.black87,
                    unselectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              body: TabBarView(
                children: dataNav
                    .map<Widget>((item) => mainPage(item, data['Sheet1']))
                    .toList(),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget mainPage(String key, dynamic data) {
    //Lấy ra danh sách phần mềm trong lĩnh vực
    var result = data.where((item) => item["LinhVuc"] == key).toList();

    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (context, index) {
        var listPerson = result[index]["Support"].toList();
        return Card(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(result[index]["Desc"]),
                subtitle: Text(result[index]["Title"]),
              ),
              Divider(
                color: Colors.black45,
              ),
              // ListView.builder(
              //   itemCount: listPerson.length,
              //   itemBuilder: (context, pIndex) {
              //     return new Text(listPerson[pIndex]["Name"]);
              //   },
              // ),
            ],
          ),
        );
      },
    );
  }
}
