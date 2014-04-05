cutz
====

'cutz' cuts similar to linux cut

# Syntax

cutz [options] [file ...]

# input/output

* default input is stdin
* output is stdout

# output formats

* default output format is csv
* optional output variants:
  * html (table records with optional thead, tbody and tfoot)
  * text (aligned; special ansi if used with thead and tfoot)

# LIST format

* LIST format is selection[,selection,...] where selection is:
  * n    # exact n
  * -n   # -1 is the last, -2 is next to last, ...
  * n..m # n upto m - both can be negative
  * n..  # n to end - n can be negative
* field and character selection can be combined
* character selections separated with ',' differ from ranges with '..'

# Examples

* cutz -d: -f1 -h --tbody id=abc /etc/passwd # login - html
* df -h | cutz -f3..4,6.. -t --thead # used free mount - colored text table
* df | tail -n +2 | cutz -f-2.. -o';' # use;mountpoint - csv
* cutz -f1,-2 -d: -h --tbody -- /etc/passwd # login home - html
* cutz -d';' -f-1..1 test.csv # reverse csv file

