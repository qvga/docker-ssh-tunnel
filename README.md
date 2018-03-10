# docker-ssh-tunnel


### Usage

    docker run --name tunnel1 -d -v "$HOME/.ssh/id_rsa:/sshkey:ro" -e L=5555:192.168.1.1:80 -e R=jakob@example.com -p 5555:5555 qvga/ssh-tunnel
