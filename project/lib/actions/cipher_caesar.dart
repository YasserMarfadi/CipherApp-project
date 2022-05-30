class Caesar {
  static String encipher(int key, String plaintext) {
    String ciphertext = '';
    List plaintextl = plaintext.split('');

    int c;
    for (String p in plaintextl) {
      //
      c = (p.codeUnits.first + key);
      //
      ciphertext += String.fromCharCode(c);
    }

    return ciphertext;
  }

  static String decipher(int key, String ciphertext) {
    String plaintext = '';
    List ciphertextl = ciphertext.split('');
    int p;
    for (String c in ciphertextl) {
      //

      p = (c.codeUnitAt(0) - key);
      //
      plaintext += String.fromCharCode(p);
    }

    return plaintext;
  }
}
