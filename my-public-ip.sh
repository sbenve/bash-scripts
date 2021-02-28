#!/bin/bash
#la salida es la ip pública reportada por dyndns.org
curl -sf http://checkip.dyndns.org/|cut -d ':' -f 2|cut -d '<' -f1|sed -e 's/ //g'
