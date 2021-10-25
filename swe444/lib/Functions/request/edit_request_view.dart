import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'edit_request_form.dart';

class EditRequest extends StatelessWidget {
  EditRequest.ensureInitialized(this.document);
  final DocumentSnapshot document;

  const EditRequest({Key? key, required this.document}) : super(key: key);

  final String _title = "تعديل الطلب";

  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;
    bool portrait = true;

    if (deviceOrientation == Orientation.landscape) portrait = false;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                margin: EdgeInsets.only(right: 20, bottom: 8),
                child: Icon(
                  Icons.keyboard_backspace_rounded,
                  textDirection: TextDirection.rtl,
                  size: 30,
                  color: Color(0xff334856),
                ),
              ),
            ),
          ],
          title: Text(
            _title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff334856),
              fontWeight: FontWeight.w700,
              fontFamily: 'Tajawal',
              fontSize: 24,
            ),
          ),
          //automaticallyImplyLeading: false,
          backgroundColor: const Color(0xdeedd03c),
          bottomOpacity: 30,
          // elevation: 1,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50),
            ),
          ),
        ),
        backgroundColor: const Color(0xffededed),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                  ),
                  Text(
                    'نموذج تعديل طلب',
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff334856),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: portrait == true ? 15.h : 20.h),
                  Container(
                    // height: portrait == true ? 580.h : 1100.h,
                    width: portrait == true ? 330.w : 280.w,
                    padding:
                        const EdgeInsets.only(left: 12, right: 12, top: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Color(0xffffffff),
                      border: Border.all(
                          width: 0.5, color: const Color(0xffdfdfdf)),
                    ),
                    child: EditRequestForm(document: document ),
                  ),
                  SizedBox(height: portrait == true ? 120.h : 230.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
