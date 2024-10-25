extension CommaSeparated on int {
  String toCommaSeparated() {
    return toString().replaceAllMapped(
      RegExp(r'(\d+)(\d{3})'),
      (Match m) => '${m[1]},${m[2]}',
    );
  }
}