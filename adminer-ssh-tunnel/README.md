# Install it


```sh
sudo curl -o /usr/local/bin/adminer-ssh-tunnel https://cdn.rawgit.com/abdennour/containers-factory/latest/adminer-ssh-tunnel/adminer-ssh-tunnel.sh && sudo chmod +x /usr/local/bin/adminer-ssh-tunnel
```

# Use it


```
adminer-ssh-tunnel ~/.ssh/id_rsa localhost:3306:mydb.example.com:3306 
```