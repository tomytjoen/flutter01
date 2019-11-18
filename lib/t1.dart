/*
masukkan pin
123, 1234 atau 1357
*/
import 'dart:io';

void main() {
  // define variabel awal/default
  bool runningaplikasi = true;
  String namauser = '';
  int saldouser = 0;
  int indexdata=0;

  // inisialisasi user
  List userakses = [
    ['Tomy', 10000, '123'],
    ['Tjoen', 500, '1234'],
    ['Dwi', 100, '1357'] 
  ];

  while(runningaplikasi == true)
  {
    if(namauser == '')
    {
      // Kalau Nama tidak ada maka munculkan login
      print('Masuk');
      stdout.write('PIN : '); 
      String pinCode = stdin.readLineSync().trim();
      // Masukan pin
      // Cari PIN dari variabel array
      if(pinCode == '') continue;
      for (int i = 0; i < userakses.length; i++)
      {
        var pinuser=userakses[i][2];
        if(pinuser == pinCode)
        {
          // kalau ketemu maka isi nama, saldonya dan ambil index
          namauser=userakses[i][0];
          saldouser=userakses[i][1];
          indexdata=i;
          break;
        }
      }
      continue;
    }
    else
    {
      menuUtama(namauser);
      stdout.write('Pilihan : '); 
      String jawab = stdin.readLineSync().trim();

      if(jawab == '') continue;
      
      switch (int.parse(jawab))
      {
        case 1:
          print('Tarik Tunai');
          stdout.write('Nominal : '); 
          int nominal = int.parse(stdin.readLineSync());
          // mengurangi saldo
          if((saldouser-nominal) < 0)
          {
            print('Saldo tidak mencukupi !');
          }
          else
          {
            // update saldo dari index id
            saldouser=saldouser-nominal;
            userakses[indexdata][1]=saldouser;
          }
          continue;
          break;
        case 2:
          print('Setor Tunai');
          stdout.write('Nominal : '); 
          int nominal = int.parse(stdin.readLineSync());
          // menambah saldo
          // update saldo dari index id
          saldouser=saldouser+nominal;
          userakses[indexdata][1]=saldouser;
          continue;
          break;
        case 3:
          // menampilkan saldo
          print('Cek Saldo');
          print(saldouser);
          break;
        case 4:
          // ke login dengan mengosongkan nama
          namauser='';
          continue;
          break;
        default:
          // keluar aplikasi dgn jadikan false
          runningaplikasi=false;
          break;
      }
    }
  }
}
void menuUtama(String namauser)
{
  print('');
  print('----------------------------');
  print('Selamat Datang $namauser!');
  print('1 = Tarik Tunai');
  print('2 = Setor Tunai');
  print('3 = Cek Saldo');
  print('4 = Ganti Akun');
  print('5 = Keluar Aplikasi');
}