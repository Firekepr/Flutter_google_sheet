import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FormularyListLoader extends StatelessWidget {
  const FormularyListLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 12,
      shrinkWrap: true,
      itemBuilder: (context, idx) {
        return Shimmer.fromColors(
            baseColor: Colors.black12,
            highlightColor: Colors.white,
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.08,
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
            )
        );
      },
    );
  }
}
