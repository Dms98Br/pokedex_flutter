// ignore_for_file: file_names

fisrtLetterCapitalizes(String text) {
  var words = text.toLowerCase();
  for (var i = 0; i < words.length; i++) {
    var letterUpperCase = words[0].toUpperCase();
    words = words.replaceFirst(words[0], letterUpperCase);
  }
  return words;
}
