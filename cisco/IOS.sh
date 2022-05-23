# IOS.sh script
# Setup environment by cutting out the NTP address
# Use NTPx environment value to add new addresses to existing ACL

let n=0

function set_ntp_acl () {
 configure terminal
  ip access-list standard ACL-NTP_PEERS
   permit host $ntp
   end
}

for ntp in `show ntp ass | cut -f1 -d 'address' | cut -f1 -d 'sys.peer' | cut -c'3-16'` 
do 
 set_ntp_acl
 let n++
done
