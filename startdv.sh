cat <<EOF > /root/startdv.sh
 #!/bin/bash
if (($(netstat -ntupla | awk '{print $4}' | grep 0.0.0.0:5601 | wc -l) > 0 ))
  then
systemctl start metricbeat
systemctl start filebeat
systemctl start packetbeat
systemctl start kibana
systemctl start logstash
systemctl start elasticsearch
sleep 4
metricbeat setup --dashboards
packetbeat setup --dashboards
sleep 4
rm -rf /root/elk-stack.sh
rm -rf /root/elk-stack
echo "Da thuc hien thanh cong OK"
else
  echo "ban thuc hien lai sau 2 phut .kibana chua start"
fi
EOF
