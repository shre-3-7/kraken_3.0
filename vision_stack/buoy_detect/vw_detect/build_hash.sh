#!/bin/bash
vw -d "$*" --oaa 4 -c -f model.vw
if [ ! -f vw_in.txt ]; then
  for h in {0..180}
  do
    for s in {0..255}
     do
      for v in {0..255}
       do
        echo " | $h $s $v" >> vw_in.txt
      done
    done
  done

  echo "Input for vw built";
else
  echo "Input for vw already exists";
fi

vw -t --quiet -p vw_out.txt -i model.vw < vw_in.txt  &&

tr -d '\n' < vw_out.txt > hash.txt &&
echo "hash generated"