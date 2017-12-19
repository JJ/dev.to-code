#!/usr/bin/env python

import re
import sys
import pprint

pp = pprint.PrettyPrinter(indent=4)

match = re.findall("\*(\w+)\*", sys.argv[1])
pp.pprint( match )

match = re.search("\*(\w+)\*", sys.argv[1])
pp.pprint( match )
print( match.group(1) )
