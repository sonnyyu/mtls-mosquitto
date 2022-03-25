# Use mtls-cert-manage generate server/client/ca certificate 

[https://github.com/sonnyyu/mtls-cert-manage](https://github.com/sonnyyu/mtls-cert-manage)

# Copy Certificate from mtls-cert-manage
```bash
cd ~/mtls-cert-manage/pki
./server.sh
./client.sh
```
# Copy Certificate from mtls-cert-manage
```bash
cd ~/mtls-cert-manage/pki/servercerts 
cp * ~/mtls-eclipse-mosquitto/certs
cd ~/mtls-cert-manage/pki/clientcerts
cp * ~/mtls-eclipse-mosquitto/certs
```
# Getting started mosquitto with certificate
```bash
cd ~/mtls-eclipse-mosquitto
docker-compose build
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
