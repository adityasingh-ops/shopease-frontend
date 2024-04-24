import 'package:flutter/material.dart';
import 'package:shopease/models/item_model.dart';

class FetchItems{
  final List<ItemModel> ? data;
  final bool isLoading;
  final Exception? error;
  final VoidCallback? refetch;

  FetchItems({
    required this.data,
    required this.isLoading,
    required this.error,
    required this.refetch,
  });
}