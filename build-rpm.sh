VER=$1

rm -rf  ~/rpmbuild/

install -d ~/rpmbuild/SPECS/
install -d ~/rpmbuild/SOURCES/

# switch here between upstream release and pre-compiled releases
sh ./etcd-build-release.sh ${VER}
install release/etcd-v${VER}-linux-amd64.tar.gz ~/rpmbuild/SOURCES/etcd-v${VER}-linux-amd64.tar.gz
#wget https://github.com/coreos/etcd/releases/download/v${VER}/etcd-v${VER}-linux-amd64.tar.gz -O ~/rpmbuild/SOURCES/etcd-v0.4.6-linux-amd64.tar.gz

install ./etcd.spec ~/rpmbuild/SPECS/etcd.spec
install ./etcd.initd ~/rpmbuild/SOURCES/etcd.initd
install ./etcd.sysconfig ~/rpmbuild/SOURCES/etcd.sysconfig
install ./etcd.nofiles.conf ~/rpmbuild/SOURCES/etcd.nofiles.conf
install ./etcd.logrotate ~/rpmbuild/SOURCES/etcd.logrotate

rpmbuild -bb ~/rpmbuild/SPECS/etcd.spec
