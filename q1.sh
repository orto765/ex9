#!/bin/bash
#print the number of lines in the book
answer1=$(awk 'END{print NR}' aliceinwonderland.txt)
echo "Number of rows in the book = ${answer1}"

#print the number of rows with the word "Alice"
answer2=$(awk '/Alice/' aliceinwonderland.txt | awk 'END{print NR}') 
echo "Number of rows with the word Alice = ${answer2}"

#print the number of times ' Alice ' appears in the book
answer3=$(awk '/ Alice /' aliceinwonderland.txt | awk 'END{print NR}')
echo "Number of times ' Alice ' appears = ${answer3}"

#print the longest row in the book
echo "longest row in the book:"
awk 'NR==1{x=$0} length($0) > length(x) {x=$0} END{print x}' aliceinwonderland.txt

#print the top 5 most common words
echo "Top 5 common words:"
for word in $(cat aliceinwonderland.txt) ; do echo $word; done | awk '! /([[:punct:]]|[[:space:]])/' | awk '{a[$1]++}END {for (k in a) print a[k], k}' | sort -n -r | head -n 5
