// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app_flutter/views/front_page/front_page.dart';
import 'package:traveling_app_flutter/widgets/custom_button.dart';
import 'package:traveling_app_flutter/widgets/show_snackbar.dart';
import 'dart:io';

import '../../providers/firebase_providers/upload_provider.dart';
import '../../utils/media_query.dart';
import '../../widgets/custom_sized_box.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);
  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  File? _selectedImage;
  final ImagePicker _imagePicker = ImagePicker();
  bool _isUploading = false;
  Future<void> _uploadImage() async {
    final pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
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
      final firebase_storage.Reference storageReference = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('images/$imageName');
      final firebase_storage.UploadTask uploadTask =
          storageReference.putFile(_selectedImage!);
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
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //   content: Text('Details uploaded successfully!'),
      // ));
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => FrontPage(),
          ));
      showCustomSnackBar(context, 'Details uploaded successfully!');
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<UploadLocationsProvider>().fetchLocationsData();
  }

  @override
  Widget build(BuildContext context) {
    double width1 = GetScreenSize.getScreenWidth(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Upload Location Details',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Location Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
              ),
            ),
            CustomSizedBox(
              height: width1 * 0.04,
            ),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(
                labelText: 'Location Price',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
              ),
            ),
            CustomSizedBox(
              height: width1 * 0.04,
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Location Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
              ),
            ),
            CustomSizedBox(
              height: width1 * 0.04,
            ),
            TextField(
              controller: _ratingController,
              decoration: const InputDecoration(
                labelText: 'Location Rating',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (_selectedImage != null) ...[
              Image.file(_selectedImage!),
              const SizedBox(height: 16),
            ],
            CustomTextButton(
                onTab: _uploadImage,
                buttonText: 'Add Image',
                buttonColor: Colors.blue.shade800,
                radius: 8,
                fontSize: 20),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(30.0),
            //     ),
            //   ),
            //   onPressed: _uploadImage,
            //   child: const Text('Upload Image'),
            // ),
            const SizedBox(height: 16),
            Stack(
              alignment: Alignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: _isUploading ? null : _submitData,
                  child: const Text('Submit'),
                ),
                if (_isUploading)
                  const CircularProgressIndicator(
                    color: Colors.black,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
