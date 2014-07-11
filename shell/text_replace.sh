#!/bin/bash

# javafy regex
REGEX='/^\d{5}\\(?:[-\s]\d{4})?$/'
sed 's/\\/\\\\/g' <<< $REGEX

echo '/^\d{5}\\(?:[-\s]\d{4})?$/' | sed 's/\\/\\\\/g'

# perl one liner
perl -pi -e 's/str_to_find/replace_with_this_str/g' file.txt

# get current external ip
wget -q -O - checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//'

# sed - on a mac use -i '' otherwise leave it out
sed -i '' s/str_to_find/replace_with_this_str/g file.txt
sed s/replacethis/withthis/g < existingfile > newfile

# remove all html tags
html="<b><div class='classname'>div text</div></b><i>This is some text.</i>"
sed 's/<[^>]*>//g' <<< "$html"
sed -e :a -e 's/<[^>]*>//g;/</N;//ba' <<< $html

# recursively search for example.com and replace with frpoc.local
grep -lr 'example.com' . | xargs sed -i '' 's/example.com/frpoc.local/g'

# useful one-liners
# http://sed.sourceforge.net/sed1line.txt

# replace comma with new line - outputs to stdout
tr , '\n' < file.txt


TEST=thistext
# to upper case
TEST2=$(echo $TEST | tr '[:lower:]' '[:upper:]')
# to lower case
TEST2=$(echo $TEST | tr '[:upper:]' '[:lower:]')


