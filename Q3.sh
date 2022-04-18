#!/bin/bash
read file
no_of_lines=$(wc -l < $file )
no_of_words=$(wc -w < $file )
no_of_bytes=$(wc -c < $file )
echo "The size of the file in bytes: $no_of_bytes"
echo "The number of lines in the file is: $no_of_lines"
echo "The number of words in the file is: $no_of_words"

i=1
while IFS= read -r line; do
    echo "Line No: <$i> - Count of Words: $(echo "$line" | wc -w)"
    i=`expr $i + 1`
done < $file

inp="$file"
grep -E -o '\w++' "$inp" | sort >"temp.txt"
uniq -c "temp.txt" > "$inp"
while read -r line;
do
string=($line)
if (($((${string[0]}-1))==0))
then
continue
else
echo "Word : ${string[1]} - Count of Repetitions:$((${string[0]}-1))"
fi
done < "$inp"
rm "temp.txt"