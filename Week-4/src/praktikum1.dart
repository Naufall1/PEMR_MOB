void main() {
  final list = ['Muhammad Naufal Kurniawan', '2241720214', 1, 2, 3];
  assert(list.length == 5);
  assert(list[1] == 2);
  print(list.length);
  print(list[1]);

  list[1] = 1;
  assert(list[1] == 1);
  print(list[1]);
}