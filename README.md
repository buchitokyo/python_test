# python
https://datawokagaku.com/startjupyternote/#Dockerfile


docker build --platform linux/amd64 .  
docker run -p 8888:8888 -v {docker file position}:/work --name python_project {IMAGE_ID}  
docker rename old_name new_name  
docker tag IMAGE_ID IMAGE_NAME:TAG  
OR  
docker-compose u -d --build  
https://pystyle.info/jupyter-change-checkpoint-directory/  
https://www.pep4.net/datascience/4408/  