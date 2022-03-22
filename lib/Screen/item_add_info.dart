import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:carousel_slider/carousel_slider.dart';

List<String> _imageList = [];

class ItemAddInfo extends StatefulWidget {
  const ItemAddInfo({Key? key}) : super(key: key);

  @override
  State<ItemAddInfo> createState() => _ItemAddInfoState();
}

class _ItemAddInfoState extends State<ItemAddInfo> {
  String dropdownvalue = 'Tactor';

  var items = [
    'Tactor',
    'Handtools',
    'Bulls',
  ];
  @override
  Widget build(BuildContext context) {
    Future<dynamic> takeImages(ImageSource source) async {
      // ignore: invalid_use_of_visible_for_testing_member
      var image = await ImagePicker.platform.pickImage(source: source);
      late PickedFile imagePickedFile;
      imagePickedFile = image as PickedFile;
      setState(() {
        if (imagePickedFile.path.isNotEmpty) {
          _imageList.add(imagePickedFile.path);
        }
      });
    }

    Future bottomSheet(message) {
      return showModalBottomSheet(
        builder: (BuildContext context) => Container(
          height: 150.0,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                message,
                style: const TextStyle(fontFamily: 'Overpass', fontSize: 24),
                textAlign: TextAlign.center,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  onPrimary: Colors.white,
                ),
                icon: const Icon(Icons.camera),
                onPressed: () async {
                  takeImages(ImageSource.camera);
                },
                label: const Text("Camera"),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  onPrimary: Colors.white,
                ),
                icon: const Icon(Icons.image),
                onPressed: () {
                  takeImages(ImageSource.gallery);
                },
                label: const Text("Gallery"),
              )
            ],
          ),
        ),
        context: context,
      );
    }

    Widget imageboxProfile() {
      return Center(
        child: _imageList.isEmpty
            ? Stack(
                children: [
                  const Center(
                    child: Card(
                      color: Colors.white30,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 70, horizontal: 150),
                        child: Text(" "),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 55, horizontal: 0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(48, 48),
                              shape: const CircleBorder(),
                              primary: Colors.transparent,
                              onPrimary:
                                  const Color.fromARGB(255, 255, 255, 255)),
                          onPressed: () {
                            bottomSheet("Add Picture of your equipment ");
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 0),
                            child: Center(child: Icon(Icons.add)),
                          )),
                    ),
                  ),
                ],
              )
            : Stack(children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.4,
                    initialPage: 0,
                    autoPlay: false,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: _imageList.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Image.file(File(i));
                      },
                    );
                  }).toList(),
                ),
                Center(
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 55, horizontal: 0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(48, 48),
                            shape: const CircleBorder(),
                            primary: Colors.transparent,
                            onPrimary:
                                const Color.fromARGB(255, 255, 255, 255)),
                        onPressed: () {
                          bottomSheet("Add Picture of your equipment ");
                        },
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                          child: Center(child: Icon(Icons.add)),
                        )),
                  ),
                ),
              ]),
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Add Item',
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            imageboxProfile(),
            const SizedBox(
              height: 20,
            ),
            Material(
              elevation: 5,
              child: DropdownButton(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                value: dropdownvalue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Material(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              elevation: 5,
              child: TextFormField(
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: "Name Of Equipment",
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Material(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              elevation: 5,
              child: TextFormField(
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: "Description",
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Material(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              elevation: 5,
              child: TextFormField(
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: "Vehicel No./Quantity",
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Material(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              elevation: 5,
              child: TextFormField(
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: "Price",
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Submit', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(155, 40),
                  primary: const Color.fromARGB(255, 46, 134, 49)),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
