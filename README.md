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

# Options

| Parameter                     | Description                                  |
| ----------------------------- | -------------------------------------------- |
| -d, --delimiter DELIM         | Use DELIM instead of whitespace              |
| -o, --output-delimiter STRING | Use DELIM instead of input delimiter         |
| -t, --text                    | Output simple text table (data in memory!)   |
| -h, --html                    | Output simple html table records <tr>...     |
| --thead [html-attributes]     | Add <thead>(1st line),<tbody> tags to html   |
| --tbody [html-attributes]     | Add <tbody> tags to html output              |
| --tfoot [html-attributes]     | Add <tfoot>(last line),<tbody> tags to html  |
| -f, --fields LIST             | Select fields                                |
| -c, --characters LIST         | Select characters                            |
| -?, --help                    | Help                                         |
| -v, --version                 | Show program version and license information |

# LIST format

* LIST format is selection[,selection,...] where selection is:
  * n    # exact n
  * -n   # -1 is the last, -2 is next to last, ...
  * n..m # n upto m - both can be negative
  * n..  # n to end - n can be negative
* field and character selection can be combined
* character selections separated with ',' differ from ranges with '..'

# Examples

```bash
cutz -d: -f1 -h --tbody id=abc /etc/passwd # login - html
df -h | cutz -f3..4,6.. -t --thead # used free mount - colored text table
df | tail -n +2 | cutz -f-2.. -o';' # use;mountpoint - csv
cutz -f1,-2 -d: -h --tbody -- /etc/passwd # login home - html
cutz -d';' -f-1..1 test.csv # reverse csv file
```

