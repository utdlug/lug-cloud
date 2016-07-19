#version=DEVEL
# System authorization information
auth --enableshadow --passalgo=sha512
# Use network installation
url --url="http://172.16.42.1/centos7"
# Use graphical install
graphical
# Run the Setup Agent on first boot
firstboot --enable
ignoredisk --only-use=sda
# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us'
# System language
lang en_US.UTF-8

# Network information
network  --bootproto=dhcp --device=enp1s0 --ipv6=auto --activate
network  --hostname=localhost.localdomain

#Root password
rootpw --lock
# System timezone
timezone America/Chicago --isUtc --ntpservers=gateway
user --groups=wheel --name=lug --password=$6$YhlK/tkFtgHJOsaf$278dHxiZQln3Tu0TwpaQ6iQCAmIsNp3AnUEYVMOkNPdrKzi/X5A73ZF5vKTAfaFXUr/Dkb6tgRvEbhlyW4ROV1 --iscrypted --gecos="lug"
# System bootloader configuration
bootloader --append=" crashkernel=auto" --location=mbr --boot-drive=sda
autopart --type=lvm
# Partition clearing information
clearpart --all --initlabel --drives=sda

%packages
@^minimal
@core
kexec-tools

%end

%addon com_redhat_kdump --enable --reserve-mb='auto'

%end
