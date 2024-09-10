import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_manasa/core/dialogs/show_marks_dialog.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_appbar.dart';
import 'package:my_manasa/core/widgets/custom_button.dart';
import 'package:my_manasa/features/Quiz/data/model/exam_qusetion_model.dart';
import 'package:my_manasa/features/Quiz/presentation/manager/quiz_cubit/quiz_cubit.dart';
import 'package:my_manasa/features/Quiz/presentation/views/widgets/exam_view_header.dart';

class ExamView extends StatefulWidget {
  final String quizId;

  const ExamView({super.key, required this.quizId});

  @override
  State<ExamView> createState() => _ExamViewState();
}

class _ExamViewState extends State<ExamView> {
  final _formKey = GlobalKey<FormState>();
  final Map<int, int?> _selectedAnswers = {};

  @override
  void initState() {
    super.initState();
    context.read<QuizCubit>().loadExamQuestions(quizId: widget.quizId);
  }

  void _handleSubmit(List<ExamQuestion> questions) {
    if (!_formKey.currentState!.validate()) {
      return; // If validation fails, exit the method
    }

    int score = 0;

    for (int i = 0; i < questions.length; i++) {
      final selectedAnswerIndex = _selectedAnswers[i];
      final correctAnswerIndex = int.tryParse(questions[i].correctAnswer);

      if (selectedAnswerIndex != null &&
          selectedAnswerIndex + 1 == correctAnswerIndex) {
        score++;
      }
    }

    showDialog(
      context: context,
      builder: (context) => ShowMarksDialog(
        score: score,
        totalQuestions: questions.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          logoColor: Colors.white,
          title: '',
          iconColor: Colors.white,
        ),
        body: BlocBuilder<QuizCubit, QuizState>(
          builder: (context, state) {
            if (state is ExamLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ExamLoaded) {
              final questions = state.questions;
              return Column(
                children: [
                  const ExamViewHeader(),
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: ListView.builder(
                        itemCount: questions.length,
                        itemBuilder: (context, index) {
                          final question = questions[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${index + 1}) ${question.question}',
                                  style: Styles.semiBold18.copyWith(
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                                ...question.answers.map((answer) {
                                  return ListTile(
                                    title: Text(answer),
                                    leading: Radio<int>(
                                      value: question.answers.indexOf(answer),
                                      groupValue: _selectedAnswers[index],
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedAnswers[index] = value;
                                        });
                                      },
                                    ),
                                  );
                                }).toList(),
                                // Add a dummy validator for each question
                                TextFormField(
                                  // Use a hidden field to trigger validation
                                  validator: (value) {
                                    if (!_selectedAnswers.containsKey(index)) {
                                      return 'Please select an answer';
                                    }
                                    return null;
                                  },
                                  initialValue: _selectedAnswers[index]?.toString(),
                                  onChanged: (value) {
                                    // Ensure the value is properly updated
                                    setState(() {
                                      _selectedAnswers[index] = int.tryParse(value) ?? -1;
                                    });
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  CustomButton(
                    text: Text(
                      'Submit',
                      style: Styles.semiBold18.copyWith(color: Colors.white),
                    ),
                    onPressed: () => _handleSubmit(questions),
                    borderRadius: 12,
                  ),
                ],
              );
            } else if (state is ExamError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }
}
