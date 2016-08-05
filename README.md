# director
Security footprint scanner torified and dockerized

## Credits
Author: [Hervé Beraud (4383)](https://github.com/4383)

## Description
director is a tiny footprint tools for web based security rules.

No pentest tools installation needed on your host, it's run totaly in standalone mode.

All pentest tools network connections has torified by using tor and polipo.

## Dependencies
* [Docker](https://docs.docker.com/engine/installation/)

## Usage
### Via the docker hub
```shell
docker pull 4383/director:latest
docker run -e "TARGET=http://<your-target>" 4383/director:latest
```

### Via the standalone method
```shell
git clone https://github.com/4383/director
cd director
docker build -t director .
docker run -e "TARGET=<your-domaine-target>" director
```

### Parameters
Use the `-e` option for define environment variables to pass to director.

Use the bash syntax for setting an environment variable.

#### The TARGET parameter
The target to scan.

Just set this with a [valid domain name](https://tools.ietf.org/html/rfc1035) like www.google.com

Syntax example : `-e "TARGET=www.google.com"`

#### The DIRBPROTO parameter
The HTTP protocole to use with dird.

By default is set with `http://` but you can set this with `https://`

Syntax example : `-e "DIRBPROTO=https://"`

### Included tools
#### [Dirb](http://dirb.sourceforge.net/)
A content web scanner.
We use a fork of the official dirb project hosted on [github](https://github.com/4383/dirb) for simply docker container deployment.
