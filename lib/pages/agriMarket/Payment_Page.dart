import 'package:application5/controller/cont/cart_controller.dart';
import 'package:application5/pages/agriMarket/success_page.dart';
import 'package:application5/widgets/myButton.dart';
import 'package:flutter/material.dart';
import 'package:flutterme_credit_card/flutterme_credit_card.dart';
import 'package:get/get.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class PaymentPage2 extends StatefulWidget {
  @override
  State<PaymentPage2> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage2> {
  int _selectedIndex = 4;

  final TextEditingController number = TextEditingController();
  final TextEditingController validThru = TextEditingController();
  final TextEditingController cvv = TextEditingController();
  final TextEditingController holder = TextEditingController();

  final formkey = GlobalKey<FormState>();

  bool isCreditCard = false;

  void initState() {
    super.initState();

    number.addListener(() => setState(() {}));
    validThru.addListener(() => setState(() {}));
    cvv.addListener(() => setState(() {}));
    holder.addListener(() => setState(() {}));
  }

  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MoltenBottomNavigationBar(
        selectedIndex: _selectedIndex,
        domeHeight: 25,
        onTabChange: (index) {},
        borderColor: Color(0xff1E9B3D),
        barColor: Colors.white,
        domeCircleColor: Color(0xffCAEDCF),
        tabs: [
          MoltenTab(
            icon: Image.asset(
              _selectedIndex == 0
                  ? 'images/home-selected.png'
                  : 'images/home.png',
            ),
            selectedColor: Color(0xff1E9B3D),
            title: Text(
              'home',
              style: TextStyle(color: Color(0xff1E9B3D)),
            ),
          ),
          MoltenTab(
            icon: Image.asset(
              _selectedIndex == 1
                  ? 'images/store-selected.png'
                  : 'images/store.png',
            ),
            selectedColor: Color(0xff1E9B3D),
            title: Text(
              'AgriMarket',
              style: TextStyle(color: Color(0xff1E9B3D)),
            ),
          ),
          MoltenTab(
            icon: Image.asset(
              _selectedIndex == 2
                  ? 'images/scan-selected.png'
                  : 'images/scan.png',
            ),
            selectedColor: Color(0xff1E9B3D),
            title: Text(
              'Scan',
              style: TextStyle(color: Color(0xff1E9B3D)),
            ),
          ),
          MoltenTab(
            icon: Image.asset(
              _selectedIndex == 3
                  ? 'images/community-selected.png'
                  : 'images/community.png',
            ),
            selectedColor: Color(0xff1E9B3D),
            title: Text(
              'Community',
              style: TextStyle(color: Color(0xff1E9B3D)),
            ),
          ),
          MoltenTab(
            icon: Image.asset(
              _selectedIndex == 4
                  ? 'images/profile-selected.png'
                  : 'images/profile.png',
            ),
            selectedColor: Color(0xff1E9B3D),
            title: Text(
              'Account',
              style: TextStyle(color: Color(0xff1E9B3D)),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Color(0xffF1FCF3),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Image.asset(
            "images/back.png",
            height: 20,
          ),
        ),
        title: Text(
          "Payment Methods",
          style: TextStyle(color: Color(0xff1A7431)),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formkey,
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "Credit & Debit Card",
                    style: TextStyle(fontSize: 25, color: Color(0xff1A7431)),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Add new Card",
                          style:
                              TextStyle(fontSize: 18, color: Color(0xff1A7431)),
                        ),
                      ],
                    ),
                    Radio(
                      value: true,
                      groupValue: isCreditCard,
                      onChanged: (value) {
                        setState(() {
                          isCreditCard = true;
                        });
                      },
                    ),
                  ],
                ),
              ),
              if (isCreditCard)
                Column(
                  children: [
                    FMCreditCard(
                      height: 0,
                      number: number.text,
                      numberMaskType: FMMaskType.first6last2,
                      cvv: cvv.text,
                      cvvMaskType: FMMaskType.full,
                      validThru: validThru.text,
                      validThruMaskType: FMMaskType.none,
                      holder: holder.text,
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(12),
                      child: Column(
                        children: [
                          FMHolderField(
                            controller: holder,
                            cursorColor: const Color(0xFF1A7431),
                            decoration: InputDecoration(
                              labelText: "Card Holder Name",
                              labelStyle: TextStyle(
                                color: Color(0xFF1A7431),
                              ),
                              hintText: "John Doe",
                            ),
                          ),
                          const SizedBox(height: 20),
                          FMNumberField(
                            style: TextStyle(color: Color(0xFF1A7431)),
                            controller: number,
                            cursorColor: Color(0xff1A7431),
                            decoration: InputDecoration(
                              labelText: "Card Number",
                              labelStyle: TextStyle(
                                color: Color(0xFF1A7431),
                              ),
                              hintText: "0000 0000 0000 0000",
                              fillColor: Color(0xFF1A7431),
                              counterStyle: TextStyle(color: Color(0xFF1A7431)),
                              focusColor: Color(0xFF1A7431),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: FMValidThruField(
                                  controller: validThru,
                                  cursorColor: const Color(0xFF1A7431),
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF1A7431),
                                      ),
                                    ),
                                    labelStyle: TextStyle(color: Color(0xFF1A7431)),
                                    labelText: "Expiration Date",
                                    hintText: "****",
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Flexible(
                                child: FMCvvField(
                                  controller: cvv,
                                  cursorColor: const Color(0xFF1A7431),
                                  decoration: InputDecoration(
                                    labelText: "CVV",
                                    labelStyle: TextStyle(
                                      color: Color(0xFF1A7431),
                                    ),
                                    hintText: "***",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.all(3),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: true,
                                      onChanged: (t) {},
                                      activeColor: Color(0xff1A7431),
                                    ),
                                    Text(
                                      "Save Card Info",
                                      style: TextStyle(color: Color(0xff1A7431)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Cash",
                          style:
                              TextStyle(fontSize: 18, color: Color(0xff1A7431)),
                        ),
                      ],
                    ),
                    Radio(
                      value: false,
                      groupValue: isCreditCard,
                      onChanged: (value) {
                        setState(() {
                          isCreditCard = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              MyButton(
                lable: "Continue",
                onPressed: () {
                  if (formkey.currentState!.validate() || !isCreditCard) {
                    cartController.placeOrder(isCreditCard ? "Credit Card" : "Cash");
                    Get.to(PaymentSuccessPage());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration({
    required String labelText,
    required String hintText,
  }) {
    return InputDecoration(
      border: const OutlineInputBorder(),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFF49B7AE),
        ),
      ),
      labelStyle: const TextStyle(color: Color(0xFF49B7AE)),
      labelText: labelText,
      hintText: hintText,
    );
  }
}