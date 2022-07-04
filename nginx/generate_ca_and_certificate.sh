openssl req -newkey rsa:2048 -nodes -keyout ca.key -x509 -days 365 -out ca.crt -subj "/C=FR/ST=Occitanie/L=Toulouse/O=EPITA/OU=NET2/CN=NET2"
openssl genrsa -out net2.example.org.key 2048
openssl req -new -key net2.example.org.key -out net2.example.org.csr -subj "/C=FR/ST=Occitanie/L=Toulouse/O=EPITA/OU=NET2/CN=net2.example.org"
cat <<EOF > net2.example.org.ext
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, keyEncipherment
subjectAltName = @alt_names

[alt_names]
DNS.1 = net2.example.org
DNS.2 = *.net2.example.org
EOF

openssl x509 -req -in net2.example.org.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out net2.example.org.crt -days 365 -sha256 -extfile net2.example.org.ext
rm *.csr *.ext
