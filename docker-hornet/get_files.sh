echo "[+] Downloading latest config files from gohornet repository..."
curl -s https://raw.githubusercontent.com/gohornet/hornet/main/config.json > config.json
curl -s https://raw.githubusercontent.com/gohornet/hornet/main/peering.json > peering.json
curl -s https://raw.githubusercontent.com/gohornet/hornet/main/profiles.json > profiles.json
echo "[+] Done..."