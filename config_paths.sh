ip -n mptcp-server mptcp endpoint flush
ip -n mptcp-server mptcp limits set subflow 2 add_addr_accepted 2
ip -n mptcp-client mptcp endpoint flush
ip -n mptcp-client mptcp limits set subflow 2 add_addr_accepted 2
ip -n mptcp-client mptcp endpoint add 192.168.0.2 dev blue-client id 1 subflow
