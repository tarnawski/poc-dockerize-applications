### RUN APPLICATION IN DEVELOPMENT MODE

Build images:
```shell script
docker-compose build
```

Run containers:
```shell script
docker-compose up
```

### BUILD PRODUCTION IMAGES

PHP application image:
```shell script
docker build --target php-prod --tag example.php:<VERSION> . 
```

NGINX image:
```shell script
docker build --target nginx --tag example.nginx:<VERSION> . 
```