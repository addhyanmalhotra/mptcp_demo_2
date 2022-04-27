ip netns add h1
ip netns add h2

sysctl -w net.ipv4.conf.all.rp_filter=0
ip netns exec h1 sysctl -w net.mptcp.enabled=1
ip netns exec h2 sysctl -w net.mptcp.enabled=1

ip link add eth0a netns h1 type veth peer eth1a netns h2
ip link add eth0b netns h1 type veth peer eth1b netns h2

ip -n h1 address add 10.0.0.1/24 dev eth0a
ip -n h1 address add 192.168.0.1/24 dev eth0b
ip -n h2 address add 10.0.0.2/24 dev eth1a
ip -n h2 address add 192.168.0.2/24 dev eth1b

ip netns exec h1 tc qdisc add dev eth0a root netem delay 5ms rate 10mbit
ip netns exec h1 tc qdisc add dev eth0b root netem delay 10ms rate 5mbit
ip netns exec h2 tc qdisc add dev eth1a root netem delay 5ms rate 10mbit
ip netns exec h2 tc qdisc add dev eth1b root netem delay 10ms rate 5mbit

ip -n h1 link set eth0a up
ip -n h1 link set eth0b up
ip -n h2 link set eth1b up
ip -n h2 link set eth1a up

ip netns
ip netns exec h1 ip link
ip netns exec h2 ip link
ip netns exec h1 tc qdisc show dev eth0a
ip netns exec h1 tc qdisc show dev eth0b
ip netns exec h2 tc qdisc show dev eth1a
ip netns exec h2 tc qdisc show dev eth1b
