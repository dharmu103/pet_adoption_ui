import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: use_function_type_syntax_for_parameters
Widget searchBarField(onchange(v)) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Container(
      width: Get.width - 36,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 0.1, spreadRadius: 0.01)
          ]),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: TextFormField(
              // autofocus: true,
              onTap: () {},
              onChanged: (v) {
                onchange(v);
              },
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "search here"),
            ),
          ),
          const Icon(
            Icons.search,
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
    ),
  );
}
