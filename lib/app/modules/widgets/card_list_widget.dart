import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CardListWidget extends StatelessWidget {
  const CardListWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.desc,
    required this.date, required this.onTap,
  }) : super(key: key);

  final String image;
  final String title;
  final String desc;
  final String date;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width * 0.3,
              height: Get.height * 0.15,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(7),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                  onError: (Object exception, StackTrace? stackTrace) {
                    print('onError');
                    print('Exception: $exception');
                    print('Stack Trace:\n$stackTrace');
                  },
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: SizedBox(
                height: Get.height * 0.15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          desc,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(fontSize: 13),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                    Text(
                      DateFormat('dd MMM yyyy')
                          .format(DateTime.parse(date.substring(0, 10))),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
