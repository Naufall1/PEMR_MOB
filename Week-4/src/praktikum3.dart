void main() {
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 2,
  };

  var mhs1 = Map<String, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  var mhs2 = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  gifts['nim'] = '2241720214';
  gifts['nama'] = 'Muhammad Naufal Kurniawan';

  nobleGases[18] = '2241720214';
  nobleGases[28] = 'Muhammad Naufal Kurniawan';

  mhs1['nim'] = '2241720214';
  mhs1['nama'] = 'Muhammad Naufal Kurniawan';

  mhs2[18] = '2241720214';
  mhs2[28] = 'Muhammad Naufal Kurniawan';
  
  print(gifts);
  print(nobleGases);
  print(mhs1);
  print(mhs2);
}