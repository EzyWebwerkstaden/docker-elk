# Docker ELK stack
This is a mix of different projects
https://github.com/deviantony/docker-elk the main project
https://github.com/pageload/slack-docker to get notifications to slack
https://github.com/bargenson/docker-filebeat to forward the docker logs to logstash

Change `logstash\pipeline\logstash.conf` to the Redis server or uncomment Redis section in _docker-compose.yml_

Run with `docker-compose up -d`