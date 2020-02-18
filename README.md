# DVWA Docker container
[![Docker Pulls](https://img.shields.io/docker/pulls/hightechsec/docker-dvwa.svg?style=plastic)](https://hub.docker.com/r/hightechsec/docker-dvwa)
![License](https://img.shields.io/badge/License-GPL-blue.svg?style=plastic)

Damn Vulnerable Web Application (DVWA) is a PHP/MySQL web application that is damn vulnerable. Its main goal is to be an aid for security professionals to test their skills and tools in a legal environment, help web developers better understand the processes of securing web applications and to aid both students & teachers to learn about web application security in a controlled class room environment.

The aim of DVWA is to practice some of the most common web vulnerability, with various difficultly levels, with a simple straightforward interface. Please note, there are both documented and undocumented vulnerability with this software. This is intentional. You are encouraged to try and discover as many issues as possible.

**WARNING** This image is vulnerable to several kinds of attacks, please don't deploy it to any public servers.

## Run this image

To run this image you need [docker](http://docker.com) installed. Just run the command:

    docker run --name docker-dvwa -d --rm -it -p 80:80 hightechsec/docker-dvwa

## Added some changes:
- Enabled "allow_url_include"
- Added nc to the server
- Added nano to the server