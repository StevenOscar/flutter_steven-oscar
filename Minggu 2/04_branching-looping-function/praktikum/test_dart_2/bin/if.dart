void main(List<String> args) {
  var usia = 18;
  if (usia >20){
    print("remaja");
  } else {
    print("tidak memiliki golongan");
  }

  usia = 38;
  if (usia <20){
    print("remaja");
  } else if(usia<40){
      print("dewasa");
    } else {
        print("tidak memiliki golongan");
    }
}