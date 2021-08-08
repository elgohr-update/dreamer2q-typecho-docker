# Typecho Docker Image

`Typecho` is a lightweight php blog system just like wordpress with plugins support.

And this [repo](#) provides the basic environment to run `typecho`
 - nginx / lighttpd (choose one of them on your own)
 - php-fpm and its necessary extenions for `typecho`
 - the latest release of `typecho`

> To get a deep sight, please referer [Dockerfile](Dockerfile).

Docker image of `lighttpd` has been deployed [here](https://dreamer2q.wang), take a look for yourself.

## Quick Start

1. Clone this repo

```bash
git clone https://github.com/dreamer2q/typecho-docker
```

2. Build one

```bash
docker build . -t typecho-nginx -f Dockerfile.nginx # build for nginx

docker build . -t typecho-lighttpd -f Dockerfile # build for lighttpd
```

3. Test run
  
```bash
docker run -it --rm -p "8080:80" typecho-nginx # test it if runs successfully
```

4. Make request

```bash
curl http://localhost:8080/install.php -v # check the result
```

> You can try install with built-in sqlite and see its functionalites

## Configuration

- provide your own `typecho` root

```bash
docker run -v "your-path:/var/www" typecho-docker # mount to /var/www
```

- change port

```bash
docker run -p "your-port:80" typecho-docker # expose a different port
```

# LICENSE

[MIT](LICENSE)
