<!-- to build docker image -->

docker build -t app1-image .

<!-- to convert docker image into tar -->

docker save -o app1-image.tar app1-image

<!-- to run in pc -->

docker run -p 8081:8081 app1-image
