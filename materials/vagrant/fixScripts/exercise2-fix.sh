#!/bin/bash
sudo perl -pi -e "s,^127.0.0.1.*www.ascii-art.de\n$,," /etc/hosts
