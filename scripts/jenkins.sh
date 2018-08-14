#!/bin/bash

jenkins_id=$(docker run -d -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock clemenko/dc18:jenkins)
echo $jenkins_id > jenkins.id

echo -n "  Waiting for Jenkins to start."
for i in {1..20}; do echo -n "."; sleep 1; done
echo ""

echo "========================================================================================================="
echo ""
echo "  Jenkins Setup Password = "$(docker exec $jenkins_id cat /var/jenkins_home/secrets/initialAdminPassword)
echo ""
echo "========================================================================================================="
