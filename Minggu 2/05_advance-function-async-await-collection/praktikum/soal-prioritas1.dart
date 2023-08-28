


Future<List<int>> fungsiList (List<int> data, int pengali) async{
  List<int> ListBaru = [];
    for(int i=0;i< data.length;i++){
     await Future.delayed(Duration(seconds: 1), (){
      ListBaru.add(data[i] * pengali);
      print("Data ditambahkan dalam list baru : ${ListBaru[i]}");
     });
    }
  return ListBaru;
}

void main() async{
  List<int> data = [10, 16, 70, 80];

  int pengali = 2;
  List<int> ListBaru = await fungsiList(data,pengali);
  print(data);
  print(ListBaru);
}