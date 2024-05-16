## langka install ollama di android
- pastikan anda sudah menginstall termux di android anda
- jalankan perintah berikut untuk install git
``` shell
pkg update \
& pkg upgrade \
& pkg install git -y
```
- kemudian install ollama cukup jalankan command berikut
``` shell
git clone https://github.com/indocoding-ID/ollama-termux.git ollama \
& cd ollama \
& chmod +x setup.sh \
& bash setup.sh
```
