# Docker rsyslog

![ver](https://img.shields.io/badge/ver-1.0-pink)
![license](https://img.shields.io/github/license/mach1el/docker-rsyslog?color=blue&style=plastic)
![docker](https://img.shields.io/badge/docker-container-magenta)

Rsyslog server on docker
 
### Building docker image
    git clone https://github.com/mach1el/docker-rsyslog.git
    cd docker-rsyslog && docker build -t rsyslog .
    
### Run
    docker run \
    --cap-add SYSLOG \
    --restart always \
    -v /var/log:/var/log \
    -p 514:514 \
    -p 514:514/udp \
    --name rsyslog rsyslog
    
### Test log server
    docker run \
    --log-driver syslog \
    --log-opt syslog-address=tcp://syslog_ip:514 \
    alpine
    
### Explain

| Param | Meaning |
| :---:   | :-: |
| --cap-add SYSLOG | Allow container to perform privileged syslog(2) |
| --restart always | Restart container regardless of the exit status |
| -v /var/log:/var/log | Mount host /var/log directory in container /var/log directory |
| -p 514:514 | Bind Host TCP 514 port to contaainer TCP 514 port |
| -p 514:514/udp | Bind Host UDP 514 port to contaainer UDP 514 port |
