#!/bin/sh -xe
docker-compose exec db pg_dumpall -U postgres > backup-db.sql
docker-compose exec ldap slapcat > backup-ldap.ldif
docker-compose exec ldap slapcat -b cn=config > backup-ldap-config.ldif

## TODO: jira
## TODO: confluence
## TODO: GitBucket
## TODO: Jenkins
## TODO: Mattermost

