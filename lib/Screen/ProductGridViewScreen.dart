import 'package:cruid_app_ii_by_rabbil_hasan/RestAPI/RestClient.dart';
import 'package:cruid_app_ii_by_rabbil_hasan/Screen/ProductCreateScreen.dart';
import 'package:cruid_app_ii_by_rabbil_hasan/Style/ScreenBackground.dart';
import 'package:cruid_app_ii_by_rabbil_hasan/Style/Style.dart';
import 'package:cruid_app_ii_by_rabbil_hasan/Widgets/AppBar.dart';
import 'package:cruid_app_ii_by_rabbil_hasan/Widgets/Drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductGrideViewScreen extends StatefulWidget {
  const ProductGrideViewScreen({super.key});

  @override
  State<ProductGrideViewScreen> createState() => _ProductGrideViewScreenState();
}

class _ProductGrideViewScreenState extends State<ProductGrideViewScreen> {

  List ProductList=[];
  bool Loading=true;

  @override
  void initState(){
    CallData();
    super.initState();


  }

  CallData() async{
    Loading=true;
    var data= await ProductGridViewListRequest();
    setState(() {
      ProductList=data;
      Loading=false;
    });

  }

  DeleteItem(id) async{
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Delete'),
            content: Text("Are your sure?"),
            actions: [
              TextButton(onPressed: () async{
                Navigator.pop(context);

                // setState(() {Loading=true;});
                // await ProductDeleteReq(id);
                // await CallData();




              }, child: Text('Yes')),
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('No')),

            ],
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: customAppBar('List Product'),
      body: Stack(
        children: [
          // ScreenBackground(context),
          Container(
            child: Loading?(Center(child: CircularProgressIndicator(),)):
            (
            RefreshIndicator(
              onRefresh: () async {
                setState(() {
                  CallData();
                });
              },
              child: GridView.builder(
                  gridDelegate: ProducGridViewStyle(),
                  itemCount: ProductList.length,
                  itemBuilder: (context,index){

                    return Card(
                      color: Colors.white70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,

                        children: [
                          Expanded(child: Image.network(ProductList[index]['Img'],fit: BoxFit.fill,)),
                          Container(
                            padding: EdgeInsets.fromLTRB(5,5,5,8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(ProductList[index]['ProductName']),
                                SizedBox(height: 7,),
                                Text('Price '+ProductList[index]['UnitPrice']),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,

                                  children: [
                                    IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.ellipsis_vertical_circle,size: 18,color: Colors.green,),),


                                    IconButton(onPressed: (){
                                      DeleteItem(ProductList[index]['_id']);

                                    },
                                      icon:  Icon(CupertinoIcons.delete_solid,size: 18,color: Colors.redAccent,),),
                                  ],
                                )

                              ],
                            ),
                          )

                        ],
                      ),
                    );
                  }

              ),
            )
            ),
          )


        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductcreatScreen()));
        },
        child: Icon(Icons.add),
      ),

    );
  }
}






