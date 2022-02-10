Jenkins install using Docker
=========

Docker-compose file to create a Jenkins server with plugins


Docker-compose Files
--------------

plugins.txt contains list of auto-installing plugins for Jenkins

/configs the folder contains files for configurating Jenkins as code


Running Docker-compose
--------------

Change directory to /jenkins-install

Run the command to build and start Jenkins container:

	docker-compose up -d

Run the command to build or rebuild Jenkins container:
	
	docker-compose build 
	







