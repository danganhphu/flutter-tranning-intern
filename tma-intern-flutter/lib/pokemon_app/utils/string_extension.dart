extension StringExtension on String {
  String toTitleCase() => "${this[0].toUpperCase()}${substring(1)}";
}
