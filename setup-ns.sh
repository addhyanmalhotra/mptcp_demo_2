#!/bin/sh

ip netns add mptcp-client
ip netns add mptcp-server

sysctl -w net.ipv4.conf.all.rp_filter=0
ip netns exec mptcp-client sysctl -w net.mptcp.enabled=1
ip netns exec mptcp-server sysctl -w net.mptcp.enabled=1

ip link add red-client netns mptcp-client type veth peer red-server netns mptcp-server
ip link add blue-client netns mptcp-client type veth peer blue-server netns mptcp-server

ip -n mptcp-server address add 10.0.0.1/24 dev red-server
ip -n mptcp-server address add 192.168.0.1/24 dev blue-server
ip -n mptcp-client address add 10.0.0.2/24 dev red-client
ip -n mptcp-client address add 192.168.0.2/24 dev blue-client

ip -n mptcp-server link set red-server up
ip -n mptcp-server link set blue-server up
ip -n mptcp-client link set red-client up
ip -n mptcp-client link set blue-client up
