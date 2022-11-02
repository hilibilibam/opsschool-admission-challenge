#!/bin/bash
#add fix to exercise4-server2 here
sudo chmod og+w /etc/hosts 
echo "192.168.60.10  server1" >> /etc/hosts
sudo chmod 644 /etc/hosts
touch script.sh
chmod ugo+x script.sh
echo '#!/bin/bash
cat <<EOF > ~/.ssh/id_rsa
-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAMwAAAAtzc2gtZW
QyNTUxOQAAACBWex1liRBGVG/naWqM0J3LyN9zKCnFIBicb3hkUofE0AAAAJjEw2VzxMNl
cwAAAAtzc2gtZWQyNTUxOQAAACBWex1liRBGVG/naWqM0J3LyN9zKCnFIBicb3hkUofE0A
AAAEBWlMGVCgfNBvVQ//mGvM4Q4IzT6B3JGYj8zgsB0zDJDVZ7HWWJEEZUb+dpaozQncvI
33MoKcUgGJxveGRSh8TQAAAAEnNlcnZlckB2YWdyYW50LmNvbQECAw==
-----END OPENSSH PRIVATE KEY-----
EOF

cat <<EOF > ~/.ssh/id_rsa.pub
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFZ7HWWJEEZUb+dpaozQncvI33MoKcUgGJxveGRSh8TQ server@vagrant.com
EOF

chmod 600 ~/.ssh/id_rsa

echo `cat ~/.ssh/id_rsa.pub` >> ~/.ssh/authorized_keys

cat <<EOF > ~/.ssh/config
Host server1
        Hostname        192.168.60.10
        IdentityFile    ~/.ssh/id_rsa
        IdentitiesOnly  yes
        User            vagrant
EOF
echo "StrictHostKeyChecking no" >> ~/.ssh/config
' >> script.sh


