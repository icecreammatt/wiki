# netstat

## Check ports that are open

```bash
sudo netstat -tulpn | grep :443

# or 
sudo netstat --tcp --udp --listening --program --numeric
```