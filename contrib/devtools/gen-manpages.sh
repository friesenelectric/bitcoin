#!/usr/bin/env bash

export LC_ALL=C
TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

BIKCOIND=${BIKCOIND:-$BINDIR/bikcoind}
BIKCOINCLI=${BIKCOINCLI:-$BINDIR/bikcoin-cli}
BIKCOINTX=${BIKCOINTX:-$BINDIR/bikcoin-tx}
BIKCOINQT=${BIKCOINQT:-$BINDIR/qt/bikcoin-qt}

[ ! -x $BIKCOIND ] && echo "$BIKCOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
BTCVER=($($BIKCOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for bikcoind if --version-string is not set,
# but has different outcomes for bikcoin-qt and bikcoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$BIKCOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $BIKCOIND $BIKCOINCLI $BIKCOINTX $BIKCOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${BTCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${BTCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
