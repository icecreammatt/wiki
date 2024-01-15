# systemd

## Octoprint

> /etc/systemd/system/nebula.service

```
[Unit]
Description=nebula
After=network.target
StartLimitIntervalSec=0

[Service]
CapabilityBoundingSet=CAP_NET_ADMIN
AmbientCapabilities=CAP_NET_ADMIN
ExecStart=/snap/nebula/current/bin/nebula -config /etc/nebula/config.yaml
Restart=always
RestartSec=1
User=pi
Type=simple

[Install]
WantedBy=multi-user.target
```

## systemd commands

- `sudo systemctl status service`
- `sudo systemctl enable service`
- `sudo systemctl disable service`
- `sudo systemctl restart service`
- `sudo systemctl start service`
- `sudo systemctl stop service`

## journalctl

- `journalctl -xeu service`
