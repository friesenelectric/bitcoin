Bikcoin-Qt version 0.8.3 is now available from:
  http://sourceforge.net/projects/bikcoin/files/Bikcoin/bikcoin-0.8.3/

This is a maintenance release to fix a denial-of-service attack that
can cause nodes to crash.

Please report bugs using the issue tracker at github:
  https://github.com/bikcoin/bikcoin/issues

0.8.3 Release notes

Truncate over-size messages to prevent a memory exhaustion attack.

Fix a regression that causes excessive re-writing of the 'peers.dat' file.


Thanks to Peter Todd for responsibly disclosing the vulnerability
( CVE-2013-4627 ) and creating a fix.
