# ---------- DD Local ---------- #

docker build -t greeting:local --build-arg server_port=8084 --no-cache .


docker build -t greeting:local --build-arg server_port=8084 .
docker stop greeting && docker rm greeting 
docker run -d -p 8084:8084 --name greeting greeting:local


curl http://localhost:8084/greeting | jq .


docker logs -f greeting
docker exec -it greeting sh 
apk add curl 


docker system df
docker system prune --all


git add .
git commit -m "Removed .DS_Store"
git push

# ---------- DD Local ---------- #

# Access Logs https://github.com/jochenchrist/spring-boot-access-logs-demo/tree/master/src




docker stop greeting && docker rm greeting
docker build -t greeting:local --build-arg server_port=8084 .
docker stop greeting && docker rm greeting 
docker run -d -p 8084:8084 --name greeting greeting:local
docker logs -f greeting

