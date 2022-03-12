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
