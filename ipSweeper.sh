#!/bin/bash
touch List.txt && chmod +rwx List.txt
for ip in `seq 1 254` ; do
ping -c 1 $1.$ip | grep  "64 bytes" | cut -d " " -f 4| tr -d ":" & 
done >> List.txt
sudo nmap -sS -P 80 -T4 --iL /home/lunatix/Desktop/List.txt >> nmap.txt
