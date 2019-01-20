# Get container IP address

```bash
$ docker inspect CONTAINER_ID | grep \"IPAddress\"
```

# Start services when create a container
- Use `monit`
    - A black magic...
    - [Dockerfile の書き方「私的」なベストプラクティス（3）〜サービスの起動について〜 \- ようへいの日々精進XP](https://inokara.hateblo.jp/entry/2013/12/29/215322)
