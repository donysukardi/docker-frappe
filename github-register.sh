curl -u donysukardi:bd5da85007010a03d9d127182ec01d675323829d -i \
  https://api.github.com/hub \
  -F "hub.mode=subscribe" \
  -F "hub.topic=https://github.com/frappe/bench/events/push" \
  -F "hub.callback=https://registry.hub.docker.com/u/donysukardi/frappe/trigger/ce27da00-00ed-47f7-9c71-076e87469b8d/?build=true"

curl -u donysukardi:bd5da85007010a03d9d127182ec01d675323829d -i \
  https://api.github.com/hub \
  -F "hub.mode=subscribe" \
  -F "hub.topic=https://github.com/frappe/frappe/events/push" \
  -F "hub.callback=https://registry.hub.docker.com/u/donysukardi/frappe/trigger/ce27da00-00ed-47f7-9c71-076e87469b8d/?build=true"


curl -u donysukardi:bd5da85007010a03d9d127182ec01d675323829d -i \
  https://api.github.com/hub \
  -F "hub.mode=subscribe" \
  -F "hub.topic=https://github.com/frappe/erpnext/events/push" \
  -F "hub.callback=https://registry.hub.docker.com/u/donysukardi/erpnext/trigger/8038d09c-f35f-45b8-bcfa-758fdd23a3d7/?build=true"


curl -u donysukardi:bd5da85007010a03d9d127182ec01d675323829d -i \
  https://api.github.com/hub \
  -F "hub.mode=subscribe" \
  -F "hub.topic=https://github.com/frappe/schools/events/push" \
  -F "hub.callback=https://registry.hub.docker.com/u/donysukardi/schools/trigger/6d4dba8f-9424-43a5-b5fa-01282f85afda/?build=true"
