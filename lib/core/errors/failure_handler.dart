import 'package:dartz/dartz.dart';
import 'package:my_manasa/core/widgets/toast_m.dart';

import 'failures.dart';

void failureHandler(
    Either<Failure, dynamic> result, void Function() onSuccess) {
  result.fold(
    (l) => ToastM.show(l.message),
    (r) => onSuccess(),
  );
}
