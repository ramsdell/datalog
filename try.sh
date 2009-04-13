#! /bin/sh

for i in *.prolog
do
  b=`basename $i .prolog`
  ./datalog $i | sort > $b.out
  diff -u $b.txt $b.out
done
