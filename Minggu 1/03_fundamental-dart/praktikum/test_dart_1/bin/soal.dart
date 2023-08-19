void main(List<String> args) {
  var nilai1 = 3;
  var nilai2 = 5;

  var diff = 0;

  diff = nilai1 - nilai2;
  nilai1 = nilai1 - diff;
  nilai2 = nilai2 + diff;

  print(nilai1);
  print(nilai2);
}