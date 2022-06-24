import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technicaltest_danafix/app/modules/search/controllers/search_controller.dart';

class SearchWithBackButton extends StatelessWidget {
  const SearchWithBackButton({
    Key? key,
    required this.onTapBackButton,
    required this.controller,
    required this.searchTextEditingC,
  }) : super(key: key);

  final VoidCallback onTapBackButton;
  final GetxController controller;
  final TextEditingController searchTextEditingC;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchController());
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 10, 20, 0),
      height: 40,
      child: Row(
        children: [
          IconButton(
              onPressed: onTapBackButton, icon: const Icon(Icons.arrow_back)),
          Expanded(
            child: TextField(
              controller: searchTextEditingC,
              keyboardType: TextInputType.text,
              onSubmitted: (value) {
                controller.getNewsEverything(keyword: value);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 5),
                filled: true,
                hintText: 'Search News',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
                border: InputBorder.none,
                prefixIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 18,
                    )
                  ],
                ),

                /// cancel button
                suffixIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        searchTextEditingC.clear();
                      },
                      child: const SizedBox(
                        width: 25,
                        height: 25,
                        child: Center(
                          child: Icon(
                            Icons.cancel,
                            size: 17,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
