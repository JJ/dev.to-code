#!/usr/bin/env python

import re
import sys
import pprint

pp = pprint.PrettyPrinter(indent=4)

match = re.findall("\*(\w+)\*", sys.argv[1])
pp.pprint( match )

this_string = sys.argv[1]
while match is not None:
    match = re.search("\*(\w+)\*", this_string )
    pp.pprint( match )
    if match is not None:
        print( match.group(1) )
        this_string = this_string[match.start(1):]

