# Summary/Resume Minggu 1 (Basic Version and Branch Management(git))

## Poin Pertama

Pertemuan pada Minggu 1 pertemuan 2 membahas tentang dasar-dasar penggunaan git dalam upaya mengatur versi source code dalam suatu program. sehingga memungkinkan kolaborator untuk bekerja bersama dalam pengembangan software dan melacak history perubahan dengan mudah dan efisien.

Git memiliki beberapa tahapan, yaitu :

- Working Directory
- Staging Area
- Remote Repository

## Poin Kedua

Rangkuman command-command git :

- Git init: Command ini digunakan untuk menginisialisasi repositori Git baru dalam directory project. Command ini akan membuat folder .git yang diperlukan untuk menjalankan perintah git serta mengatur versioning.
- Git status: Command ini memberikan gambaran tentang status perubahan dalam Working Directory. Command ini menampilkan file yang telah dimodifikasi, ditambahkan, atau dihapus, serta file yang siap di-commit atau belum.
- Git add: Dengan command ini, kita dapat menambahkan perubahan dalam file tertentu ke dalam staging area. Staging area adalah langkah persiapan sebelum melakukan commit.
- Git commit: Command ini digunakan untuk membuat commit, yaitu menyimpan perubahan yang ada di staging area ke dalam history repository. Setiap commit memiliki pesan yang menjelaskan perubahan yang dilakukan.
- Git diff: Command ini membandingkan perbedaan antara perubahan yang belum di-staging dan yang sudah di-staging.
- Git stash: Command ini digunakan untuk menyimpan perubahan yang belum di-commit untuk sementara.
- Gitignore: File .gitignore berisi daftar file dan directory yang harus diabaikan oleh Git, sehingga dapat menghindari file yang tidak diperlukan dalam repository.
- Git log: Command ini menampilkan history commit dalam repository. Berisi informasi tentang penulis commit, waktu, dan pesan commit.
- Git checkout: Command ini digunakan untuk berpindah ke Branch lain atau commit tertentu dalam log history.
- Git reset: Command ini digunakan untuk membatalkan perubahan yang ada di staging area, mengembalikannya ke Working Directory.
- Git fetch: Command ini mengambil perubahan dari repository remote tanpa langsung menggabungkannya.
- Git pull: Command ini mengambil perubahan terbaru dari repository remote dan langsung menggabungkannya dengan local branch yang sedang aktif.
- Git branch: Command ini menampilkan daftar branch dalam repository. Command ini juga dapat membuat dan menghapus branch.
- Git merge: Command ini digunakan untuk menggabungkan perubahan dari satu branch ke branch lainnya.

## Poin Ketiga

Dalam pengembangan aplikasi menggunakan git, terdapat beberapa tips yang dapat memudahkan kita dalam pengembangan aplikasi, yaitu :

1. Gunakan beberapa branch agar kolaborasi optimal
2. Gunakan Branch development dan branch lainnya untuk mengembangkan aplikasi, setelah fitur-fitur yang dibuat telah final barulah merge branch development ke branch main
3. Hapuslah branch yang telah selesai di develop agar branch tidak terlalu banyak
4. Jika terjadi conflict, maka selesaikan secara bersama dalam 1 komputer
