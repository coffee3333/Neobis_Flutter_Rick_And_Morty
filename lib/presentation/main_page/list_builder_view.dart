import 'package:flutter/material.dart';
import 'package:neobis_flutter_rick_and_morty/domain/providers/main_page_provider.dart';
import 'package:provider/provider.dart';

class ListViewBuilder extends StatefulWidget {
  const ListViewBuilder({super.key});

  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainPageProvider>(
      builder: (context, provider, child) {
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                child: Text(
                  provider.getName(index),
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
            itemCount: provider.lengthPersonages,
          ),
        );
      },
    );
  }
}
