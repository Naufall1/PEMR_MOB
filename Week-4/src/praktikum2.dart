void main() {
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print(halogens);

  var names1 = <String>{};
  Set<String> names2 = {}; // This works, too.

  names1.add('2241720214');
  names1.add('Muhammad Naufal Kurniawan');

  names2.addAll({'2241720214', ' Muhammad Naufal Kurniawan'});

  print(names1);
  print(names2);
}