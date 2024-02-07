import 'package:intl/intl.dart';

extension DateFormating on DateTime {
  formatDate() => DateFormat('dd/MM/yyyy hh:mm:a').format(this);
}
