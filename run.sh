#!/bin/sh
PUPPET_DASHBOARD_URL=${PUPPET_DASHBOARD_URL:-http://localhost:3000}

cat << EOF > /etc/puppet/puppet.conf
[main]
  pluginsync = true

[master]
  allow_duplicate_certs = True
  ssldir = /var/lib/puppet/ssl
  node_name = facter
  facts_terminus = yaml
  modulepath = /opt/arcus/modules:/etc/puppet/modules
  node_terminus = exec
  external_nodes = /usr/bin/env PUPPET_DASHBOARD_URL=$PUPPET_DASHBOARD_URL /usr/share/puppet-dashboard/bin/external_node
  data_binding_terminus = hiera
  hiera_config = /etc/hiera.yaml
  storeconfigs = true
  storeconfigs_backend = puppetdb
  reports = store, http, puppetdb

[agent]
  ssldir = /var/lib/puppet/ssl
EOF

supervisord -c /opt/supervisor.conf -n
