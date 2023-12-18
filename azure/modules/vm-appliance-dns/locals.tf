locals {
    bind_script = <<BIND_SCRIPT
apt install bind9 -y;
apt install dnsutils -y;
mkdir /var/cache/bind;
chmod 0755 /var/cache/bind;
chown bind:bind /var/cache/bind;

cat > /etc/bind/named.conf.options << EOM
options {
    directory "/var/cache/bind";
    listen-on { any; };
    dnssec-validation auto;
    listen-on-v6 { none; };
    allow-recursion {
        any;
    };
    forwarders {
        // Azure DNS Servers
        168.63.129.16;
    };
};
EOM

systemctl restart bind9.service

BIND_SCRIPT
}