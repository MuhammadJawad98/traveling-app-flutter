import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:traveling_app_flutter/utils/helper_function.dart';
import 'package:traveling_app_flutter/widgets/custom_text.dart';
import 'dart:io';
import 'dart:async';

import 'package:traveling_app_flutter/widgets/custom_text_field.dart';

class UploadImageData extends StatefulWidget {
  const UploadImageData({Key? key}) : super(key: key);
  @override
  State<UploadImageData> createState() => _UploadImageDataState();
}

class _UploadImageDataState extends State<UploadImageData> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  File? _selectedImage;
  final ImagePicker _imagePicker = ImagePicker();
  bool _isUploading = false;
  Future<void> _uploadImage() async {
    final pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  Future<void> _submitData() async {
    if (_selectedImage != null) {
      setState(() {
        _isUploading = true;
      });
      final imageName = DateTime.now().millisecondsSinceEpoch.toString();
      final firebase_storage.Reference storageReference = firebase_storage.FirebaseStorage.instance.ref().child('images/$imageName');
      final firebase_storage.UploadTask uploadTask = storageReference.putFile(_selectedImage!);
      await uploadTask;
      final imageUrl = await storageReference.getDownloadURL();
      await FirebaseFirestore.instance.collection('locations').add({
        'name': _nameController.text,
        'price': _priceController.text,
        'description': _descriptionController.text,
        'rating': _ratingController.text,
        'imageUrl': imageUrl,
      });
      setState(() {
        _isUploading = false;
      });
      AppCommonFunctions.showToast("Data Added", context);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Location Page',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const FlutterLogo(
              size: 65,
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomText(text: "location Name", color: Colors.black, size: 12, maxline: 1, fontWeight: FontWeight.bold),
            CustomTextField(
              prefixIcon: const Icon(Icons.location_city),
              hint: 'Location Name',
              controller: _nameController,
              raduis: 23,
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomText(text: "location Price", color: Colors.black, size: 12, maxline: 1, fontWeight: FontWeight.bold),
            CustomTextField(
              prefixIcon: const Icon(Icons.price_check),
              controller: _priceController,
              raduis: 23,
              hint: '   Location Price',
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomText(text: "location Description", color: Colors.black, size: 12, maxline: 1, fontWeight: FontWeight.bold),
            CustomTextField(
              prefixIcon: const Icon(Icons.description),
              controller: _descriptionController,
              raduis: 23,
              hint: '   Location Description',
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomText(text: "location Rating", color: Colors.black, size: 12, maxline: 1, fontWeight: FontWeight.bold),
            CustomTextField(
              prefixIcon: const Icon(Icons.star),
              controller: _ratingController,
              raduis: 23,
              hint: '   Location Rating',
            ),
            const SizedBox(height: 16),
            if (_selectedImage != null) ...[
              Image.file(_selectedImage!),
              const SizedBox(height: 16),
            ],
            ElevatedButton(
              onPressed: _uploadImage,
              child: const Text('Upload Image'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitData,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
