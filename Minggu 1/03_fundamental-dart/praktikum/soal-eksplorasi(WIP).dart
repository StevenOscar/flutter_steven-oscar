/*
SOAL : 

1. Buatlah sebuah program untuk mengecek apakah sebuah kata merupakan sebuah palindrom atau bukan. Palindrom adalah sebuah kata yang jika dibalik dari kata aslinya memiliki cara baca atau susunan yang sama persis.
2. Buatlah sebuah program untuk mencari faktor dari sebuah bilangan yang dimasukkan.

*/

void cekPalindrom(String kata){
    int wordlength;
    
    bool isPalindrom = false;
    String katadibalik = '';
    
    wordlength = kata.length;

    for(int i = 0;i<wordlength;i++){
      katadibalik += kata[wordlength - i -1];
      if(katadibalik == kata){
        isPalindrom = true;
      }
    }

    if(isPalindrom==true){
      print("kata $kata jika dibalik adalah $katadibalik sehingga kata ini merupakan kata palindrom.");
      } else {
      print("kata $kata jika dibalik adalah $katadibalik sehingga kata ini bukan palindrom karena ketika dibalik cara membacanya menjadi berbeda.");
    };
}

void faktor(int angka){
  for (var i = 1; i <= angka; i++) {
    if(angka%(i) == 0){
      print(i);
    }
  }
}


void main() {
  String kata= "kasur rusak";
  String kata2 = "mobil balap";
  int angka = 24;

  cekPalindrom(kata);
  cekPalindrom(kata2);

  faktor(angka);
}