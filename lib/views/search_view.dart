import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:  Size.fromHeight(40.sp),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title:  Text(
              'Search',
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
            centerTitle: true,
          ),
        ),
        body: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'What are you looking for ?',
                prefixIcon: const Icon(
                  Icons.search,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
