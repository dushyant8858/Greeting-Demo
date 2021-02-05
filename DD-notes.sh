# ---------- DD ---------- #

docker build -t greeting:latest --build-arg server_port=8084 --no-cache .
docker stop greeting && docker rm greeting 
docker run -d -p 8084:8084 --name greeting greeting


curl http://localhost:8084/greeting | jq .


docker logs greeting
docker exec -it greeting sh 
apk add curl 


git add .
git commit -m "greeting run on Port 8084"
git push

# ---------- DD ---------- #