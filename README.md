# Turn Server deployment

This deployment uses the TURN server implementation [coTurn](https://github.com/coturn/coturn), which is also offered in a [docker image](https://github.com/coturn/coturn/tree/master/docker/coturn) which is used for easy configuration and replication.

For understanding TURN and doing the deployment the following links was used:
- https://docs.pexip.com/rp_turn/rpturn_ports.htm
- https://matrix-org.github.io/synapse/latest/turn-howto.html#troubleshooting 
- https://www.metered.ca/tools/openrelay/
- https://github.com/nextcloud/spreed/blob/master/docs/TURN.md#6-testing-the-turn-server
- https://ourcodeworld.com/articles/read/1526/how-to-test-online-whether-a-stun-turn-server-is-working-properly-or-not


To run the docker image on a server:

```shell
docker run -d --network=host -v $(pwd)/my.conf:/etc/coturn/turnserver.conf coturn/coturn
```

or
```shell
make run
```

## Setup

The only thing that is required to update in the config is the line: ```user=username2:password2``` and the line: ```realm=thomsen-it.dk``` corresponding to the FQDN pointing to the server.


## Requirements:


Community recommended hardware specifications can be found [here](https://github.com/coturn/coturn/issues/328#issuecomment-473596655).
But we have had no problems running the coTurn server on 1 CPU core, 2 GB and 32 GB disk for our small two client setup. 





> **_NOTE:_**  Open the firewall on the server to something like this:

``` shell
$ sudo ufw status verbose
Status: active
Logging: on (low)
Default: deny (incoming), allow (outgoing), deny (routed)
New profiles: skip

To                         Action      From
---                        --------    ---             
3478                       ALLOW IN    Anywhere                  
3478/udp                   ALLOW IN    Anywhere                  
5349                       ALLOW IN    Anywhere                  
5349/udp                   ALLOW IN    Anywhere                  
49160:49200/udp            ALLOW IN    Anywhere                  
49152:65535/udp            ALLOW IN    Anywhere                  
8080                       ALLOW IN    Anywhere                  
3000                       DENY IN     Anywhere                       
3478 (v6)                  ALLOW IN    Anywhere (v6)             
3478/udp (v6)              ALLOW IN    Anywhere (v6)             
5349 (v6)                  ALLOW IN    Anywhere (v6)             
5349/udp (v6)              ALLOW IN    Anywhere (v6)             
49160:49200/udp (v6)       ALLOW IN    Anywhere (v6)             
49152:65535/udp (v6)       ALLOW IN    Anywhere (v6)             
8080 (v6)                  ALLOW IN    Anywhere (v6) 
```