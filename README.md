# ForgeMiner-docker
literally just a docker wrapper around https://github.com/0xHashRaptor/ForgeMiner

---

## example compose
```yml
services:
  SRBMiner:
    container_name: SRBMiner
    image: ghcr.io/dablincx/srbminer-docker:latest
    restart: unless-stopped
    tty: true
    mem_limit: 2g
    gpus: all
    environment:
      ALGO: verushash
      POOL_ADDRESS: stratum+tcp://na.luckpool.net:3956#xnsub
      WALLET_USER: RRmpZ1tajCXVG9999LWUD4CPVyZvjpe3iZ
      WORKER: Saturn
      # PASSWORD: x
      EXTRAS: --disable-cpu
    logging:
      driver: "json-file"
      options:
        max-size: "10m"
        max-file: "3"
```

## env vars

| Variable        | Description              | Example                                      |
|----------------|--------------------------|----------------------------------------------|
| `ALGO`         | Mining algorithm         | `verushash`                                  |
| `POOL_ADDRESS` | Mining pool address      | `stratum+tcp://na.luckpool.net:3956#xnsub`    |
| `WALLET_USER`  | Wallet address or user   | `RRmpZ1tajCXVG9999LWUD4CPVyZvjpe3iZ`           |
| `WORKER`       | Worker name              | `Saturn`                                     |
| `PASSWORD`     | Pool password (optional) | `x`                                          |
| `EXTRAS`       | Extra SRBMiner flags     | `-t 4`                                       |
