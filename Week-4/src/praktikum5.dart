void main(){
  var record = ('first', a: 2, b: true, 'last');
  print(record);

  var record1 = (18, 28);
  print(record1);
  record1 = tukar(record1);
  print(record1);

  // Record type annotation in a variable declaration:
  (String, int) mahasiswa = ('Muhammad Naufal Kurniawan', 2241720214);
  print(mahasiswa);

  var mahasiswa2 = ('first', a: 2241720214, b: 'Muhammad Naufal Kurniawan', 'last');

  print(mahasiswa2.$1); // Prints 'first'
  print(mahasiswa2.a); // Prints 2
  print(mahasiswa2.b); // Prints true
  print(mahasiswa2.$2); // Prints 'last'
}

(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}