`sudo firewall-cmd --zone=public --add-port=8797/tcp --permanent`

`sudo firewall-cmd --reload`

```
sudo firewall-cmd --list-all
public (active)
  target: default
  icmp-block-inversion: no
  interfaces: wlp6s0
  sources:
  services: dhcpv6-client ssh
  ports: 8000/tcp 8797/tcp
  protocols:
  masquerade: no
  forward-ports:
  source-ports:
  icmp-blocks:
  rich rules:
```

kill all dask running processes
ps -ef | grep -i dask | grep -v grep | awk {'print $2'} | xargs kill
