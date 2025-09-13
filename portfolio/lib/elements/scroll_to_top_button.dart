import 'package:flutter/material.dart';

class ScrollToTopDemo extends StatefulWidget {
  const ScrollToTopDemo({super.key});

  @override
  State<ScrollToTopDemo> createState() => _ScrollToTopDemoState();
}

class _ScrollToTopDemoState extends State<ScrollToTopDemo> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0, // vị trí đầu tiên
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scroll to Top")),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: 50,
        itemBuilder: (context, index) => ListTile(
          title: Text("Item $index"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scrollToTop,
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }
}
