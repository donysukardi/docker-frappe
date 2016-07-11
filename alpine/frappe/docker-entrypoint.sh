#!/bin/sh

NODE_TYPE=$1
DB_HOST=${DB_HOST:=db}

bench use localhost

TASK=$(case "$NODE_TYPE" in
  ("app") echo "/home/frappe/frappe-bench/env/bin/gunicorn -b 0.0.0.0:8000 -w 4 -t 120 frappe.app:application --preload" ;;
  ("scheduler") echo "/usr/bin/bench schedule" ;;
  ("worker-default") echo "/usr/bin/bench worker --queue default" ;;
  ("worker-long") echo "/usr/bin/bench worker --queue long" ;;
  ("worker-short") echo "/usr/bin/bench worker --queue short" ;;
  ("node-socketio") echo "node /home/frappe/frappe-bench/apps/frappe/socketio.js" ;;
  (*) ;;
esac)

if [ ${NODE_TYPE} = "app" ]; then

  echo 'Waiting for DB to start up'

  dockerize -wait tcp://db:3306 -timeout 120s

  # su frappe -c "bench --site site.local doctor > /dev/null 2>&1"
  cd /home/frappe/frappe-bench
  bench --site localhost doctor > /dev/null 2>&1

  if [ ! $? -eq 0 ]; then

    cd /home/frappe/frappe-bench
    bench reinstall && \
    bench install-app erpnext

  fi;

  cd /home/frappe/frappe-bench/sites

fi;

(eval $TASK | tee /home/frappe/frappe-bench/logs/${NODE_TYPE}.log) 3>&1 1>&2 2>&3 | tee /home/frappe/frappe-bench/logs/${NODE_TYPE}.err.log

# (echo hello | tee stdout.log) 3>&1 1>&2 2>&3 | tee stderr.log

# else

# [program:frappe-bench-frappe-web]
# command=/home/frappe/frappe-bench/env/bin/gunicorn -b 0.0.0.0:8000 -w 4 -t 120 frappe.app:application --preload
# priority=4
# autostart=true
# autorestart=true
# stdout_logfile=/home/frappe/frappe-bench/logs/web.log
# stderr_logfile=/home/frappe/frappe-bench/logs/web.error.log
# user=frappe
# directory=/home/frappe/frappe-bench/sites

# [program:frappe-bench-frappe-schedule]
# command=/usr/bin/bench schedule
# priority=3
# autostart=true
# autorestart=true
# stdout_logfile=/home/frappe/frappe-bench/logs/schedule.log
# stderr_logfile=/home/frappe/frappe-bench/logs/schedule.error.log
# user=frappe
# directory=/home/frappe/frappe-bench

# [program:frappe-bench-frappe-default-worker]
# command=/usr/bin/bench worker --queue default
# priority=4
# autostart=true
# autorestart=true
# stdout_logfile=/home/frappe/frappe-bench/logs/worker.log
# stderr_logfile=/home/frappe/frappe-bench/logs/worker.error.log
# user=frappe
# stopwaitsecs=1560
# directory=/home/frappe/frappe-bench
# killasgroup=true
# numprocs=1
# process_name=%(program_name)s-%(process_num)d

# [program:frappe-bench-frappe-short-worker]
# command=/usr/bin/bench worker --queue short
# priority=4
# autostart=true
# autorestart=true
# stdout_logfile=/home/frappe/frappe-bench/logs/worker.log
# stderr_logfile=/home/frappe/frappe-bench/logs/worker.error.log
# user=frappe
# stopwaitsecs=360
# directory=/home/frappe/frappe-bench
# killasgroup=true
# numprocs=1
# process_name=%(program_name)s-%(process_num)d

# [program:frappe-bench-frappe-long-worker]
# command=/usr/bin/bench worker --queue long
# priority=4
# autostart=true
# autorestart=true
# stdout_logfile=/home/frappe/frappe-bench/logs/worker.log
# stderr_logfile=/home/frappe/frappe-bench/logs/worker.error.log
# user=frappe
# stopwaitsecs=1560
# directory=/home/frappe/frappe-bench
# killasgroup=true
# numprocs=1
# process_name=%(program_name)s-%(process_num)d


# [group:frappe-bench-web]
# programs=frappe-bench-frappe-web

# [group:frappe-bench-workers]
# programs=frappe-bench-frappe-schedule,frappe-bench-frappe-default-worker,frappe-bench-frappe-short-worker,frappe-bench-frappe-long-worker


# supervisord --nodaemon -c /home/frappe/frappe-bench/config/supervisor.conf
# bench setup production frappe
