import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';

class AllTeachersTeacherWidget extends StatelessWidget {
  const AllTeachersTeacherWidget({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppPadding.padding, top: 10, bottom: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0, 4),
                blurRadius: 4, // Increased blurRadius
                spreadRadius: 0, // Increased spreadRadius
              ),
            ],
            borderRadius: BorderRadius.circular(17),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(17),
                      topRight: Radius.circular(17),
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/Teacher (2).png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, 4),
                        blurRadius: 4, // Increased blurRadius
                        spreadRadius: 0, // Increased spreadRadius
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(17),
                      bottomLeft: Radius.circular(17),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'مستر /',
                                  style: Styles.semiBold10.copyWith(color: AppColors.primaryColor),
                                ),
                                Text(
                                  'مجدي بلال',
                                  style: Styles.semiBold10,
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'دكتور في مادة العلوم',
                              overflow: TextOverflow.ellipsis,
                              style: Styles.semiBold10.copyWith(color: Colors.grey,fontSize: 9),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                'تقييم',
                                style: Styles.semiBold10.copyWith(color: Colors.grey),
                              ),
                              const SizedBox(height: 5),
                              RatingBar(
                                initialRating: 4,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 10,
                                ratingWidget: RatingWidget(
                                  full: const Icon(Icons.star, color: Colors.amber),
                                  half: const Icon(Icons.star_half, color: Colors.amber),
                                  empty: const Icon(Icons.star_border, color: Colors.amber),
                                ),
                                onRatingUpdate: (rating) {
                                },
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Text('مادة العلوم',style: Styles.semiBold10.copyWith(color: AppColors.primaryColor),),
                          )

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
