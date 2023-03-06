import 'package:flutter/material.dart';
import 'package:makassar_pet_clinic/components/book_list.dart';
import 'package:makassar_pet_clinic/const.dart';

class Book extends StatefulWidget {
  const Book({super.key});

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        backgroundColor: colorWhite,
        appBar: AppBar(
          title: Text('Book History', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white)),
          centerTitle: true,
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  colorPrimary,
                  colorPrimaryDark,
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BookList(
                title: 'Dr. Yudha Islami Sulistya',
                tanggal: '23 Maret 2023',
                status: 'Success',
              ),
              BookList(
                title: 'Dr. Yudha Islami Sulistya',
                tanggal: '23 Maret 2023',
                status: 'Failed',
              ),
              BookList(
                title: 'Dr. Yudha Islami Sulistya',
                tanggal: '23 Maret 2023',
                status: 'Pending',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
