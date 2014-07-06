#!/bin/bash
# useful commands

# follow log file
tail -f filename


# http://superuser.com/questions/318809/linux-os-x-tar-incompatibility-tarballs-created-onos-x-give-errors-when-unt
# Received errors when creating a tarball on OSX and extracting it on ubuntu:
#   tar: Ignoring unknown extended header keyword `SCHILY.dev'
# Mac OS X 10.6 uses a BSD tar by default but
# also ships with a gnutar at /usr/bin/gnutar
#   all options are the same
/usr/bin/gnutar

gnutar czvf cleats_20140312.tar.gz  --exclude='*/.git/*' dirname

# find all .ch files and put them in zip
find . -name "*.[ch]" -print | zip source -@

# put all files listed in specified file in zip
cat files | zip testzip.zip -@

# search for text javascript footer excluding js and css files
grep -Hrn --exclude=*.{js,css} footer . | grep javascript

# search for text excluding specified dir
grep -R --exclude-dir=node_modules 'some pattern' /path/to/search

# copy stuff but exlude files listed in file
rsync -avz --exclude-from 'exclude-list.txt' source/ destination/

# move stuff and exclude the .git dir
rsync -av --progress source/ destination/ --exclude .git --delete

# execute command multiple times
for i in {1..5}; do mkdir unit$i; done

