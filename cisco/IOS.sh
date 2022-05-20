# IOS.sh script
# Setup environment by cutting out the NTP address
# Use NTPx environment value to add new addresses to existing ACL

let n=0
for ntp in `show ntp ass | cut -f1 -d 'address' | cut -f1 -d 'sys.peer' | cut -c'3-16'` 
do 
 NTP$n=$ntp
 let n++
done

# Function to configure existing access-list
function set_ntp_acl () {
    configure terminal
     ip access-list standard ACL-NTP_PEERS
            permit $NTP0
            permit $NTP1
            permit $NTP2
            permit $NTP3
    end
}

# Run the function
set_ntp_acl
