import 'package:flutter/cupertino.dart';
import '/actions/cipher_affine.dart';
import '/actions/cipher_caesar.dart';

class CipherProvider extends ChangeNotifier {
  //
  //
  final resultController = TextEditingController();

  //
  void runEncipherTowKey(int m, int key, String plaintext) {
    resultController.text = encipher(m, key, plaintext);

    notifyListeners();
  }

  //
  //
  //int m,  key; String ciphertext;
  void runDecipherTowKey(int m, int key, String ciphertext) {
    decipher(m, key, ciphertext);

    notifyListeners();
  }

  //
  void runEncipher(int key, String plaintext) {
    resultController.text = Caesar.encipher(key, plaintext);
    notifyListeners();
  }

  //
  //
  //int m,  key; String ciphertext;
  void runDecipher(int key, String ciphertext) {
    //
    resultController.text = Caesar.decipher(key, ciphertext);

    notifyListeners();
  }
}
