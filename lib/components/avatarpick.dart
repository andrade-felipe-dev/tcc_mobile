import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AvatarPick extends StatefulWidget {
  final VoidCallback onChanged;

  const AvatarPick({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<AvatarPick> createState() => _AvatarPickState();
}

class _AvatarPickState extends State<AvatarPick> {
  ImageProvider? _image;

  void _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _image = FileImage(File(pickedImage.path));
        widget.onChanged();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(
                  Icons.photo_library,
                ),
                title: const Text('Galeria'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Câmera'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              _image != null
                  ? ListTile(
                      leading: const Icon(
                        Icons.close,
                      ),
                      title: const Text('Remover imagem'),
                      onTap: () {
                        setState(() {
                          _image = null;
                        });
                        Navigator.pop(context);
                      },
                    )
                  : Container(),
            ],
          ),
        );
      },
      child: CircleAvatar(
        radius: 100,
        backgroundColor: Colors.grey,
        backgroundImage: _image,
        child: _image == null
            ? const Icon(
                Icons.person,
                size: 180.0,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
