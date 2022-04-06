# Setup Network NS and Subflows
 - `./setup-ns.sh`
 - `./config_paths.sh`

# Run Tests
 - `cd <path_to_use_mptcp>`
 - Run iperf server on mptcp-server namespace<br>
   `sudo ./use_mptcp.sh ip netns exec mptcp-server iperf -s`
 - in a different terminal Start tcpdump on link0 (blue-client) <br>
   `sudo ip netns exec mptcp-client tcpdump -v -i blue-client`
 - in a third terminal Start tcpdump on link1 (red-client) <br>
   `sudo ip netns exec mptcp-client tcpdump -v -i red-client`
 - Finally in a 4th terminal run iperf client on mptcp-client netns <br>
   `sudo ./use_mptcp.sh ip netns exec mptcp-client iperf -c 10.0.0.1`
   
Note: Instead of using multiple terminals/tabs processess can be run in background

Demo: Adapted from https://developers.redhat.com/articles/2021/10/20/multipath-tcp-rhel-8-one-many-subflows#working_with_multiple_paths
