# CiscoWanDashbord

Lab environment fore playing with Cisco SNMP Statistics.

Telegraf collect metrics from a physical router.
SNMP settings and ip address of the router can be change in the file
.\telegaf\telegraf.conf

telegraf sends the collected data to the infuxdb database
whare grafana can visualize the monitoring data in nice graphs


# How to

Run the start.sp1 script.

open a browser and go to http://127.0.0.1:3000/login
login with admin/admin

and import the dasbord .\WanDashbord.json

