cdp
===

![CI](https://github.com/nil2nekoni/cdp/workflows/CI/badge.svg)

Chdir to the parent directory.

```
$ pwd
/path/to/working/directory

$ cdp <TAB>
$ cdp /path/to/working<TAB>
$ cdp /path/to<TAB>
$ cdp /path
(cd to /path)
```

Usage
-----

```
usage:
  cdp [--] <dir>  # chdir to the directory
  cdp -w <shell>  # output the wrapper script
  cdp -h          # print usage

supported-shells:
  bash
```

Requirements
------------

- Perl (5.14.0 or later)

Installation
------------

1. Copy `cdp` into your `$PATH`.
2. Make `cdp` executable.
3. Add following config to your shell's rc file.

| Shell |                       |
|-------|-----------------------|
| Bash  | eval "$(cdp -w bash)" |

### Example

```
$ curl -L https://raw.githubusercontent.com/nil2nekoni2/cdp/master/cdp > ~/bin/cdp
$ chmod +x ~/bin/cdp
$ echo 'eval "$(cdp -w bash)"' >> ~/.bashrc
```

Note: In this example, `$HOME/bin` must be included in `$PATH`.

Commands
--------

### cdp [--] \<directory\>

Chdir to the directory.

```
$ cdp /path/to/working
(Chdir to /path/to/working)

$ cdp /path
(Chdir to /path)
```

### cdp -w \<shell\>

Output the wrapper script.

Supported shells are as follows:

- bash

```
$ eval "$(cdp -w bash)"
(Enable the shell integration for bash)
```

### cdp -h

Print usage.

```
$ cdp -h
(Print usage)
```

License
-------

MIT License

Author
------

nil2 <nil2@nil2.org>
