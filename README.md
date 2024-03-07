Saya memilih mengimplementasikan tugas yang diberikan, yakni

- Membuat minimal 1 (satu) objek baru di dalam permainan yang dilengkapi dengan animasi menggunakan spritesheet selain yang disediakan tutorial. Silakan cari spritesheet animasi di beberapa koleksi aset gratis seperti Kenney.
Pada bagian ini, saya telah menerapkannya pada Level 2
- Membuat minimal 1 (satu) audio untuk efek suara (SFX) dan memasukkannya ke dalam permainan. Kamu dapat membuatnya sendiri atau mencari dari koleksi aset gratis.
Pada bagian ini, saya membuat sendiri efek seperti Walk (walk.wav), Jump (jump.wav)
- Membuat minimal 1 (satu) musik latar (background music) dan memasukkannya ke dalam permainan. Kamu dapat membuatnya sendiri atau mencari dari koleksi aset gratis.
Pada bagian ini, saya membuat sendiri background music yang bernama backgroundmusic.wav
- Implementasikan interaksi antara objek baru tersebut dengan objek yang dikendalikan pemain. Misalnya, pemain dapat menciptakan atau menghilangkan objek baru tersebut ketika menekan suatu tombol atau tabrakan dengan objek lain di dunia permainan.
Disini bisa membuat meteor dengan menekan tombol "END". 
- Implementasikan audio feedback dari interaksi antara objek baru dengan objek pemain. Misalnya, muncul efek suara ketika pemain tabrakan dengan objek baru.
Ini saya menerapkan dengan membuat audio hitmeteor.wav 
```
func _on_HitBox_body_entered(body):
	if str(body.get_name()) == "Meteor":
		if !$HitMeteor.playing:
			$HitMeteor.play()
```