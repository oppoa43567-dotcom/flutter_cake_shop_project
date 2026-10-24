// ignore_for_file: unused_element, sort_child_properties_last, unused_label, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_cake_shop_project/models/cake_shop.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CakeShopDetailUI extends StatefulWidget {
  //สร้างตัวแปรรับค่าข้อมูลร้านจากหน้า shop_list_ui
  CakeShop? cakeShop;

  CakeShopDetailUI({super.key, this.cakeShop});

  @override
  State<CakeShopDetailUI> createState() => _CakeShopDetailUIState();
}

class _CakeShopDetailUIState extends State<CakeShopDetailUI> {
  //method โทร
  Future<void> _makePhoneCall(String phoneNumber) async {
    final launchUri = Uri(scheme: 'tel', path: phoneNumber);
    await launchUrl(launchUri);
  }

  //method เปิด app ,browser,map,facebook
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 6, 6),
        leading: IconButton(
          onPressed: () {
            // Navigator.pop(context);
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          widget.cakeShop!.name!,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      //ส่วนของ body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            bottom: 45,
            left: 45,
            right: 45,
          ),
          child: Center(
            child: Column(
              children: [
                //แสดงรูปแรกของแต่ละร้าน
                ClipRRect(
                  borderRadius: BorderRadius.circular(7.5),
                  child: Image.asset(
                    widget.cakeShop!.image1!,
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                //แสดงรูป สอง และ สาม ในแนวนอน
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(7.5),
                      child: Image.asset(
                        widget.cakeShop!.image2!,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.025,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(7.5),
                      child: Image.asset(
                        widget.cakeShop!.image3!,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                //แสดงชื่อร้าน
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ชื่อร้าน 🧳',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.cakeShop!.name!,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                //แสดงเวลาเปิด-ปิด
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'เวลาเปิด-ปิด 🕒',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.cakeShop!.openCloseTime!,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                //แสดง รายละเอียดของร้าน
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'รายละเอียดของร้าน 📝',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.cakeShop!.description!,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                //แสดง ที่อยู่ของร้าน
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ที่อยู่ของร้าน 📍',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.cakeShop!.address!,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                //แสดง ปุ่มเบอร์โทร และ โทรได้
                ElevatedButton(
                  onPressed: () {
                    //เรียกใช้งาน โทร
                    _makePhoneCall(widget.cakeShop!.phone!);
                  },
                  child: Text(
                    // widget.cakeShop!.phone!,
                    ' ${widget.cakeShop!.phone!}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width * 0.45,
                      50,
                    ),
                    backgroundColor: const Color.fromARGB(255, 30, 197, 72),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                //แสดงเว็บไซต์ และเปิดได้
                ListTile(
                  onTap: () {
                    _launchInBrowser(
                      Uri.parse(widget.cakeShop!.website!),
                    );
                  },
                  leading: FaIcon(
                    FontAwesomeIcons.globe,
                    color: const Color.fromARGB(255, 218, 169, 37),
                    size: 28,
                  ),
                  trailing: Icon(
                    Icons.link,
                    size: 28,
                  ),
                  title: Text(
                    widget.cakeShop!.website!,
                  ),
                ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.01,
                // ),
                //แสดง ลิ้งค์ facebook และเปิดได้
                ListTile(
                  onTap: () {
                    _launchInBrowser(
                      Uri.parse(widget.cakeShop!.facebook!),
                    );
                  },
                  leading: FaIcon(
                    FontAwesomeIcons.facebook,
                    color: const Color.fromARGB(255, 46, 67, 255),
                    size: 28,
                  ),
                  trailing: Icon(
                    Icons.link,
                    size: 28,
                  ),
                  title: Text(
                    widget.cakeShop!.facebook!,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                //แสดง map และเปิดได้
              ],
            ),
          ),
        ),
      ),
    );
  }
}
