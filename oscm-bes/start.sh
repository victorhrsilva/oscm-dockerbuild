#!/bin/bash

java -cp "/opt/oscm-devruntime.jar:/opt/lib/*" org.oscm.setup.DatabaseUpgradeHandler \
     /opt/glassfish3/glassfish/domains/bes-domain/config/db.properties \
	 /opt/sqlscripts/
	 
/opt/glassfish3/glassfish/bin/asadmin start-domain master-indexer-domain
sleep 120
/opt/glassfish3/glassfish/bin/asadmin stop-domain master-indexer-domain
sleep 30
/opt/glassfish3/glassfish/bin/asadmin start-domain master-indexer-domain
sleep 120
/opt/glassfish3/glassfish/bin/asadmin start-domain --verbose bes-domain

