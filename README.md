# cloudmaster - me playing in the cloud

Sets up a vagrantbox (the cloudmaster) and installs salt-cloud in it. 
Then uses salt-cloud to provision two ubuntu-based linode-servers, called 'ruler' and 'slave'.
'ruler' is set up as a salt master for 'slave' (minion).

## Usage

Prereqs: Install virtualbox and vagrant.

1. Sign up for the linode service (creditcard needed, use code LINODE10 for some extra credit).
2. Clone this project.
3. Create a `providers/linode.conf` (example provided).
4. Run `make`.
5. Watch it all happen.

When done you can run `make cloud_query` to see state and ip of your linodes.

To shutdown your linodes (they cost $.015/hour each) do `make cloud_cmd CCMD=shutdown`

To start them again do `make cloud_cmd CCMD=boot`.

See Makefile for more commands.
