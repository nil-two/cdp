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
```

Requirements
------------

- bash

Installation
------------

```sh
sudo wget https://raw.github.com/kusabashira/cdp/master/cdp.bash -O /etc/bash_completion.d/cdp.bash
```

Behavior
---------

Get the directory which match in the left end to the first argument,
and then cd to the directory.

If no arguments, cd to the parent directory.

License
-------

MIT License

Author
------

kusabashira <kusabashira227@gmail.com>
