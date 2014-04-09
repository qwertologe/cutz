cutz(1) --  cuts similar to cut
===============================

## SYNOPSIS

cutz [options] [file ...]

## DESCRIPTION

Print selected parts of lines from each FILE to standard output.
Default input is stdin, default output is stdout.

## OUTPUT FORMATS

Default output format is csv. Optional output variants:

* html (table records with optional thead, tbody and tfoot)
* text (aligned; special ansi if used with thead and tfoot)

## OPTIONS

`-f, --fields LIST`
  Select fields

`-c, --characters LIST`
  Select characters

`-d, --delimiter DELIM`
  Use DELIM instead of whitespace

`-o, --output-delimiter STRING`
  Use DELIM instead of input delimiter

`-t, --text`
  Output simple text table (data in memory!)

`-h, --html`
  Output simple html table records (tr)...

`--thead [html-attributes]`
  Adds thead(1st line),tbody tags to html

`--tbody [html-attributes]`
  Adds tbody tags to html output

`--tfoot [html-attributes]`
  Adds tfoot(last line),tbody tags to html

`-a, --tall`
  Add all html tags or color to text layout

`-?, --help`
  Help

`-v, --version`
  Show program version and license information

## LIST FORMAT

LIST format is selection[,selection,...] where selection is:

    n    # exact n
    -n   # -1 is the last, -2 is next to last, ...
    n..m # n upto m - both can be negative
    n..  # n to end - n can be negative

Field and character selection can be combined.
Character selections separated with ',' are treated as separate fields
during output. Ranges with '..' are output as a single string.

## EXAMPLES

    cutz -d: -f1 -h --tbody id=abc /etc/passwd # login - html
    df -h | cutz -f3..4,6.. -t --thead # used free mount - colored text table
    df | tail -n +2 | cutz -f-2.. -o";" # use;mountpoint - csv
    cutz -f1,-2 -d: -h --tbody -- /etc/passwd # login home - html
    cutz -f1,-2 -d: --tb -h /etc/passwd # short version of above
    cutz -d";" -f-1..1 test.csv # reverse csv file
    free -m | cutz -tac1.. # colorize output (1st and last line)

## AUTHOR

Michael Arlt

## LICENSE

This is free software. You may redistribute copies of it under the terms of
the GNU General Public License (http://www.gnu.org/licenses/gpl.html)
There is NO WARRANTY, to the extent permitted by law.
License: GPLv3 - see http://www.gnu.org/licenses/gpl.html

## SEE ALSO

cut(1)

