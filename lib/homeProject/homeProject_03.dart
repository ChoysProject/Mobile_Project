void main(){
  printOne();
  printTwo();
  printThree();
}

void printOne(){
  print("국민대학교");
}

void printThree(){
  print("모바일프로그래밍");
}

void printTwo() async {
  Future.delayed(Duration(seconds:1), (){
    print("플러터 / 다트~");
  });
  print("소프트웨어 융합 대학원");
}