import 'package:flutter/material.dart';
import 'package:project_google_sheet/model/FeedbackForm.dart';

class FormularyListItem extends StatelessWidget {
  final FeedbackForm item;
  final int idx;

  const FormularyListItem({
    super.key,
    required this.item,
    required this.idx,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.black,
              backgroundImage: ExactAssetImage('assets/avatar_image.png'),
            ),
          ),
          Expanded(
            child: Card(
              color: Colors.blueGrey[300],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.5,
                      ),
                    ),
                    Text(
                      item.feedBack,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Theme.of(context).primaryColor,
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
