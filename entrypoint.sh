#!/bin/bash

# Generate irods_environment.json from environment variables
cat > /root/.irods/irods_environment.json <<EOF
{
  "irods_host": "${IRODS_HOST}",
  "irods_port": 1247,
  "irods_user_name": "${IRODS_USER_NAME}",
  "irods_zone_name": "${IRODS_ZONE_NAME}"
}
EOF

echo "Generated /root/.irods/irods_environment.json:"
cat /root/.irods/irods_environment.json
echo ""

# Start interactive shell or java app
if [ $1 == "api" ]; then
    exec java -jar irods-client.jar irods-client-config.yml
else
    exec /bin/bash
fi
