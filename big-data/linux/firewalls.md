List state

`sudo firewall-cmd --list-all`

Use this command to find your active zone(s):

It will say either public, dmz, or something else. You should only apply to the zones required.

`firewall-cmd --get-active-zones`

In the case of public try:

`firewall-cmd --zone=public --add-port=8797/tcp --permanent`

Then remember to reload the firewall for changes to take effect.

`firewall-cmd --reload`

Otherwise, substitute public for your zone, for example, if your zone is dmz:

`firewall-cmd --zone=dmz --add-port=2888/tcp --permanent`
