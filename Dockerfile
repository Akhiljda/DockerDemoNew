FROM openjdk:8-jre-slim

#A Directory in the base image to copy our depedencies
WORKDIR /usr/share/tag

# Add the project jar & copy dependencies
ADD  target/container-test.jar container-test.jar
ADD  target/libs libs

# Add the suite xmls
ADD suite/search-module.xml search-module.xml

# Command line to execute the test
# Expects below ennvironment variables
# BROWSER = chrome / firefox
# MODULE  = order-module / search-module
# SELENIUM_HUB = selenium hub hostname / ipaddress

ENTRYPOINT java -cp container-test.jar:libs/* -DseleniumHubHost=192.168.99.1 -Dbrowser=chrome org.testng.TestNG ../suite/search-module.xml
