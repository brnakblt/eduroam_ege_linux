# Ege Üniversitesi Eduroam Setup Script (Linux)

> ege universitesi rezaleti (Linux için çözüm)

Bu script, Ege Üniversitesi öğrencileri için Linux dağıtımlarında `nmcli` (NetworkManager) kullanarak Eduroam bağlantısını otomatik olarak yapılandırır.

## Gereksinimler

*   NetworkManager (`nmcli` komutu)
*   Linux tabanlı bir işletim sistemi (Arch, Ubuntu, Fedora, vb.)
*   Wi-Fi adaptörü

## Kurulum ve Kullanım

1.  Repo'yu klonlayın veya scripti indirin.
2.  Çalıştırma izni verin:
    ```bash
    chmod +x setup_eduroam.sh
    ```
3.  Scripti çalıştırın:
    ```bash
    ./setup_eduroam.sh
    ```
4.  İstenildiğinde öğrenci numaranızı ve şifrenizi girin.

## Özellikler

*   Wi-Fi arayüzünü otomatik algılar.
*   Eski/Hatalı eduroam profillerini temizler.
*   TTLS + PAP kimlik doğrulama yöntemini kullanır.
*   Sertifika doğrulamasını devre dışı bırakır (bağlantı sorunlarını çözmek için).
*   *Öğrenci dostu* hata mesajları içerir.

## Notlar

Bu script resmi bir Ege Üniversitesi yazılımı değildir. Linux kullanıcılarının yaşadığı bağlantı sorunlarını çözmek amacıyla hazırlanmıştır.