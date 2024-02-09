# Build
```
docker build -t fluent:kafka_rabbit . 
```

# Exec
```
docker run -v $(pwd)/fluent.conf:/fluentd/etc/fluent.conf fluent:kafka_rabbit -c /fluentd/etc/fluent.conf
```

