# PBP Proyek Akhir Semester Kelompok B-06

## Nama-nama anggota kelompok
Daffa Ilham Restupratama - 2106751013

Dipa Alhaza - 2106751543

Griselda Neysa Sadiya - 2106751392

Pantun Elfreddy Sihombing - 2106751612

Rania Maharani Narendra - 2106650222

## Deskripsi aplikasi (nama aplikasi, fungsi aplikasi, dan peran/aktor pengguna aplikasi)
### JejaKarbon
[![logo_footer](https://user-images.githubusercontent.com/87572562/199491295-5107f811-6035-4ffd-8ad9-cc6ab8bf2727.png)]()

Aplikasi yang akan dikembangkan bernama Jejakarbon. JejaKarbon adalah *environmental web application* dimana kita bisa melakukan donasi kepada perusahaan Go Green dan melakukan tracker carbon footprint yang dihasilkan oleh pengguna, khususnya tracker penggunaan transportasi. JejaKarbon akan mengembalikan jumlah perkiraan carbon footprint yang dihasilkan oleh pengguna. 

Untuk JejaKarbon, carbon footprint yang dikalkulasi berasal dari penggunaan motor, mobil, dan listrik. Penggunaan motor dan mobil dihitung berdasarkan jumlah jarak tempuh dan konsumsi BBM yang dilakukan oleh user, sedangkan listrik berdasarkan jumlah kWh perbulannya.

### Background
Carbon Footprint atau jejak karbon adalah jumlah emisi karbon dioksida yang berkaitan dengan aktivitas dari seseorang ataupun suatu objek seperti gedung, pabrik, kendaraan, dan sebagainya. Emisi tersebut adalah hasil dari pembakaran bahan bakar fosil di bidang manufaktur, pemanasan, dan transportasi. 

Banyak dampak yang muncul karena carbon footprint, seperti perubahan iklim yang bisa mengarah ke pemanasan global, polusi udara, hujan asam, mencairnya es di kutub, dan pengasaman pesisir serta laut. Jadi, emisi karbon ini sangat berdampak bagi lingkungan kita.

Tanpa kita sadari, hampir semua aktivitas yang kita lakukan menghasilkan carbon footprint, terutama dalam transportasi. menurut data dari EPA (United States Environmental Protection Agency), penyumbang terbesar dari emisi karbon dioksida pada tahun 2020 adalah sektor transportasi. Indonesia sendiri merupakan salah satu negara dengan jumlah kendaraan bermotor terbanyak di dunia. 

Untuk mengurangi dampak dari Carbon Footprint,  kita harus bekerja sama saling mengurangi Carbon Footprint yang kita hasilkan. Dengan itu, kelompok kami memilih tema carbon footprint. 

Sumber Pendukung:
[Why Is a Carbon Footprint Bad for the Environment? All You Need to Know](https://impactful.ninja/why-is-a-carbon-footprint-bad-for-the-environment/#:~:text=Our%20carbon%20footprint%20has%20a,of%20glaciers%20and%20polar%20ice)

### Manfaat Aplikasi
Dengan adanya JejaKarbon, diharapkan:
- Pengguna bisa mengetahui jumlah carbon footprint mereka, hal ini dilakukan untuk meningkatkan awareness sebanyak apa carbon footprint yang telah dihasilkan dari penggunaan transportasi ataupun listrik sehari-hari pengguna.
- Pengguna bisa melakukan donasi, membantu perusahaan penggerak go green untuk menghijaukan lingkungan.

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
- handle user login
- Daftar frequently asked questions (get)
- form faq (post)

2) Halaman input data transportasi dan perhitungan carbon footprint (**Griselda Neysa Sadiya**)
- Form input data transportasi (post)
- Perhitungan carbon footprint
menghitung carbon footprint yang dihasilkan dari motor, mobil, dan listrik. Untuk transportasi dihitung berdasarkan jarak tempuh dan konsumsi BBM yang dimasukkan oleh User, sedangkan listrik dihitung berdasarkan jumlah kWh perbulannya. 

*Note:*
    * *Kalkulator carbon dimaksudkan menghasilkan output berupa jumlah karbon yang dihasilkan dari pembuatan energi untuk motor, mobil, dan listrik.*
    * *Rumus yang digunakan pada website Jejakarbon tidak sepenuhnya benar karena terdapat kesalahan yang jika diterapkan dalam dunia nyata fatal.*
    * *Rumus perhitungan kalkulator untuk listrik benar, tetapi skalar yang digunakan tidak sesuai jika digunakan di Indonesia atau di tahun 2022. Saat ini perhitungan carbon listrik dilakukan dengan mengkalikan angka kWh dengan skalar 0.794*
    * *Rumus perhitungan kalkulator untuk listrik dan mobil tidak dapat ditemukan di Internet sehingga pada back end website disesuaikan terlebih dahulu. Saat ini perhitungan kalkulator carbon listrik kendaraan pribadi dilakukan dengan membagi jarak tempuh dengan konsumsi bensin kendaraan, lalu mengkalikannya dengan skalar 0.794*
    * *Perhitungan karbon bersifat dinamis karena bergantung pada rata-rata penggunaan karbon di suatu daerah yang harus diupdate tiap beberapa waktu*
    * *Di Indonesia sendiri, tidak terdapat data ataupun API penghasilan karbon yang sekiranya bisa digunakan untuk menghitung skalar awal yang akan digunakan di rumus*
    * *Meskipun begitu, pencarian literatur tetap dilakukan dengan daftar referensi utama sebagai berikut.*
        * *Kasper, D. (2016, October 2). Carbon Footprint Calculation. YouTube. Retrieved October 22, 2022, from https://www.youtube.com/watch?v=wWeI0c1m14Y*
        * *Carbon Footprint Calculation Formulas. IBM. (2021, March 1). Retrieved October 22, 2022, from https://www.ibm.com/docs/en/tririga/10.7?topic=calculations-carbon-footprint-calculation-formulas*
        * *Gençer, Görkem. (2022). 4 Steps to Calculate the Carbon Footprint of Your Organization. AI Multiple. Retrieved October 21, 2022 from https://research.aimultiple.com/carbon-footprint-calculation/*
    - Status penghasilan carbon footprint (get)

3) Halaman progres akun pengguna (**Daffa Ilham Restupratama**)
- Profile user (get)
- Edit profile (post)
- Daftar produksi carbon footprint yang dihasilkan (get) => dari input data transportasi
- Daftar donasi yang telah dilakukan (get) => dari form ikut donasi/pembayaran

4) Halaman penambahan project (**Dipa Alhaza**)
- Form pembukaan donasi (post)
- Daftar seluruh donasi yang terdaftar (get)

5) Halaman form ikut donasi/pembayaran (**Pantun Elfreddy Sihombing**)
- Form mengikuti donasi (post)
- Daftar donasi yang telah dilakukan user (get)

## Alur pengintegrasian dengan web service untuk terhubung dengan aplikasi web yang sudah dibuat saat Proyek Tengah Semester
1. Menambahkan dependensi HTTP dan izin akses untuk bisa mengakses internet dan melakukan pemanggilan ke web.
2. Melakukan fetch data dari url web dengan melakukan request get untuk mengambil data dari web dan menampilkannya pada aplikasi flutter, maupun request post untuk menambahkan data pada web.
3. Menerapkan widget Future Builder untuk melakukan pemanggilan backend secara asinkron.
