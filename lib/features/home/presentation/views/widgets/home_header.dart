import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' as trans;
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/features/authentication/presentation/manager/auth_cubit.dart';
import 'package:my_manasa/features/search/presentation/views/search_view.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    super.key,
  });

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  double _logoWidth = 120;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4,
      color: AppColors.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
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
                    height: 40,
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
                            onTap: () {
                              if (_isExpanded) {
                              }else{
                                setState(() {
                                  _isExpanded = !_isExpanded;
                                  _logoWidth = _isExpanded ? 0 : 120; // Toggle logo size
                                });
                              }
                            },
                            controller: searchController,
                            decoration: const InputDecoration(
                              hintText: 'بحث',
                              border: InputBorder.none,
                            ),
                            onSubmitted: (String value) {
                              trans.Get.to(
                                const SearchView(),
                                transition: trans.Transition.fadeIn,
                              );
                              searchController.clear();
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_isExpanded) {
                                _isExpanded = !_isExpanded;
                                _logoWidth = _isExpanded ? 0 : 120; // Toggle logo size
                                searchController.clear();
                              setState(() {

                              });
                            }else{

                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: _isExpanded ? Icon(
                              Icons.close,
                              color: AppColors.primaryColor,
                            ) : SizedBox(),
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
