# Raspbian

## Fix colors on SSH

[Add to fish/bash config](https://raspberrypi.stackexchange.com/a/114477)

```bash
export TERM=xterm-256color
export COLORTERM=truecolor
```

## Caps lock as control

[~/.config/labwc/environment](https://raspberrypi.stackexchange.com/a/150737)

```bash
XKB_DEFAULT_OPTIONS=ctrl:nocaps
```

After editing config run below to apply

```bash
$ labwc --reconfigure
```

## uxplay

Airplay from iPhone to RPI

- `-avdec` to fix it not working
- `-fs` fullscreen

```bash
sudo apt install uxplay
uxplay -n garage -avdec -fs

```
