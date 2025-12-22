# Ege Üniversitesi Eduroam Setup Scripti (Linux)

> ege universitesi rezaleti..

Bu script, Ege Üniversitesi öğrencileri için Linux dağıtımlarında `nmcli` (NetworkManager) kullanarak Eduroam bağlantısını otomatik olarak yapılandırır.

## Gereksinimler

*   NetworkManager (`nmcli` komutu)

## Kurulum ve Kullanım

1.  Repo'yu klonlayın veya scripti indirin.
    ```bash
    git clone https://github.com/brnakblt/eduroam_ege_linux.git && cd eduroam_ege_linux
    ```
2.  Çalıştırma izni verin:
    ```bash
    chmod +x setup_eduroam.sh
    ```
3.  Scripti çalıştırın:
    ```bash
    ./setup_eduroam.sh
    ```
5.  İstenildiğinde öğrenci numaranızı ve şifrenizi girin.

## Özellikler

*   Wi-Fi arayüzünü otomatik algılar.
*   Eski/Hatalı eduroam profillerini temizler.
*   TTLS + PAP kimlik doğrulama yöntemini kullanır.
*   Sertifika doğrulamasını devre dışı bırakır (bağlantı sorunlarını çözmek için).
*   *Kendi kafama göre oluşturduğum* hata mesajları içerir.

## Notlar

Bu script resmi bir Ege Üniversitesi yazılımı değildir. Linux kullanıcılarının yaşadığı bağlantı sorunlarını çözmek amacıyla hazırlanmıştır.
