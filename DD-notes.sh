# ---------- DD ---------- #

docker build -t greeting:latest --build-arg server_port=8084 --no-cache .
docker stop greeting && docker rm greeting 
docker run -d -p 8084:8084 --name greeting greeting
curl localhost:8084/greeting



git add .
git commit -m "Added test line in Dockerfile"
git push

# ---------- DD ---------- #