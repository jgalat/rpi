#!/bin/sh

docker-compose exec flexget flexget execute --tasks series-* movies-* subs-* 
