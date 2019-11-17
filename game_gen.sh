#!/bin/bash
[ "$#" -lt "4" ] && echo "Indiquer le dossier d'entree, un nombre de joueur, un nombre de partie, ainsi qu'un nombre de dossier sous jacent à l'entree" >&2 && exit 1
entree="$1"
max1="$2"
max2="$3"
nsj="$4"
[ ! -e "$entree" ] && mkdir $entree
cd "$entree"
i=""
while [ "${#i}" -lt "$nsj" ];do
	mkdir "D${#i}"
	chmod "a+wr" "D${#i}"
	i="$i "
done

i=""
while [ "${#i}" -lt "$max2" ];do
	n="${RANDOM}"
	n1="$((n%max1))"
	j1="J$n1"
	n="${RANDOM}"
	n2="$((n%max1))"
	j2="J$n2"
	n="${RANDOM}"
	n3="$((n%3))"
	n4="$((1-n3))"
	[ "$n3" -eq "2" ] && n3="1/2" && n4="1/2"
	n="${RANDOM}"
	r="$((n%3+1))"
	n="${RANDOM}"
	k="$((n%nsj))"
	folder="D$k"
	cd "$folder"
	file="P${#i}.pgn"
	echo "" > "$file"
	echo "[Black \"$j1\"]" >> "$file"
	echo "[White \"$j2\"]" >> "$file"
	echo "[Date \"2019.11.17\"]" >> "$file"
	echo "[Round \"$r\"]" >> "$file"
	echo "[Result \"$n3-$n4\"]" >> "$file"
	i="$i "
	cd ".."
done

exit 0
