# alfresco-docker-cors

Alfresco Docker image with CORS support

Based on [enzor/alfresco](https://github.com/enzor/alfresco), itself forked from [mikelasla/alfresco](https://github.com/mikelasla/alfresco)

To build and install the image locally, run

    docker build -t alfresco-standalone-cors .

To run a container using `docker compose`

    docker-compose -f compose.yml -d up

When you are done you can stop and remove the containers

    docker-compose -f compose.yml stop
    docker-compose -f compose.yml rm
