systemctl stop kubelet
systemctl stop docker
rm -rf /var/lib/cni/
rm -rf /etc/cni/net.d
rm -rf /run/flannel

iptables -t nat -F
iptables -t mangle -F
iptables -F
iptables -X
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT


ip6tables -t nat -F
ip6tables -t mangle -F
ip6tables -F
ip6tables -X
ip6tables -P INPUT ACCEPT
ip6tables -P FORWARD ACCEPT
ip6tables -P OUTPUT ACCEPT

iptables -L -v -n 
iptables -L -v -n -t nat
conntrack -L 
ipset list

lsmod|grep br_netfilter
modprobe br_netfilter
systemctl start docker
systemctl start kubelet
