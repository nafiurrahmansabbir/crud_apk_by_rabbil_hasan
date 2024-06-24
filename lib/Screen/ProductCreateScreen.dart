
import 'package:flutter/material.dart';
import '../RestAPI/RestClient.dart';
import '../Style/Button.dart';
import '../Style/InputBoxTextFieldDecoration.dart';
import '../Style/ScreenBackground.dart';
import '../Utility/Utility.dart';
import '../Widgets/AppBar.dart';


class ProductcreatScreen extends StatefulWidget {
  const ProductcreatScreen({super.key});

  @override
  State<ProductcreatScreen> createState() => _ProductcreatScreenState();
}

class _ProductcreatScreenState extends State<ProductcreatScreen> {

  //Controller.
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _unitPriceTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();
  final TextEditingController _productCodeTEController = TextEditingController();
  //creat a map for data using api ...
  Map<String,dynamic> FormValues={"ProductName": "", "ProductCode": "", "Img": "", "UnitPrice": "", "Qty": "", "TotalPrice": "",};

  bool Loading=false;



  InputOnChange(Mapkey,Textvalue){

    setState(() {
      FormValues.update(Mapkey, (value) => Textvalue);
    });
  }
  formOnSubmit() async{
    if(FormValues['ProductName']!.length==0){
      ErrorTost('Insert Procut Name');
    }
    else if(FormValues['ProductCode']!.length==0){
      ErrorTost('Insert Procut Code');
    }
    else if(FormValues['Img']!.length==0){
      ErrorTost('Insert Image URl');
    }
    else if(FormValues['UnitPrice']!.length==0){
      ErrorTost('Insert Unit Price');
    }
    else if(FormValues['TotalPrice']!.length==0){
      ErrorTost('Insert Total Price');
    }
    else if(FormValues['Qty']!.length==0){
      ErrorTost('Select Quantity');
    }
    else{
      //data rest Api.....
      setState(() {
        Loading=true;
      });
      //API Calling...
     await ProductCreateRequest(FormValues);


     //reset form
     _nameTEController.clear();
     _unitPriceTEController.clear();
     _productCodeTEController.clear();
     _quantityTEController.clear();
     _totalPriceTEController.clear();
     _imageTEController.clear();

     setState(() {
       Loading=false;
     });

    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: customAppBar('Create Product'),
      body: Stack(

        children: [
          //background
          // ScreenBackground(context),

          Container(
            child: Loading?(
            Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.green,
              ),
            )
            ):((SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameTEController,
                    onChanged: (value){
                      InputOnChange('ProductName', value);
                    },
                    decoration: AppInputDecoration('Product Name'),
                  ),

                  SizedBox(height: 20,),
                  TextFormField(
                    controller: _productCodeTEController,
                    onChanged: (value){
                      InputOnChange('ProductCode', value);
                    },
                    decoration: AppInputDecoration('Product Code'),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: _imageTEController,
                    onChanged: (value){
                      InputOnChange('Img', value);
                    },
                    decoration: AppInputDecoration('Product Image'),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: _unitPriceTEController,
                    onChanged: (value){
                      InputOnChange('UnitPrice', value);
                    },
                    decoration: AppInputDecoration('Unit Price'),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: _totalPriceTEController,
                    onChanged: (value){
                      InputOnChange('TotalPrice', value);
                    },
                    decoration: AppInputDecoration('Total Price'),
                  ),


                  SizedBox(height: 20,),
                  AppDropDownStyle(
                    DropdownButton(
                      value: FormValues['Qty'],
                      items: [
                        DropdownMenuItem(child: Text('Select Quantity'),value: '',),
                        DropdownMenuItem(child: Text('1 pcs'),value: '1 pcs',),
                        DropdownMenuItem(child: Text('2 pcs'),value: '2 pcs',),
                        DropdownMenuItem(child: Text('3 pcs'),value: '3 pcs',),
                        DropdownMenuItem(child: Text('4 pcs'),value: '4 pcs',),
                        DropdownMenuItem(child: Text('5 pcs'),value: '5 pcs',),
                      ],
                      dropdownColor: Colors.greenAccent,
                      onChanged: (value){
                        InputOnChange('Qty', value);
                      },
                      underline: Container(),
                      isExpanded: true,
                    ),
                  ),



                  SizedBox(height: 20,),
                  Container(child: ElevatedButton(
                      style: AppButtonStyle(),
                      onPressed: (){
                        formOnSubmit();
                      },
                      child: SuccesButtonChild('Submit')
                  )
                  ),














                  // ElevatedButton(onPressed: (){
                  //   ProductCreateRequest(FormValues);
                  // }, child: Text('sdf'))


                ],
              ),
            ))),
          ),
        ],
      ),

    );
  }




  @override
  void dispose() {
    _nameTEController.dispose();
    _unitPriceTEController.dispose();
    _quantityTEController.dispose();
    _totalPriceTEController.dispose();
    _imageTEController.dispose();
    super.dispose();
  }


}








