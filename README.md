# rgrep
The grep command line utility from UNIX-like systems, implemented in Ruby.

## How to use
On UNIX-like systems, use the command:

```$ path/to/rgrep/rgrep.rb [filename].txt```

On Windows:

```$ ruby path/to/rgrep/rgrep.rb [filename].txt```

## Options
- **-w \<word\>** looks for all lines containing the \<word\>, surrounded by whitespaces.
- **-p \<pattern\>** looks for all lines containing the ruby regex \<pattern\>
- **-v \<pattern\>** opposite of **-p**, looks for all lines not containing the \<pattern\>
- **-c** can only be used in combination with **-w**, **-p**, or **-v** to count the number of matches
- **-m \<pattern\>** can only be used in combination with **-w** or **-p** to return the matching part only
- deafult option is set to **-p**
