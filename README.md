# pick-patch
Help you cherry pick patches from Gerrit server

# Setup
You may want to customize following variables in pick-patch
```
REPO = 'repo'
CONNECT_TIMEOUT = 30
FETCH_PROTOCOL_ORDER = ['http', 'ssh', 'git']
DEFAULT_NETRC_PATH = "~/.netrc"
DEFAULT_GERRIT_SERVER = "TBD"
DELIMITER = "-" * 80
```

# Features
Input a list of change ids, pick-patch can help you cherry pick patches from Gerrit server
```
$pick-patch -g https://gerrit.mycompany.com 1234 5566 7788/1
Getting patches from 'https://gerrit.mycompany.com' ...
Installing patches ...
[kernel]
Pick: https://gerrit.mycompany.com/kernel refs/changes/34/1234/5
------------------------------------------------------------
...
------------------------------------------------------------
[middleware]
Pick: https://gerrit.mycompany.com/middleware refs/changes/66/5566/3
------------------------------------------------------------
...
------------------------------------------------------------
[app]
Pick: https://gerrit.mycompany.com/middleware refs/changes/88/7788/1
------------------------------------------------------------
...
------------------------------------------------------------
```

# Usage
```
usage: pick-patch [-h] [-u USER] [-p PASSWORD] [-g GERRIT] [-d] [-n NETRC]
                  [-i INSTALL] [-v]
                  change_id [change_id ...]

positional arguments:
  change_id             ex. 12345, 12345/1

optional arguments:
  -h, --help            show this help message and exit
  -u USER, --user USER  gerrit user id
  -p PASSWORD, --password PASSWORD
                        gerrit HTTP password
  -g GERRIT, --gerrit GERRIT
                        gerrit server url ex. https://gerrit.mycompany.com
  -d, --dryrun          show what would be done
  -n NETRC, --netrc NETRC
                        assign netrc path ex. ~/.netrc
  -i INSTALL, --install INSTALL
                        assign install path rather than resolving from repo
                        command
  -v, --verbose         show more logs
```
