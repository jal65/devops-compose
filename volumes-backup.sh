#!/bin/sh -xe
PREFIX=.

docker-compose stop

docker-compose run -T --rm jira tar cf - . > $PREFIX/backup-jira.tar
docker-compose run -T --rm confluence tar cf - . > $PREFIX/backup-confluence.tar
docker-compose run -T --rm -w /gitbucket gitbucket tar cf - . > $PREFIX/backup-gitbucket.tar
docker-compose run -T --rm -w /var/jenkins_home jenkins tar cf - . > $PREFIX/backup-jenkins.tar
docker-compose run -T --rm -w /mattermost/data mattermost tar cf - . > $PREFIX/backup-mattermost-data.tar
docker-compose run -T --rm -w /mattermost/config mattermost tar cf - . > $PREFIX/backup-mattermost-config.tar

docker-compose exec db pg_dumpall -U postgres > $PREFIX/backup-db.sql
docker-compose exec ldap slapcat > $PREFIX/backup-ldap.ldif
docker-compose exec ldap slapcat -b cn=config > $PREFIX/backup-ldap-config.ldif
