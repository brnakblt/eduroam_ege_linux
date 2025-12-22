#!/bin/bash

# Check if nmcli is installed
if ! command -v nmcli &> /dev/null;
then
    echo "Hata: 'nmcli' komutu bulunamadı."
    echo "Bu scriptin çalışması için NetworkManager gerekiyor."
    echo "Lütfen kullandığın dağıtımın paket yöneticisi ile NetworkManager'ı yükle."
    echo "arch based distrolar için 'sudo pacman -S networkmanager'" 
    echo "debian based distrolar için (ubuntu, pop_os vb.) 'sudo apt install' network-manager"
    echo "fedora, rhel based distrolar için 'sudo dnf install network-manager'"
    exit 1
fi

# Auto-detect Wi-Fi interface
INTERFACE=$(nmcli device | grep wifi | grep -v p2p | awk '{print $1}' | head -n 1)

if [ -z "$INTERFACE" ]; then
    echo "Kanka wifi kartın olduğuna emin misin?"
    echo "Yalvarırım bana hangi arayüzü kullanmam gerektiğini söyle.. (e.g., wlo1, wlan0)."
    read -p "Arayüz: " INTERFACE
else
    echo "Tespit edilen arayüzler: $INTERFACE"
fi

echo "----------------------------------------------------"
echo "Ege University Eduroam Setup (TTLS/PAP Configuration)"
echo "----------------------------------------------------"

# Get Student ID
read -p "Öğrenci kimlik numaranı gir, evet 0 ile beraber (e.g., 05230000123): " STUDENT_ID

# Construct Identity
IDENTITY="${STUDENT_ID}@ogrenci.ege.edu.tr"
echo "Sen busun artık: $IDENTITY"

# Get Password
while true; do
    echo
    read -s -p "Çok özel o şifreni gir (muhtamelen TC kimlik no): " PASSWORD
    echo
    read -s -p "Bi daha gir çünkü canım öyle istedi: " PASSWORD_VERIFY
    echo

    if [ "$PASSWORD" == "$PASSWORD_VERIFY" ]; then
        break
    else
        echo "Yalvarırım hızlı yazmaya çalışma"
    fi
done

# Clean up existing connection if it exists
if nmcli connection show eduroam >/dev/null 2>&1; then
    echo "Daha önceden oluşturulan eduroam profillerini kaldırıyorum"
    sleep 1
    echo "Çünkü neden olmasın"
    sleep 1
    nmcli connection delete eduroam
    echo "Valla kaldırdım"
fi

echo "Bağlantı oluşturuyorum bi dk..."
sleep 2
echo "."
sleep 1
echo ".."
sleep 1
echo "..."
sleep 1

# Create the connection with TTLS + PAP settings
nmcli connection add \
    type wifi \
    con-name eduroam \
    ifname "$INTERFACE" \
    ssid eduroam \
    -- \
    wifi-sec.key-mgmt wpa-eap \
    802-1x.eap ttls \
    802-1x.phase2-auth pap \
    802-1x.identity "$IDENTITY" \
    802-1x.anonymous-identity "$IDENTITY" \
    802-1x.password "$PASSWORD" \
    802-1x.system-ca-certs no

if [ $? -eq 0 ]; then
    echo "Bağlantı oluşturuldu galiba..."
    sleep 1
    echo "Modemle tokalaşıyoruz..."
    sleep 1
    echo "TLS Handshake completed!"
    sleep 1
    nmcli connection up eduroam
    sleep 1
    
else
    echo "Modeme elimi uzattım elim havada kaldı..."
    echo "TLS Handshake failed"
    echo "Knk ya yapılandırma ben mezun olduktan sonra degisti ya da baska bi bok var"
    echo "Scripti kendin istediğin gibi düzenleyebilirsin"
fi

echo "Made with hate of Ege University"
