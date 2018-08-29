# docker-ssh-tunnel


### Usage

    docker run --name tunnel1 -d -v "$HOME/.ssh/id_rsa:/sshkey:ro" -e L=5555:192.168.1.1:80 -e R=jakob@example.com -p 5555:5555 qvga/ssh-tunnel


### Examples
#### Link tunneled database to a container with docker-compose


    version: '2'
    services:
        webservice_x:
            image: webdevops/php-apache-dev:debian-9
            volumes:
                - ./public/:/var/www
            ports:
                - "8088:80"
            links:
                database_x:db
            environment:
                WEB_DOCUMENT_ROOT: /var/www/public
    
        database_x:
            image: qvga/ssh-tunnel
            volumes:
                - ${HOME}/.ssh/id_rsa:/sshkey:ro
            environment:
                L: 3306:127.0.0.1:3306 #bind port and forward-to host:port (same as ssh -L option)
                R: jakob@example.com #machine hosting the db. (same as ssh -R option)

##### access database at db:3306 from within container webservice_x