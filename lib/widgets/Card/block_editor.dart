import 'package:app_template/data/classes/models/block_wrapper.dart';
import 'package:app_template/data/constants.dart';
import 'package:flutter/material.dart';

class BlockEditor extends StatefulWidget {
  const BlockEditor({
    super.key,
    required this.block,
    required this.onDelete,
    required this.onAddImage,
  });

  final BlockWrapper block;
  final VoidCallback onDelete;
  final VoidCallback onAddImage;

  @override
  State<BlockEditor> createState() => _BlockEditorState();
}

class _BlockEditorState extends State<BlockEditor> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
