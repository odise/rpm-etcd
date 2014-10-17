rpm-etcd
========

An RPM spec file to build and install etcd.

To Install from an official etcd release:

`sudo yum -y install rpmdevtools && rpmdev-setuptree`

`wget https://raw.github.com/odise/rpm-etcd/development/etcd.spec -O ~/rpmbuild/SPECS/etcd.spec`

`wget https://github.com/coreos/etcd/releases/download/v0.4.6/etcd-v0.4.6-linux-amd64.tar.gz -O ~/rpmbuild/SOURCES/etcd-v0.4.6-linux-amd64.tar.gz`

`wget https://raw.github.com/odise/rpm-etcd/development/etcd.initd -O ~/rpmbuild/SOURCES/etcd.initd`

`wget https://raw.github.com/odise/rpm-etcd/development/etcd.sysconfig -O ~/rpmbuild/SOURCES/etcd.sysconfig`

`wget https://raw.github.com/odise/rpm-etcd/development/etcd.nofiles.conf -O ~/rpmbuild/SOURCES/etcd.nofiles.conf`

`wget https://raw.github.com/odise/rpm-etcd/development/etcd.logrotate -O ~/rpmbuild/SOURCES/etcd.logrotate`

`rpmbuild -bb ~/rpmbuild/SPECS/etcd.spec`

If need something special:

 `curl https://packagecloud.io/install/repositories/imeyer/golang/script.rpm | sudo bash`

 `sudo yum install golang-1.3-7.el7.centos.x86_64`

 `git clone https://github.com/coreos/etcd.git`
 
 `cd etcd`

 `git reset --hard 766aa85320218322ce188356d8e05d8207beebc3`

 `./build`

The binary can be found in the `bin` folder.


