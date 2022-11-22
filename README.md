# jejakarbon_flutter
Proyek Tugas Akhir PBP B06

##PBP Proyek Akhir Semester Kelompok B-06

## Nama-nama anggota kelompok
Daffa Ilham Restupratama - 2106751013
Dipa Alhaza - 2106751543
Griselda Neysa Sadiya - 2106751392
Pantun Elfreddy Sihombing - 2106751612
Rania Maharani Narendra - 2106650222

## Deskripsi aplikasi (nama aplikasi, fungsi aplikasi, dan peran/aktor pengguna aplikasi)
### JejaKarbon
Aplikasi yang akan dikembangkan bernama Jejakarbon. JejaKarbon adalah *environmental web application* dimana kita bisa melakukan donasi kepada perusahaan Go Green dan melakukan tracker carbon footprint yang dihasilkan oleh pengguna, khususnya tracker penggunaan transportasi. JejaKarbon akan mengembalikan jumlah perkiraan carbon footprint yang dihasilkan oleh pengguna. 

### Role Pengguna dalam JejaKarbon
1) User nonlogin:
- Membuat akun
- melihat faq
- Melihat daftar donasi
2) User login pribadi:
- Sama seperti user nonlogin (kecuali membuat akun)
- Melakukan donasi
- bertanya pada faq
- Melihat progress akun/membuka profile
- Melakukan input data transportasi dan mendapatkan data carbon footprint  
3) User login Organisasi:
- Membuka donasi
- Melihat daftar donasi
- melihat faq dan bertanya
- Melihat progress akun/membuka profile
4) Admin:
- menjawab faq
- sama seperti user login kecuali bertanya pada faq

## Daftar fitur atau modul yang diimplementasikan beserta kontrak kinerja per anggota kelompok
1) Halaman utama, Halaman login/logout, Register, faq (**Rania Maharani Narendra**)
handle user login
- Daftar frequently asked questions (get)
- form faq (post)
2) Halaman input data transportasi dan perhitungan carbon footprint (**Griselda Neysa Sadiya**)
- Form input data transportasi (post)
- Perhitungan carbon footprint 
- Status penghasilan carbon footprint (get)
3) Halaman progres akun pengguna (**Daffa Ilham Restupratama**)
- Profile user (get)
- Edit profile (post)
- Status penghasilan carbon footprint (get) => dari input data transportasi
- Daftar donasi yang telah dilakukan (get) => dari form ikut donasi/pembayaran
4) Halaman penambahan project (**Dipa Alhaza**)
- Form pembukaan donasi (post)
- Daftar seluruh donasi yang terdaftar (get)
5) Halaman form ikut donasi/pembayaran (**Pantun Elfreddy Sihombing**)
- Form mengikuti donasi (post)
- Daftar donasi yang telah dilakukan user (get)

## Alur pengintegrasian dengan web service untuk terhubung dengan aplikasi web yang sudah dibuat saat Proyek Tengah Semester
