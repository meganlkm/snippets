#!/bin/bash

# javafy regex
REGEX='/^\d{5}\\(?:[-\s]\d{4})?$/'
sed 's/\\/\\\\/g' <<< $REGEX

echo '/^\d{5}\\(?:[-\s]\d{4})?$/' | sed 's/\\/\\\\/g'


