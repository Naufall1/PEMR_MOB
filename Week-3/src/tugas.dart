void main(){
  int max = 201;
  bool prime = true;

  for (var i = 2; i < max; i++) {
    for (var j = 2; j < i; j++) {
      if (i % j == 0) {
        prime = false;
        break;
      }
    }
    if (prime) print('[$i] is prime number [ Muhammad Naufal Kurniawan - 2241720214 ]');
    prime = true;
  }
}