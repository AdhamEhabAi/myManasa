import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/widgets/custom_text_field.dart';
import 'package:my_manasa/features/search/presentation/views/widgets/search_widget.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient:
            LinearGradient(begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [AppColors.primaryColor.withOpacity(.9), Colors.white]),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.padding),
        child: Column(
          children: [
            CustomTextField(
              borderColor: AppColors.primaryColor,
              labelText: 'بحث',
              prefix: const Icon(Icons.search, size: 30),
              suffix: Image.asset('assets/images/search.png', width: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(12)),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      height: 1,
                    ),
                  );
                },
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const SearchWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
