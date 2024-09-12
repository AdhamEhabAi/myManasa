import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_appbar.dart';
import 'package:my_manasa/features/Quiz/presentation/manager/quiz_cubit/quiz_cubit.dart';
import 'package:my_manasa/features/Quiz/presentation/views/widgets/quiz_widget.dart';
import 'package:my_manasa/features/authentication/presentation/manager/auth_cubit.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    String userId = context.read<AuthCubit>().userModel!.id;

    context.read<QuizCubit>().fetchExamsHistory(userId: userId);

    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'سجل الأختبارات',
          titleColor: AppColors.primaryColor,
          backGroundColor: Colors.transparent,
        ),
        body: BlocBuilder<QuizCubit, QuizState>(
          builder: (context, state) {
            if (state is QuizLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is QuizHistoryLoaded) {
              if (state.examsHistory.isEmpty) {
                return Center(
                  child: Text('لا يوجد امتحانات', style: Styles.bold20),
                );
              } else {
                return ListView.separated(
                  itemCount: state.examsHistory.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemBuilder: (context, index) {
                    final examData = state.examsHistory[index];
                    return QuizWidget(
                      onTap: () {},
                      examHistory: examData,
                    );
                  },
                );
              }
            } else if (state is QuizError) {
              return Center(child: Text(state.message, style: Styles.bold20));
            } else {
              return Center(
                  child: Text('لا يوجد امتحانات', style: Styles.bold20));
            }
          },
        ),
      ),
    );
  }
}
