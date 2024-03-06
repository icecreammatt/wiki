# ssh

## agent forwarding

> fish shell

```fish
eval (ssh-agent -c)
ssh-add ~/.ssh/id_ed25519
ssh $hostname
ssh-add -D # to clear keys
```

## socks proxy

> Handy when needing to make edits to mikrotik router from wifi VLAN by proxying web from Mini over VPN

```fish
ssh -D 1337 -q -C -N user@hostname
```

- In Firefox settings search `socks`
- Manual Proxy config
- SOCKS Host: `localhost` Port `1337`
- SOCKS V5
- Check `Proxy DNS when using SOCKS v5`

Browsing should now work from laptop but proxied over VPN so I can access router settings

> Resources
- https://superuser.com/questions/1308495/how-to-create-a-socks-proxy-with-ssh
- https://ma.ttias.be/socks-proxy-linux-ssh-bypass-content-filters/
