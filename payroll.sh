curl --cookie-jar ./rtc1000.cookie 'http://192.168.1.99/login.html' --data 'username=*&password=*&buttonClicked=Submit' --compressed --insecure && curl 'http://192.168.1.99/payroll.html' --cookie ./rtc1000.cookie --data 'timeFrame=2' && curl 'http://192.168.1.99/export.html?type=4&timeFrame=2&provider=PaychexFlex' --cookie ./rtc1000.cookie -o paychexflex.`date -d "$(date +%Y-%m-%d) - 1 days" +%Y-%d-%m`.txt && rm ./rtc1000.cookie && scp -P 22002 -i '~/.ssh/ssh_key' "./paychexflex.`date -d "$(date +%Y-%m-%d) - 1 days" +%Y-%d-%m`.txt" 'root@mymailserver.com:/home/test/reports/rtc1000/' && rm "./paychexflex.`date -d "$(date +%Y-%m-%d) - 1 days" +%Y-%d-%m`.txt"
