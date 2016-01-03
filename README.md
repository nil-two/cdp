cdp
===

Change the shell working directory to parent directory.

```
$ pwd
/path/to/working/directory

$ cdp to
(cd to /path/to)

$ cdp
(cd to /path/to/working)

$ cdp [TAB]
↓
$ cdp /path/to/working[TAB]
↓
$ cdp /path/to[TAB]
↓
$ cdp /path
(cd to /path)

$ cdp to[TAB]
↓
$ cdp /path/to
(cd to /path/to)
```

Requirements
------------

- bash

Installation
------------

```sh
sudo wget https://raw.github.com/kusabashira/cdp/master/cdp.bash -O /etc/bash_completion.d/cdp.bash
```

License
-------

MIT License

Author
------

kusabashira <kusabashira227@gmail.com>
