fisrtLetterCapitalizes(String text) {
  var words = text.toLowerCase();
  for (var i = 0; i < words.length; i++) {
    var letterUpperCase = words[0].toUpperCase();
    words = words.replaceAll(words[0], letterUpperCase);
  }
  return words;
}
