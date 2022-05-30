# IOS.sh script
# Cut current ntp associations line by line and paste them into the ACL (ACL-NTP_PEERS)
# Don't forget to enable the extended shell 'shell processing full'
# For a temporary IOS.sh enable with 'terminal shell trace'


function set_ntp_acl () {
 configure terminal
  ip access-list standard ACL-NTP_PEERS
   permit host $ntp
   end
}

for ntp in `show ntp ass | cut -f1 -d 'address' | cut -f1 -d 'sys.peer' | cut -c'3-16'` 
do 
 set_ntp_acl
done
