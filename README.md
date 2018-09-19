# repo-pick
Help you cherry pick patches from Gerrit server

# Setup
You may want to customize following variables in repo-pick
```
REPO='repo'
CONNECT_TIMEOUT=30
FETCH_PROTOCOL_ORDER = ['http', 'ssh', 'git']
DEFAULT_GERRIT_SERVER = "TBD"
DEFAULT_NETRC_PATH = "~/.netrc"
```

# Features
Input a list of change ids, repo-pick can help you cherry pick patches from Gerrit server
```
$repo-pick 1234 5566 7788/1
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
usage: repo-pick [-h] [-u USER] [-p PASSWORD] [-g GERRIT] [-d] [-n NETRC]
                 [-i INSTALL]
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
```
