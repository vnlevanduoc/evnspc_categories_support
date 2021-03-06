import 'dart:convert';
import 'dart:math';

import 'package:evnspc_categories_support/data/remote/dongbo_service.dart';
import 'package:evnspc_categories_support/data/repo/dongbo_repo.dart';
import 'package:evnspc_categories_support/module/trang_chu/trang_chu_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class TrangChuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(
          value: DongBoService(),
        ),
        ProxyProvider<DongBoService, DongBoRepo>(
          update: (
            BuildContext context,
            DongBoService service,
            DongBoRepo repo,
          ) {
            return DongBoRepo(
              service: service,
            );
          },
        ),
      ],
      child: ConsumerWidget(),
    );
  }
}

class ConsumerWidget extends StatelessWidget {
  const ConsumerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<TrangChuBloc>.value(
      value: TrangChuBloc(repo: Provider.of(context)),
      child: Scaffold(
        appBar: AppBar(
          title: Text("EVNSPC - Sổ địa chỉ"),
        ),
        body: Consumer<TrangChuBloc>(
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
              InkWell(
                child: ListTile(
                  title: Text(
                    result[index]["Desc"],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(result[index]["Title"]),
                ),
                onTap: () async {
                  if (await canLaunch(result[index]["Title"])) {
                    await launch(result[index]["Title"]);
                  } else {
                    throw 'Could not launch ${result[index]["Title"]}';
                  }
                },
              ),
              Divider(
                color: Colors.black45,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: listPerson.length,
                itemBuilder: (context, pIndex) {
                  List<String> images_male = [
                    "assets/images/christian.jpg",
                    "assets/images/matt.jpg",
                    "assets/images/tom.jpg"
                  ];

                  List<String> images_female = [
                    "assets/images/lindsay.png",
                    "assets/images/rachel.png"
                  ];

                  return InkWell(
                    onTap: () async {
                      if (await canLaunch(
                          'tel://${listPerson[pIndex]["Phone"]}')) {
                        await launch('tel://${listPerson[pIndex]["Phone"]}');
                      } else {
                        throw 'Could not launch ${listPerson[pIndex]["Phone"]}';
                      }
                    },
                    child: ListTile(
                      leading: ClipOval(
                        child: Image(
                          image: AssetImage(
                              listPerson[pIndex]["GioiTinh"] == "0"
                                  ? images_female[
                                      Random().nextInt(images_female.length)]
                                  : images_male[
                                      Random().nextInt(images_male.length)]),
                          width: 50,
                          height: 50,
                        ),
                      ),
                      title: Text(
                        listPerson[pIndex]["Name"],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                      subtitle: Text(
                        '${listPerson[pIndex]["Phone"]} - Ext: ${listPerson[pIndex]["Ext"]}',
                        style: TextStyle(
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
