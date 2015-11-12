
# MockServer
# Dependencies
java

#Installation
Install Docker.

Download build from public Docker Hub: docker pull discoverydev/mockserver

#Usage
## No Log Output (deamon mode)
docker run -d --name mockserver -p <serverPort>:1080 -p <proxyPort>:1090 discoverydev/mockserver
## Log Output
docker run --name mockserver -p <serverPort>:1080 -p <proxyPort>:1090 discoverydev/mockserver

## Shell Prompt
DEBUG any issues or change the command line options you can run the container with a shell prompt
docker run -i -t --name mockserver -p 1080:1080 -p 1090:1090 discoverydev/mockserver /bin/bash

The default command executed when the container runs is:

/opt/mockserver/run_mockserver.sh -logLevel INFO -serverPort 1080 -proxyPort 1090
This can be modified to change the command line options passed to the /opt/mockserver/run_mockserver.sh script, which supports the following options:

run_mockserver.sh [-logLevel <level>] [-serverPort <port>] [-proxyPort <port>] \ 
                  [-proxyRemotePort <port>] [-proxyRemoteHost <hostname>]

 valid options are:
    -logLevel <level>            OFF, ERROR, WARN, INFO, DEBUG, TRACE or ALL
                                 as follows:
                                 WARN - exceptions and errors
                                 INFO - all interactions

    -serverPort <port>           Specifies the HTTP, HTTPS, SOCKS and HTTP
                                 CONNECT port for proxy. Port unification
                                 supports for all protocols on the same port

    -proxyPort <port>            Specifies the HTTP and HTTPS port for the
                                 MockServer. Port unification is used to
                                 support HTTP and HTTPS on the same port

    -proxyRemotePort <port>      Specifies the port to forward all proxy
                                 requests to (i.e. all requests received on
                                 portPort). This setting is used to enable
                                 the port forwarding mode therefore this
                                 option disables the HTTP, HTTPS, SOCKS and
                                 HTTP CONNECT support

    -proxyRemoteHost <hostname>  Specified the host to forward all proxy
                                 requests to (i.e. all requests received on
                                 portPort). This setting is ignored unless
                                 proxyRemotePort has been specified. If no
                                 value is provided for proxyRemoteHost when
                                 proxyRemotePort has been specified,
                                 proxyRemoteHost will default to "localhost".

i.e. run_mockserver.sh -logLevel INFO -serverPort 1080 -proxyPort 1090 \ 
                       -proxyRemotePort 80 -proxyRemoteHost www.mock-server.com
