# ssh

## agent forwarding

> fish shell
```fish
eval (ssh-agent -c)
ssh-add ~/.ssh/id_ed25519
ssh $hostname
ssh-add -D # to clear keys
````
