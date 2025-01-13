class PublicMethod {
  static String convertGetApiParam(Map<String, dynamic> data) {
    String result = "";

    data.forEach((key, value) {
      if (result.isEmpty) {
        result = "?$key=${Uri.encodeComponent(value.toString())}";
      } else {
        result += "&$key=${Uri.encodeComponent(value.toString())}";
      }
    });

    return result;
  }
}