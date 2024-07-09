extension DateTimeFormatter on DateTime {
  String toCustomFormat() {
    // Using the DateFormat class from the intl package to format the date
    return '${this.day.toString().padLeft(2, '0')}.${this.month.toString().padLeft(2, '0')}.${this.year}';
  }
}