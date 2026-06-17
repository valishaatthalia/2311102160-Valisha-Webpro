# Laporan Tugas Praktik Modul 12 & 13
**Nama:** VALISHA ATTHALIA NAURA IRFAN  
**NIM:** 2311102160  
**Mata Kuliah:** Pemrograman Web (Flutter)

## Dasar Teori

**1. Counter**  
Counter adalah sebuah fitur yang berfungsi untuk menghitung atau mencatat jumlah suatu kejadian. Pada aplikasi ini, setiap kali pengguna menekan tombol tambah (`+`), nilai counter akan bertambah satu. Nilai terbaru ini akan langsung ditampilkan di layar utama secara otomatis. Pengelolaan nilainya menggunakan `Provider` agar antarmuka dapat merender ulang angkanya secara cepat dan efisien setiap kali ada perubahan data.

**2. Notifikasi**  
Notifikasi adalah pesan pemberitahuan sistem yang ditampilkan untuk memberikan informasi secara cepat kepada pengguna. Pada aplikasi ini, fitur notifikasi diimplementasikan menggunakan *Local Notification*. Cara kerjanya: tepat setelah nilai counter berhasil ditambahkan, aplikasi akan mengirimkan instruksi ke sistem operasi Android untuk memunculkan pesan peringatan (*pop-up/heads-up*) dari bagian atas layar. Pesan tersebut berisi teks yang secara langsung menginformasikan kepada pengguna mengenai angka counter terbaru.

---

## Implementasi Kode (Sesuai Syarat Tugas)

Berikut adalah 2 potongan kode utama yang menunjukkan penerapan Provider untuk fitur *counter* dan penerapan *Local Notification*:

### 1. Potongan Kode Counter (Provider)
Kode ini menangani *State Management* untuk nilai counter. Setiap kali fungsi `increment()` dipanggil, nilai `_counter` akan bertambah, memperbarui antarmuka (UI) melalui `notifyListeners()`, dan memicu notifikasi. Pada bagian antarmuka, nilai tersebut dipanggil secara otomatis.

```dart
class CounterProvider with ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners(); // Menginstruksikan UI untuk merender ulang angka counter
    _showNotification(_counter); // Menampilkan notifikasi
  }
}
```

### 2. Potongan Kode Notifikasi (Local Notification)
Kode ini berisi fungsi khusus yang memunculkan notifikasi ke sistem operasi saat *counter* bertambah. Pengaturan `Importance.max` dan `Priority.high` digunakan agar notifikasi dapat langsung muncul sebagai *pop-up* (*heads-up notification*) ke layar pengguna.

```dart
  Future<void> _showNotification(int counterValue) async {
    // Pengaturan detail dan channel notifikasi khusus sistem Android
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'counter_channel_id',
      'Counter Channel',
      channelDescription: 'Channel for counter notification',
      importance: Importance.max, // Agar notifikasi pop-up muncul seketika
      priority: Priority.high,
      ticker: 'ticker',
      color: Colors.deepPurple,
    );
    
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    
    // Perintah untuk memunculkan notifikasinya dengan membawa data nilai counter
    await flutterLocalNotificationsPlugin.show(
      id: 0,
      title: 'Counter Update',
      body: 'Nilai counter saat ini: $counterValue',
      notificationDetails: platformChannelSpecifics,
    );
  }
```
