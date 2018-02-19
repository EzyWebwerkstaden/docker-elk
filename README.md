# Docker ELK stack
**This is a mix of different projects**  
https://github.com/deviantony/docker-elk the main project  
https://github.com/pageload/slack-docker to get notifications to slack   
https://github.com/jimmikristensen/elk-curator-docker removes old logs (indices)  
https://github.com/portainer/portainer management UI for Docker
  
Change `logstash\pipeline\logstash.conf` to the Redis server or uncomment Redis section in `docker-compose.yml`

Run with `docker-compose up -d`
