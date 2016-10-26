#!/bin/sh -xe
PREFIX=.

docker-compose exec db pg_dumpall -U postgres > $PREFIX/backup-db.sql
docker-compose exec ldap slapcat > $PREFIX/backup-ldap.ldif
docker-compose exec ldap slapcat -b cn=config > $PREFIX/backup-ldap-config.ldif

docker-compose run -T --rm jira tar cf - . > $PREFIX/backup-jira.tar

## TODO: confluence
## TODO: GitBucket
## TODO: Jenkins
## TODO: Mattermost

