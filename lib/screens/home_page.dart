import 'package:flutter/material.dart';
import 'package:flutter_rest_api/provider_class/provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<ProviderClass>>? providerclass;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*
    most important
    niser 3 line akhane ba kono button ba function/method er modde call korlei hobe
     */
    final postModel = Provider.of<ProviderClass>(context, listen: false);
     postModel.getData();
    postModel.getData2();
  }
  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<ProviderClass>(context);
    //print(postModel);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Network Data"),
      ),
      body: Column(
        children: [
          const Text("Test"),
          //Text(postModel.userInfoList![0].results![0].gender.toString()),
          //Text(postModel.userInfoList![].results[].name['title'].toString()),
          Text(postModel.userinfo?.results?[0].name?.title ?? ""),
          Text(postModel.userinfo?.info?.seed.toString() ?? ""),
          Text(postModel.userinfo?.results?[1].gender.toString() ?? ""),
          Flexible(
            child: ListView.builder(
              itemCount: postModel.userinfo?.results?.length,
                itemBuilder: (context, index){
                if(index!=null){
                  return Card(
                    child: ListTile(
                      title: Text(postModel.userinfo?.results?[index]?.name?.title ?? ""),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                },
            ),
          ),
        ],
      ),
    );
  }
}
