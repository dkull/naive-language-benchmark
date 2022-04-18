import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';

class RC4 {
  Uint8List s = Uint8List(256);
  int i = 0;
  int j = 0;

  RC4(Uint8List key) {
    for (var i = 0; i < 256; i++) {
      s[i] = i;
    }

    var j = 0;
    for (var i = 0; i < 256; i++) {
      j = (j + s[i] + key[i % key.length]) % 256;

      var tmp = s[j];
      s[j] = s[i];
      s[i] = tmp;
    }
  }

  int get_byte() {
    i = (i + 1) % 256;
    j = (j + s[i]) % 256;

    var tmp = s[j];
    s[j] = s[i];
    s[i] = tmp;

    var idx = (s[i] + s[j]) % 256;
    return s[idx];
  }
}

void main() {
  var sw = Stopwatch()..start();
  var key = Uint8List.fromList(ascii.encode("Keyfobsrulethebestofall"));
  var rc4 = RC4(key);

  var sum = 0;
  for (var i = 0; i < 250000000; i++) {
    sum += rc4.get_byte();
  }

  var timedelta = sw.elapsed.inMilliseconds;
  stdout.write("|dart|rc4|$sum|$timedelta|");
}
