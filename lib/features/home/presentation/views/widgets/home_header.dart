import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' as trans;
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/features/authentication/presentation/manager/auth_cubit.dart';
import 'package:my_manasa/features/search/presentation/views/search_view.dart';
import 'package:my_manasa/features/search/presentation/manager/search_cubit.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  double _logoWidth = 120.w;
  bool _isExpanded = false;
  late TextEditingController searchController;
  late FocusNode searchFocusNode;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primaryColor, AppColors.secondaryColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4), // Shadow position
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 20.h),
            Text(
              'مرحبا, ${'${authCubit.userModel?.fname} ${authCubit.userModel?.lname}'}',
              style: Styles.regular24.copyWith(
                color: Colors.white,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  width: _logoWidth,
                  child: Image.asset(
                    'assets/images/logo.png',
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.h),
                          child: Icon(
                            _isExpanded ? Icons.arrow_back_ios : Icons.search,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            focusNode: searchFocusNode,
                            onTap: () {
                              if (!_isExpanded) {
                                setState(() {
                                  _isExpanded = true;
                                  _logoWidth = 0; // Toggle logo size
                                });
                              }
                            },
                            controller: searchController,
                            decoration: const InputDecoration(
                              hintText: 'بحث',
                              border: InputBorder.none,
                            ),
                            onSubmitted: (String value) {
                              final searchCubit = BlocProvider.of<SearchCubit>(context);
                              searchCubit.searchCourses(courseName: value);
                              trans.Get.to(() => const SearchView(), transition: trans.Transition.fadeIn);
                              searchController.clear();
                              searchFocusNode.unfocus();
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_isExpanded) {
                              setState(() {
                                _isExpanded = false;
                                _logoWidth = 120; // Toggle logo size
                                searchController.clear();
                                searchFocusNode.unfocus();
                              });
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: _isExpanded
                                ? const Icon(
                              Icons.close,
                              color: AppColors.primaryColor,
                            )
                                : const SizedBox(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
