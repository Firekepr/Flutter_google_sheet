import 'package:flutter/material.dart';

class MessageUtils {

  static void showSnackMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      duration: const Duration(seconds: 5),
      content: Text(message),
      action: SnackBarAction(
        onPressed: () {},
        label: 'OK',
        textColor: Colors.white,
      ),
    ));
  }

  static modalError(BuildContext context, String message) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (ctx) {
        return Container(
          height: MediaQuery.of(ctx).size.height * 0.3,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inversePrimary,
            border: Border.all(
              color: Colors.black,
              width: 0.2,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(26.0),
              topRight: Radius.circular(26.0),
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  height: 5,
                  margin: const EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 0.5,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.warning_amber,
                  color: Colors.white,
                  size: 24,
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(ctx).size.height * 0.18,
                        child: SingleChildScrollView(
                          child: Text(
                            message,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 14),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}