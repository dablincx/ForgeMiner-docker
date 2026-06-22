# ForgeMiner-docker
literally just a docker wrapper around https://github.com/0xHashRaptor/ForgeMiner

---

## example compose
```yml
services:
  ForgeMiner:
    container_name: ForgeMiner
    image: ghcr.io/dablincx/forgeminer-docker:latest
    restart: unless-stopped
    tty: true
    mem_limit: 2g
    gpus: all
    environment:
      ALGO: pearlhash
      POOL_ADDRESS: prl.kryptex.network:7048
      WALLET_USER: prl1p6mjua9hzcnalvqn8rah3d6vsga3pe26mlcpx2v6ne43rpjulyg9s4s5e6d
      WORKER: unconfiguredgithubcopy
      # PASSWORD: x
      # EXTRAS: 
    logging:
      driver: "json-file"
      options:
        max-size: "10m"
        max-file: "3"
```

## env vars

| Variable       | Description             | Example                                      |
|----------------|--------------------------|----------------------------------------------|
| `ALGO`         | Mining algorithm         | `pearlhash`                                  |
| `POOL_ADDRESS` | Mining pool address      | `prl.kryptex.network:7048`    |
| `WALLET_USER`  | Wallet address or user   | `prl1p6mjua9hzcnalvqn8rah3d6vsga3pe26mlcpx2v6ne43rpjulyg9s4s5e6d`           |
| `WORKER`       | Worker name              | `unconfiguredgithubcopy`                                     |
| `PASSWORD`     | Pool password (optional) | `x`                                          |
| `EXTRAS`       | Extra ForgeMiner flags   | see https://github.com/0xHashRaptor/ForgeMiner for more flags                                      |

## license

This project redistributes official ForgeMiner binaries.
Please refer to the upstream repository for full license details:

- https://github.com/0xHashRaptor/ForgeMiner
