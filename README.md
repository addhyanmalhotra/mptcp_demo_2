# Setup Network NS and Subflows
 - `./setup-ns.sh`
 - `./config_paths.sh`

# Run Tests
 - `cd <path_to_use_mptcp>`
 - Run iperf server on mptcp-server namespace<br>
   `sudo ./use_mptcp.sh ip netns exec mptcp-server iperf -s`
 - In a different tab run iperf client on mptcp-client netns <br>
   `sudo ./use_mptcp.sh ip netns exec mptcp-client iperf -c 10.0.0.1`
 - Examine tcpdump on link0 (blue-client) <br>
   `sudo ip netns exec mptcp-client tcpdump -v -i blue-client`
 - Examine tcpdump on link0 (red-client) <br>
   `sudo ip netns exec mptcp-client tcpdump -v -i red-client`
   
