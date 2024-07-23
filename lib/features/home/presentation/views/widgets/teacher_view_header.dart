import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';

class TeacherViewHeader extends StatelessWidget {
  const TeacherViewHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3.5,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/Teacher.png')),
              ),
            ),),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right : 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'مستر /نبيل وليم',
                      style: Styles.semiBold20,
                    ),
                    Text(
                      'أستاذ في للغة العربية',
                      style: Styles.semiBold14
                          .copyWith(color: AppColors.primaryColor),
                    ),
                    Row(
                      children: [
                        const Text(
                          'تقييم:',
                          style: Styles.semiBold14,
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
                            full:
                            const Icon(Icons.star, color: Colors.amber),
                            half: const Icon(Icons.star_half,
                                color: Colors.amber),
                            empty: const Icon(Icons.star_border,
                                color: Colors.amber),
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: IconButton(onPressed: (){}, icon: const Icon(Icons.message,color: AppColors.primaryColor,)),
                        ),

                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: IconButton(onPressed: (){}, icon: const Icon(Icons.call,color: AppColors.primaryColor,)),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
