# fd

## find files modified in last x days

```bash
fd -e md --type f . --changed-within=1d | sk
```
