# Build docker image (optional):
```bash
git clone https://github.com/sonnyyu/mtls-mosquitto
cd mtls-mosquitto
docker build -t mosquitto .
docker tag mosquitto sonnyyu/mosquitto
#docker login
docker push sonnyyu/mosquitto
```
# Grab it from dockerhub:
```bash
docker pull sonnyyu/mosquitto
```
# Use mtls-cert-manage generate server/client/ca certificate 

[https://github.com/sonnyyu/mtls-cert-manage](https://github.com/sonnyyu/mtls-cert-manage)

# Copy Certificate from mtls-cert-manage
```bash
cd ~/mtls-cert-manage/cert 
cp * ~/mtls-mosquitto/cert
```
# Make PEM  for mosquitto
```bash
cd ~/mtls-mosquitto/cert
openssl x509 -inform PEM -in localhost.crt > localhost.pem
```
# Getting started mosquitto with certificate
```bash
docker-compose up -d
```
# Quit 
```bash
docker-compose down 
```
# Quit and remove Volume
```bash
docker-compose down -v
```
# Test mTLS
```bash
cd ~/mtls-mosquitto/cert/
mosquitto_sub -p 8883 --cafile ca.crt --cert client1.crt --key client1.key -h 192.168.1.204 -t msg 
# Start a an other SSH session from the command line
mosquitto_pub -p 8883 --cafile ca.crt --cert client1.crt --key client1.key -h 192.168.1.204 -t msg -m "test"
```
