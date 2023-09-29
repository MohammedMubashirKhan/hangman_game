List<String> alphabets = List<String>.generate(26, (index) {
  // ASCII value for 'A' is 65, so add the index to it to get the corresponding alphabet.
  int asciiValue = 'A'.codeUnitAt(0) + index;
  // Convert the ASCII value to a character and add it to the list.
  return String.fromCharCode(asciiValue);
});
