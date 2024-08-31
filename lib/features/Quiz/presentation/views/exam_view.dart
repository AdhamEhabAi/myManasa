import 'package:flutter/material.dart';
import 'package:flutter_survey/flutter_survey.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_appbar.dart';
import 'package:my_manasa/core/widgets/custom_button.dart';
import 'package:my_manasa/features/Quiz/presentation/views/widgets/exam_view_header.dart';

class ExamView extends StatefulWidget {
  const ExamView({super.key});

  @override
  State<ExamView> createState() => _ExamViewState();
}

class _ExamViewState extends State<ExamView> {
  final _formKey = GlobalKey<FormState>();

  List<QuestionResult> _questionResults = [];

  final List<Question> _initialData = [
    Question(
      isMandatory: true,
      question: 'Do you like drinking coffee?',
      answerChoices: {
        "Yes": [
          Question(
              singleChoice: false,
              question: "What are the brands that you've tried?",
              answerChoices: {
                "Nestle": null,
                "Starbucks": null,
                "Coffee Day": [
                  Question(
                    question: "Did you enjoy visiting Coffee Day?",
                    isMandatory: true,
                    answerChoices: {
                      "Yes": [
                        Question(
                          question: "Please tell us why you like it",
                        )
                      ],
                      "No": [
                        Question(
                          question: "Please tell us what went wrong",
                        )
                      ],
                    },
                  )
                ],
              })
        ],
        "No": [
          Question(
            question: "Do you like drinking Tea then?",
            answerChoices: {
              "Yes": [
                Question(
                    question: "What are the brands that you've tried?",
                    answerChoices: {
                      "Nestle": null,
                      "ChaiBucks": null,
                      "Indian Premium Tea": [
                        Question(
                          question: "Did you enjoy visiting IPT?",
                          answerChoices: {
                            "Yes": [
                              Question(
                                question: "Please tell us why you like it",
                              )
                            ],
                            "No": [
                              Question(
                                question: "Please tell us what went wrong",
                              )
                            ],
                          },
                        )
                      ],
                    })
              ],
              "No": null,
            },
          )
        ],
      },
    ),
    Question(
        question: "What age group do you fall in?",
        isMandatory: true,
        answerChoices: const {
          "18-20": null,
          "20-30": null,
          "Greater than 30": null,
        })
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppBar(
        logoColor: Colors.white,
        title: '',
        iconColor: Colors.white,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const ExamViewHeader(),
            Expanded(
              child: Form(
                key: _formKey,
                child: Survey(
                  defaultErrorText: 'ادخل اجابة',
                    onNext: (questionResults) {
                      _questionResults = questionResults;
                    },
                    initialData: _initialData),
              ),
            ),
            CustomButton(
              text: Text(
                'ارسال',
                style: Styles.semiBold18.copyWith(color: Colors.white),
              ),
              onPressed: () {
                if(_formKey.currentState!.validate()){
                  return ;
                }else{
                }
              },
              borderRadius: 12,
            ),
          ],
        ),
      ),
    ));
  }
}
