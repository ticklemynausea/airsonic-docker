#!/bin/sh

/usr/bin/java \
	$JAVA_OPTS \
	-Dairsonic.home=${AIRSONIC_HOME} \
	-Dserver.context-path=${CONTEXT_PATH} \
	-Dserver.address=${ADDRESS} \
	-Dserver.port=${PORT} \
	-jar ${JAVA_JAR} $JAVA_ARGS
