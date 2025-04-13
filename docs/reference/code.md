# VSCode

## Fractional Scaling with Wayland Fix
https://github.com/pop-os/cosmic-comp/issues/397#issuecomment-2102693129

1.
```
mkdir -p ~/.local/share/applications
cp /usr/share/applications/code.desktop ~/.local/share/applications/
```

2.
```
Exec=/usr/share/code/code --enable-features=UseOzonePlatform --enable-features=WaylandWindowDecorations --ozone-platform-hint=auto --unity-launch %F
```

3.
```
alias code='code --enable-features=UseOzonePlatform --enable-features=WaylandWindowDecorations --ozone-platform-hint=auto'
```
