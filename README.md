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

# Tugas 9
1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?

Saat mengambil data JSON, kita menerima data dengan format Map<String, dynamic>. Sebenarnya bisa saja jika ingin langsung memetakan hal tersebut. Namun, dengan menggunakan model, akan lebih mudah dalam mengakses data. Contohnya dengan membungkusnya dalam objek User user, maka kita bisa mengakses username dengan user.username dan bisa mendapatkan auto-completion dari IDE sehingga risiko runtime error menjadi lebih kecil. 

Tanpa model, validasi tipe menjadi manual dan rawan error. Contohnya, ketika ingin mendapatkan username dari user, diperlukan pengecekan untuk setiap pemanggilan seperti data['username'] == String ? .. hal tersebut juga berlaku untuk null safety seperti data['pfp'] != null ? .. Sedangkan apabila menggunakan model, cukup didefinisikan sekali saja, dan compiler akan memaksa kita untuk menangani dengan tepat

Sedangkan dari segi maintanability, jika suatu saat API mengubah satu key (misalnya tanggal_lahir menjadi tanggalLahir), maka perlu dilakukan penyesuaian pada semua bagian proyek yang memanggil data dengan key lama. Sedangkan dengan menggunakan model, cukup ubah pada satu tempat di bagian model, sehingga seluruh bagian proyek tetap aman, karena hanya mengakses atribut model, bukan key secara langsung

2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.

Dalam tugas ini, package http berfungsi sebagai fondasi dasar yang memungkinkan aplikasi Flutter berkomunikasi dengan server Django melalui jaringan. Perannya adalah menyediakan alat-alat fundamental untuk mengirim permintaan (request) dan menerima tanggapan (response) HTTP. Package ini digunakan untuk setiap interaksi dengan backend, seperti mengirimkan data registrasi dan login (biasanya dengan POST), serta mengambil daftar item (biasanya dengan GET). Namun, package http ini bersifat stateless; ia tidak "mengingat" apa pun tentang permintaan sebelumnya, sehingga setiap permintaan dianggap sebagai transaksi baru yang terisolasi.

Di sinilah CookieRequest (sebagai class kustom) mengambil peran krusial. Karena tugas tersebut melibatkan autentikasi dan pemfilteran item berdasarkan pengguna yang login, developer memerlukan cara untuk mempertahankan status login (sesi) di antara permintaan. Saat seorang pengguna login ke Django, server akan mengirim kembali cookie sesi. Peran CookieRequest adalah sebagai manajer sesi yang "membungkus" package http. Ia secara otomatis menyimpan cookie ini setelah login berhasil dan melampirkannya secara otomatis ke setiap permintaan berikutnya (seperti saat mengambil daftar item yang terfilter).

Secara singkat, perbedaan utamanya adalah: http merupakan eksekutor permintaan individual yang tidak memiliki memori (stateless). Sebaliknya, CookieRequest adalah manajer sesi (stateful) yang menggunakan http untuk memastikan bahwa setiap permintaan ke server membawa "tanda pengenal" (cookie) yang benar. Tanpa CookieRequest, server Django tidak akan tahu siapa pengguna yang sedang membuat permintaan saat ia mencoba mengambil item yang terfilter, dan akan menganggap pengguna tersebut sebagai pengguna anonim.


3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

Instance CookieRequest perlu dibagikan ke seluruh komponen aplikasi, karena ia menyimpan state, yaitu cookie sesi yang didapatkan setelah login. Jika setiap halaman (misalnya, Halaman Login dan Halaman Dashboard) membuat instance CookieRequest-nya sendiri, maka "kunci" yang didapat oleh instance di Halaman Login tidak akan dimiliki oleh instance di Halaman Dashboard. Instance di Halaman Dashboard akan menjadi instance baru yang "kosong" (tidak memiliki cookie).

Akibatnya, ketika instance baru tersebut mencoba mengambil data, server akan menolaknya karena permintaan tersebut tidak menyertakan cookie autentikasi. Dengan menggunakan satu instance yang sama yang dibagikan ke seluruh aplikasi (umumnya menggunakan state management seperti Provider), semua bagian aplikasi dipastikan menggunakan "kunci" yang sama dan sesi autentikasi pengguna tetap terjaga secara konsisten.

4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

Konfigurasi konektivitas antara Flutter dan Django memerlukan pengaturan penting di kedua sisi, server dan klien. Pertama, di sisi server Django, 10.0.2.2 perlu ditambahkan ke dalam daftar ALLOWED_HOSTS. Ini karena emulator Android berjalan sebagai perangkat virtual yang terisolasi; localhost (atau 127.0.0.1) di dalam emulator merujuk ke emulator itu sendiri, bukan ke laptop (mesin host) tempat server Django berjalan. Alamat 10.0.2.2 adalah "jembatan" IP khusus yang disediakan oleh emulator Android untuk mengakses localhost di mesin host. Jika alamat ini tidak ditambahkan, fitur keamanan Django akan menolak koneksi dari emulator, yang akan mengakibatkan error "DisallowedHost" saat aplikasi Flutter mencoba terhubung.

Selanjutnya, pengaktifan CORS (Cross-Origin Resource Sharing) dan pengaturan cookie SameSite, terutama untuk aplikasi Flutter Web. Secara default, kebijakan keamanan browser melarang sebuah website di satu domain (aplikasi Flutter Anda) untuk meminta data dari website di domain lain (server Django Anda). Mengaktifkan CORS di Django adalah cara server memberi tahu browser bahwa permintaan lintas domain tersebut aman dan diizinkan. Jika CORS tidak diaktifkan, browser akan memblokir permintaan dan menampilkan CORS Error. Serupa dengan itu, pengaturan SameSite pada cookie menentukan apakah browser akan mengirimkan cookie (seperti sessionid) dalam permintaan lintas domain. Jika pengaturannya salah, browser akan menahan pengiriman cookie, sehingga Django akan menerima permintaan tetapi menganggap pengguna belum login.

Terakhir, di sisi aplikasi mobile Flutter, izin akses internet (android.permission.INTERNET) harus ditambahkan secara eksplisit di file AndroidManifest.xml (untuk Android). Aplikasi mobile secara default berjalan di sandbox (lingkungan terisolasi) dan tidak memiliki izin untuk mengakses jaringan. Izin ini adalah permintaan resmi kepada sistem operasi Android untuk mengizinkan aplikasi membuat koneksi jaringan. Jika izin ini tidak ditambahkan, sistem operasi Android akan langsung memblokir semua upaya koneksi. Akibatnya, aplikasi Flutter bahkan tidak akan bisa mengirim permintaannya dan akan gagal dengan error jaringan level rendah, seperti SocketException.

5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

Diawali ketika pengguna memasukkan data pada widget input di Flutter. Saat tombol "simpan" ditekan, data tersebut diformat menjadi objek Dart Map dan diserialisasi menjadi String JSON menggunakan jsonEncode. Permintaan POST kemudian dikirim oleh CookieRequest, yang menyertakan string JSON di dalam body dan menlampirkan cookie di sisi header

Setelah itu, server Django akan menerima permintaan, lalu middleware-nya membaca cookie untuk mengidentifikasi pengguna (request.user). View Django kemudian melakukan deserialisasi (mem-parsing) string JSON di body kembali menjadi struktur data Python (misalnya, dictionary). Data ini diproses dan disimpan ke database.

Setelah berhasil disimpan, Django mengirimkan respons HTTP (misalnya, 200 OK) yang sering kali berisi data yang baru dibuat dalam format JSON. Aplikasi Flutter menerima JSON respons ini, melakukan deserialisasi (jsonDecode) kembali menjadi Map, dan mengubah Map tersebut menjadi objek model Dart (misalnya, Item.fromJson(data)). Objek Dart baru ini kemudian ditambahkan ke state aplikasi, yang memicu widget UI (seperti ListView) untuk di-render ulang (rebuild) dan menampilkan data baru tersebut di layar.

6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

Mekanisme autentikasi dimulai dengan proses registrasi, di mana pengguna memasukkan data di aplikasi Flutter. Data ini kemudian dikirim sebagai body JSON melalui permintaan POST ke endpoint register di Django. Di server, Django memvalidasi data ini dan membuat record User baru di database (misalnya, menggunakan User.objects.create_user), namun pengguna tidak secara otomatis login ke aplikasi. Setelah akun berhasil dibuat, Django mengirimkan respons sukses, dan aplikasi Flutter biasanya akan mengarahkan pengguna ke halaman login.

Selanjutnya, pengguna memasukkan kredensial (username dan password) di Flutter untuk melakukan login, yang kembali dikirim melalui POST ke endpoint login. Django menerima data ini dan menggunakan fungsi authenticate() untuk memverifikasi kecocokannya dengan database. Jika berhasil, Django akan memanggil fungsi login(request, user). Langkah ini membuat session record baru di tabel django_session database dan menghasilkan sessionid unik. sessionid ini kemudian dikirim kembali ke Flutter melalui header respons Set-Cookie. Klien HTTP di Flutter (seperti CookieRequest) akan "menangkap" dan menyimpan sessionid ini. Setelah berhasil, Flutter mengubah statusnya menjadi login dan menampilkan halaman menu utama. Sejak saat itu, setiap permintaan Flutter ke Django akan secara otomatis melampirkan sessionid ini di header Cookie, memungkinkan Django untuk mengidentifikasi pengguna.

Terakhir, proses logout berfungsi untuk menghancurkan sesi yang aktif. Saat pengguna menekan tombol "Logout" di Flutter, aplikasi mengirimkan permintaan POST ke endpoint logout (lengkap dengan sessionid yang tersimpan). Django menerima permintaan ini, mengidentifikasi sesi berdasarkan sessionid, dan memanggil fungsi logout(request). Tindakan ini secara efektif menghapus session record dari database django_session. Django kemudian mengirim respons yang menginstruksikan klien untuk menghapus cookie-nya. Di sisi Flutter, CookieRequest akan menghapus sessionid yang disimpannya, status aplikasi kembali menjadi logout, dan pengguna diarahkan kembali ke halaman login.

7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).