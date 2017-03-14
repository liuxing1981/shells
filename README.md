##ubuntu16.04vnc
###desc:
Install a vnc server on your ubuntu16.04 with vnc4server.

##shadowsocks client
###desc:
A docker image of shadowsocks client. It'll take a few time to download docker image when you first run it.  
To start

```
    ./shadowsocks
```  
To stop

```
    ./shadowsocks stop
```
And then you can set the proxy with firefox in the    
"Advanced"->"network"->"settings"->"Manual proxy configuration:"  

```
    SOCK_Hosts: 127.0.0.1  Port: 7071
```
Or install the proxychains for proxy.  
```
    proxychains firefox
```
