# Tugas 7

1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
Widget tree adalah susunan hierarki dari seluruh elemen yang membentuk tampilan aplikasi. Setiap tampilan di Flutter terdiri dari kumpulan widget yang saling bertumpuk dan berhubungan seperti pohon, di mana widget yang lebih besar berperan sebagai induk (parent) dan yang ada di dalamnya sebagai anak (child). Flutter membaca tree ini dari atas ke bawah untuk membangun tampilan di layar.

Pada proyek saya, Scaffold menjadi widget induk yang menampung AppBar dan Body. Di dalam Body, terdapat Column, Center, dan GridView yang berisi beberapa ItemCard. Setiap ItemCard juga memiliki Icon dan Text sebagai child-nya. Struktur ini membuat setiap bagian halaman dapat diatur dengan jelas sesuai peran masing-masing.

Hubungan parent–child ini memungkinkan saya mengatur tata letak dengan efisien. Misalnya, Column menyusun elemen secara vertikal, sementara GridView menampilkan item dalam tiga kolom secara rapi. Dengan begitu, tampilan menjadi terstruktur dan mudah dikembangkan.

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
Dalam proyek ini, saya menggunakan beberapa widget utama seperti MaterialApp, Scaffold, AppBar, Column, Padding, GridView, Container, Icon, Text, InkWell, dan SnackBar. MaterialApp saya gunakan sebagai root widget untuk mengaktifkan tema Material Design dan mengatur halaman awal aplikasi. Scaffold menjadi kerangka utama halaman yang menampung AppBar di bagian atas dan isi halaman di bagian body.

AppBar menampilkan judul “Toko Sepakbola Jaya Abadi”, sedangkan Column saya pakai untuk menyusun teks sambutan dan grid produk secara vertikal. Widget GridView.count menampilkan tiga ItemCard dalam satu baris, dan masing-masing ItemCard berisi Icon serta Text yang saya bungkus dengan Material dan InkWell agar dapat ditekan.

Saat ItemCard ditekan, InkWell menampilkan pesan menggunakan SnackBar untuk memberikan respon visual kepada pengguna. Kombinasi semua widget ini menghasilkan tampilan yang sederhana namun tetap interaktif.

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
MaterialApp berfungsi sebagai pembungkus utama aplikasi yang mengatur tema, warna, navigasi, dan halaman awal. Dengan menggunakan MaterialApp, saya bisa memastikan seluruh widget di dalamnya mengikuti gaya Material Design, seperti efek sentuh, transisi halaman, dan penggunaan warna tema.

Widget ini penting sebagai root karena banyak widget lain seperti Scaffold, AppBar, dan SnackBar membutuhkan konteks dari MaterialApp agar bisa berfungsi dengan benar. Tanpa itu, elemen-elemen berbasis Material Design tidak akan tampil sebagaimana mestinya.

Pada proyek ini, MaterialApp menjadi fondasi yang membuat halaman utama MyHomePage dapat berjalan dengan baik serta mempertahankan tampilan yang konsisten di seluruh aplikasi.

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
StatelessWidget digunakan ketika tampilan tidak bergantung pada perubahan data, sedangkan StatefulWidget digunakan saat ada data atau interaksi yang bisa mengubah tampilan. Perbedaan utamanya terletak pada ada atau tidaknya state yang dapat diperbarui selama aplikasi berjalan.

Dalam proyek saya, saya menggunakan StatelessWidget untuk MyHomePage dan ItemCard karena konten di dalamnya bersifat statis — teks, ikon, dan warnanya tidak berubah. Semua informasi sudah ditentukan sejak awal dan tidak diperbarui ketika pengguna berinteraksi.

Namun, jika nanti saya menambahkan fitur seperti menambah produk atau memperbarui daftar item secara dinamis, saya akan mengganti menjadi StatefulWidget agar bisa menyimpan dan mengubah data dengan lebih fleksibel.

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
BuildContext adalah objek yang menunjukkan posisi widget di dalam widget tree dan memungkinkan widget mengakses data atau fungsi dari widget di atasnya. Setiap kali Flutter memanggil metode build(), konteks ini diberikan agar widget tahu di mana ia berada dalam struktur UI.

Dalam proyek saya, BuildContext digunakan di bagian ScaffoldMessenger.of(context) untuk menampilkan SnackBar ketika pengguna menekan sebuah kartu. Dengan konteks tersebut, SnackBar bisa muncul di halaman yang benar karena tahu letak widget Scaffold yang aktif.

Selain itu, BuildContext juga bisa digunakan untuk mengambil tema atau melakukan navigasi antarhalaman. Tanpa konteks ini, widget tidak dapat berinteraksi dengan elemen lain di luar dirinya.

6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
Hot reload adalah fitur Flutter yang memperbarui tampilan aplikasi tanpa kehilangan state. Saat saya mengubah teks, warna, atau tata letak di kode, saya cukup melakukan hot reload dan perubahan langsung muncul di emulator atau perangkat tanpa harus memulai ulang aplikasi.

Sementara itu, hot restart menjalankan ulang seluruh aplikasi dari awal, sehingga semua data sementara atau state akan hilang. Flutter membangun ulang widget tree dari nol seperti saat pertama kali dijalankan.

Dalam proses pengembangan proyek ini, saya lebih sering menggunakan hot reload untuk mempercepat percobaan desain dan layout. Namun, ketika saya mengubah struktur utama aplikasi seperti variabel global atau konstruktor, saya menggunakan hot restart agar semua perubahan terinisialisasi ulang.

# Tugas 8

1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
Navigator.push() dan Navigator.pushReplacement(), sama-sama berfungsi untuk mengalihkan halaman pengguna ke halaman lain yang dituju (route). Perbedaannya, pada Navigator.push() halaman akan dialihkan ke halaman baru yang baru ditambahkan di atas halaman sebelumnya (ditambahkan ke stack), sehingga halaman awal tetap disimpan, dan pengguna dapat kembali mengakses halaman sebelumnya (dengan menekan tombol back). Navigator.push() cocok digunakan ketika kita ingin pengguna dapat kembali ke halaman sebelumnya. Pada kode saya, saya menggunakannya sebagai navigasi dari home ke form tambah produk. Hal ini agar pengguna dapat membatalkan aksi dengan mudah 

Sedangkan, Navigator.pushReplacement() mengganti halaman awal menjadi halaman baru, sehingga halaman awal tidak tersimpan (halaman awal dihapus dari stack), dan pengguna tidak dapat mengakses halaman sebelumnya. Cocok digunakan ketika kita ingin pengguna tidak perlu mengakses halaman sebelumnya karena sudah tidak relevan/tidak diperlukan. Pada kode saya, saya menggunakannya pada halaman home page, karena pada halaman home page sudah ada navigasi lengkap yang dapat membantu pengguna, serta menghindari kemungkinan pengguna kembali ke halaman login (jika nanti ada)

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
Hierarki widget seperti Scaffold, AppBar, dan Drawer dimanfaatkan untuk membangun kerangka halaman yang seragam di seluruh tampilan. Scaffold berfungsi sebagai struktur utama yang menampung elemen penting seperti AppBar di bagian atas dan Drawer di sisi kiri. Dengan begitu, setiap halaman memiliki tata letak dasar yang sama, membuat pengalaman pengguna terasa konsisten dan navigasi menjadi mudah dikenali.

Sementara itu, AppBar digunakan untuk menampilkan judul halaman atau ikon aksi seperti keranjang dan profil, sedangkan Drawer berfungsi sebagai menu navigasi global menuju halaman seperti Home, Cart, dan Profile. Pendekatan ini memungkinkan perubahan desain global (seperti warna tema atau tata letak menu) diterapkan sekali saja di seluruh aplikasi, tanpa perlu mengatur ulang tiap halaman satu per satu.

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
Dengan menggunakan padding, tampilan menjadi lebih rapi sehingga meningkatkan keterbacaan. Tanpa padding, maka tampilan form akan terlalu menempel dengan sisi sehingga terlihat kurang mengenakkan dan tidak profesional. Contohnya pada kode saya, adalah menggunakan widget Padding untuk setiap field input sehingga setiap field memiliki jarak di dalamnya dan string input tidak menempel pada sisi field.

SingleChildScrollView berfungsi untuk membuat konten dapat di-scroll apabila tinggi nya melebihi layar. Pada kode saya, Jika tidak menggunakan SingleChildScrollView, maka konten tidak dapat discroll, sehingga bagian bawah konten tidak dapat terlihat oleh user. Selain itu, ketika keyboard muncul, bagian form juga tetap dapat di-scroll

ListView berfungsi mirip seperti SingleChildScrollView, namun lebih efisien ketika ditujukan untuk banyak konten yang ingin ditampilkan, karena ListView hanya memproses bagian yang muncul di layar. Pada kode saya, belum ada implementasi ListView, karena belum diperlukan (saat ini belum menampilkan banyak produk)

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Langkah pertama adalah dengan menentukan color brand yang diinginkan, lalu mengatur Material App yang ada pada file main.dart yang digunakan sebagai base, sehingga dapat diimplementasikan pada semua bagian halaman.