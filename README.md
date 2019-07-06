[![Build Status](https://travis-ci.com/susu9/pick-patch.svg?branch=master)](https://travis-ci.com/susu9/pick-patch)
[![Python Compatibility](https://img.shields.io/badge/python-2.7%20%7C%203.3%20%7C%203.4%20%7C%203.5%20%7C%203.6-blue.svg)](https://travis-ci.com/susu9/pick-patch)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/susu9/pick-patch.svg)
![GitHub](https://img.shields.io/github/license/susu9/pick-patch.svg)
# pick-patch
Help you cherry pick patches from Gerrit server

# Setup
You may want to customize following variables in pick-patch
```
REPO = 'repo'
CONNECT_TIMEOUT = 30
FETCH_PROTOCOL_ORDER = 'http ssh git'
DEFAULT_NETRC_PATH = '~/.netrc'
DEFAULT_GERRIT_SERVER = 'TBD'
DELIMITER = '-' * 80
PREVIEW = 'git log --no-decorate -1'
```

# Features
1. Input a list of change numbers, pick-patch can help you cherry pick patches from Gerrit server
2. Reolve install path automatically (if your project is created by Repo). You can cherry pick
   multiple patches in different repositories at the same time
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
# Configuration
1. Get user name and http password in gerrit setting webpage (ex. https://review.gerrithub.io/settings/#HTTPCredentials)
2. Add user name and http password in ~/.netrc (ex. machine review.gerrithub.io login susu9 password XXXOOOXXXOO)
3. Now you are good to go. (script parses ~/.netrc by default)

# Example
```
# Get patch https://review.gerrithub.io/c/susu9/pick-patch/+/460654
pick-patch -g https://review.gerrithub.io -i . 460654
```

# Usage
```
usage: pick-patch [-h] [-u USER] [-p PASSWORD] [-q QUERY] [-r PREVIEW]
                  [-g GERRIT] [-d] [-n NETRC] [-i INSTALL_PATH] [-F] [-N]
                  [-x EXEC] [-v]
                  [change_num [change_num ...]]

positional arguments:
  change_num            ex. 12345, 12345/1

optional arguments:
  -h, --help            show this help message and exit
  -u USER, --user USER  gerrit user id
  -p PASSWORD, --password PASSWORD
                        gerrit HTTP password
  -q QUERY, --query QUERY
                        query command ex.
                        branch:master+status:merged+after:2018-11-17
  -r PREVIEW, --preview PREVIEW
                        preview command for changes ex. git log --oneline -1
  -g GERRIT, --gerrit GERRIT
                        gerrit server url ex. https://gerrit.mycompany.com
  -d, --dryrun          show what would be done
  -n NETRC, --netrc NETRC
                        assign netrc path ex. ~/.netrc
  -i INSTALL_PATH, --install-path INSTALL_PATH
                        assign install path rather than resolving from repo
                        command
  -F, --full-path       display the full install path instead of the relative
                        install path
  -N, --name-path       display the project name instead of the relative
                        install path
  -x EXEC, --exec EXEC  append command after all changes installed in each
                        project
  -v, --verbose         show more logs
```
