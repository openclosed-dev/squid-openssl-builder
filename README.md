# squid-openssl Builder

Docker image for generating binary package of squid-openssl for Ubuntu 20.04.

## Usage

### Building the docker image

```
docker compose build
```

### Generating binary package from source distribution


Starting the Docker container automatically generates `.deb` package file in `dist` directory.
```
docker compose up
```

### Installing the binary package

The built package can be installed using the following command.
```
sudo apt install ./squid_4.10-1ubuntu1.9_amd64.deb
```

The server can be started using `systemctl` command.
```
sudo systemctl enable squid
sudo systemctl start squid
```

The status of the server can be verified as follows.
```
sudo systemctl status squid
```
