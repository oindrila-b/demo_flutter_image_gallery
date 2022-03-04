import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
class ImageView extends StatefulWidget {

  final String imageURL;
  ImageView({required this.imageURL});

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {

  var filepath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: widget.imageURL,
            child: Container(
              height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(widget.imageURL, fit: BoxFit.cover,)),
          ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      _save();
                      // Navigator.pop(context);
                     },
                    child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width/2,
                              decoration: BoxDecoration(
                                color: Color(0xFF1C1B1C).withOpacity(0.8),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width/2,
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white60, width: 1),
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(
                                      colors: [
                                        Color(0x36FFFFFF),
                                        Color(0x0FFFFFFF)
                                      ]
                                  )
                              ),
                              child: Column(
                                children: [
                                  Text("Download Image", style: TextStyle(
                                      fontSize: 16, color:  Colors.white,
                                    fontWeight: FontWeight.w400
                                  )),
                                  Text("Image will be saved in Gallery", style: TextStyle(
                                      fontSize: 12, color:  Colors.white
                                  ),)
                                ],
                              ),
                            )
                          ],
                        ),
                  ),
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                      child: Text("Cancel", style: TextStyle(color: Colors.white),)),
                  SizedBox(height: 50),
                ],
              ),
            )
        ],
      ),
    );
 }
  _save() async {
    if(Platform.isAndroid) {
      await _askPermission();
    }
    var response = await Dio().get(widget.imageURL,
        options: Options(responseType: ResponseType.bytes));
    final result =
    await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    Navigator.pop(context);
  }

  _askPermission() async {
    if (Platform.isIOS) {
      // Map<Permission, PermissionStatus> permissions =
          await [
            Permission.photos
          ].request();
    } else {
       // PermissionStatus permission =
       await Permission.photos.isGranted;
    }
  }
}
