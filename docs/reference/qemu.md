# qemu

## virtual disk creation

```fish
qemu-img create -f qcow2 example.img 80G
```

## running nixos image
```fish
qemu-system-x86_64 -cdrom ./result/iso/nixos-24.05.20240306.9df3e30-x86_64-linux.iso -drive file=example.img -net nic -net user,hostfwd=tcp::10022-:22 -daemonize -m 8G
```
