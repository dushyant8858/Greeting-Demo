# ---------- DD ---------- #

docker build -t greeting:latest --build-arg server_port=8084 --no-cache .

docker build -t greeting:latest --build-arg server_port=8084 .
docker stop greeting && docker rm greeting 
docker run -d -p 8084:8084 --name greeting greeting


curl http://localhost:8084/greeting | jq .


docker logs -f greeting
docker exec -it greeting sh 
apk add curl 


git add .
git commit -m "Enabled accesslog and tomcat/catalina=DEBUG"
git push

# ---------- DD ---------- #

# Access Logs https://github.com/jochenchrist/spring-boot-access-logs-demo/tree/master/src
