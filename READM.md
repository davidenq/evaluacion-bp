# Documentacion

## Informacion importante

### Servicios utilizaos
- Google Api Gateway
- Google Kubernetes Engine
- Google Credentials
- Github
- Github Actions para CI/CD
- Docker Hub para publicar las imagenes

### Pipelines en Github

![](docs/pipelines.png)

### Pasos para probar
1. Tener cuenta en github
2. Tener cuenta en Docker hub
3. Tener cuenta en Google Cloud


* Crear el cluster en kubernetes
```bash
make create-k8s-cluster
```

* Setear gcloud con el cluster creado anteriormente
  
```bash
gcloud container clusters get-credentials [NOMBRE_DEL_CLUSTER_CREADO] --region=[REGION_DEL_CLUSTER]
```

Por proposito de levantar los deployments, debera crear la imagen y publicarla en docker hub. Esta accion se ejecuta una unica bez para crear los deployments y esten listos para que en el fujo de CI/CD ya se puedan desplegar los contenedores en el deployment correspondiente.
Nota : debe estar logueado en github
Nota : en los scripts build and publish debera establecer los tags para ser publicados.

```bash
docker build && docker publish
```

* Crear deployments
pasar como variable de entorno SHA=[TAG_USADO_PARA_CREAR_LA_IMAGEN]
```bash
export SHA=[TAG_USADO_PARA_CREAR_LA_IMAGEN] make create-deployments
```

* Crear Api Gateway
```bash
make create-api-gateway
```





### ejmplo 

```bash
curl --location --request POST 'https://gw-5w3k515m.ue.gateway.dev/DevOps' \
> --header 'x-api-key: AIzaSyCYQQAtOUd1kIn7yKCX_YObVy9vNRRwfjQ' \
> --header 'Content-Type: application/json' \
> --data-raw '{ 
>  "message" : "This is a test", 
>  "to": "Juan Perez", 
> "from": "Rita Asturia",  
> "timeToLifeSec" : 45  
> }  '
{"message":"Hello Juan Perez your message will be send"}
```