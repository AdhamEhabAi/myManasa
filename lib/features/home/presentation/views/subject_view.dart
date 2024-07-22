import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_appbar.dart';

class SubjectView extends StatelessWidget {
  const SubjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'اللغة العربية',
          backGroundColor: Colors.transparent,
          titleColor: AppColors.primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left:AppPadding.padding,right: AppPadding.padding,top: AppPadding.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'أشهر المدرسين',
                style: Styles.semiBold20,
              ),
              const SizedBox(height: 20,),
              SizedBox(
                height: MediaQuery.of(context).size.height/3,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: const Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('assets/images/Teacher (2).png'),
                              radius: 32,
                            ),
                            SizedBox(width: 10,),
                            Text('مستر /نبيل وليم',style: Styles.semiBold16,)
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(height: 20,),
                    itemCount: 3),
              ),
              const Text(
                'المدرسين',
                style: Styles.semiBold20,
              ),
              const SizedBox(height: 20,),
              Expanded(
                child: SizedBox(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: const Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage('assets/images/Teacher (2).png'),
                                radius: 32,
                              ),
                              SizedBox(width: 10,),
                              Text('مستر /نبيل وليم',style: Styles.semiBold16,)
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(height: 20,),
                      itemCount: 10),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
