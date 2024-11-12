import 'package:flutter/widgets.dart';
import 'package:mumu_project/ETC/mediaQuery_set%202.dart';

class ListAddLast extends StatelessWidget {
  const ListAddLast({
    super.key,
    required this.label,
    required this.value,
    required this.width,
  });
  final String label, value;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: setFontSize(context, 0.025),
            fontWeight: FontWeight.bold,
            fontFamily: 'Prompt',
            color: const Color(0xFF637D92),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: width,
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFBCBCBC)),
            color: const Color(0xFFF7F5F5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: setFontSize(context, 0.024),
              overflow: TextOverflow.ellipsis,
              color: const Color(0xFF757575),
            ),
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
