String encipher(int m, int key, String plaintext) {
  String ciphertext = '';
  List plaintextl = plaintext.split('');

  int c;
  for (String p in plaintextl) {
    //
    //c = ((m * p.codeUnitAt(0)  ) + key);
    c = ((m * p.codeUnits.first) + key);
    //
    ciphertext += String.fromCharCode(c);
  }

  return ciphertext;
}

String decipher(int m, int key, String ciphertext) {
  String plaintext = '';
  List ciphertextl = ciphertext.split('');
  int p;
  for (String c in ciphertextl) {
    //
    double x = 1 / m; // المعكوس الضربي
    p = (x * (c.codeUnitAt(0) - key)).round();
    //
    plaintext += String.fromCharCode(p);
  }

  return plaintext;
}
