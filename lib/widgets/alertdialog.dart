import 'package:flutter/material.dart';

import '../colors.dart';
import '../textstyle.dart';

alertDialog(BuildContext context, {String? title, Widget? content, List<Widget>? listactions}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: title != null
            ? Text(
                title,
                style: kanitr(c: ColorApp.turquoise),
              )
            : null,
        content: content != null
            ? SingleChildScrollView(child: content)
            // SingleChildScrollView(
            //     child: ListBody(
            //       children: const <Widget>[
            //         Text('This is a demo alert dialog.'),
            //         Text('Would you like to approve of this message?'),
            //       ],
            //     ),
            //   )
            : null,
        actions: listactions,
        // <Widget>[
        //     TextButton(
        //       child: const Text('Approve'),
        //       onPressed: () {
        //         Navigator.of(context).pop();
        //       },
        //     ),
        //   ],
      );
    },
  );
}
