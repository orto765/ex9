#!/bin/bash

#print the number of lines that has the word Sherlock or Holmes
answer1=$(sed -n -E '/(Sherlock|Holmes)/Ip' sherlockholmes.txt | wc -l)
echo "Number of lines that has the word Sherlock / Holmes = ${answer1}" 

#print the number of occurences of the words Sherlock + the number of occurences of the word Holmes
answer2=$( sed 's/[[:space:]]/\n/g' sherlockholmes.txt | sed -n -E '/(Sherlock|Holmes)/Ip' | wc -l) 
echo "Number of occurences of the words Sherlock + Holmes = ${answer2}"

#write command that substitute the name Sherlock with other name 
sed 's/Sherlock/Or/g' sherlockholmes.txt

#write command that replaces a place\people name with my name
sed -E -i 's/([A-Z][A-Za-z]+) ([A-Z][A-Za-z]+)/Or Toledano/g' sherlockholmes.txt

#write command that replace all the sentences in () to sentences in [] 
sed -i -E "s/\(([^\)]+)\)/\[\1\] /g" sherlockholmes.txt 
