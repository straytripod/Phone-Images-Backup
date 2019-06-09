#!/bin/bash
# Backs up image content from a MTP mounted phone.
# Configured to not discriminate, copies all files in the folder.
# Saves files in DICM to the desktop.
# This script may need to be modified depending on your directory structure Tested on an Adroid Moto G6.
# 3/3/2019 Jeffrey Marugg
# declaring vars
uuid=$(id -u)
home=~/Desktop/
# Set the Google File system mount point. You should varify this.
mount=/var/run/user/$uuid/gvfs
# Set full mount location with the existing mount host name.
phone=$(ls $mount | grep mtp:)
# Set the content locations we want to backup. You should hould varify this.
cfiles=$(ls -l $mount/$phone/'Internal shared storage'/DCIM/Camera/* | wc -l)
vid=$(ls $mount/$phone/'Internal shared storage'/DCIM/Camera/*.mp4 | wc -l)
pic=$(ls $mount/$phone/'Internal shared storage'/DCIM/Camera/*.jpg | wc -l)
# Lets Begin
clear
echo "-----------------------------------------------------------------------------"
echo "-- Welcome! This is the phone images backup progam.                        --"
echo "-- I am designed to work with Android phones.                              --"
echo "-- I will copy your images to your desktop.                                --"
echo "-- Please check the script comment to customize me and add features.       --"
echo "-----------------------------------------------------------------------------"
echo "-----------------------------------------------------------------------------"
sleep 3
clear
echo "YOUR PHONE MUST BE SET TO THE TRANSFER FILES MODE. PLEASE CHECK IT NOW."
echo "-----------------------------------------------------------------------"
sleep 1
echo "Are you ready to begin? (y/n) [Enter]"
read ans
if [ $ans = "y" ]; then
    clear
    echo "Alright! Let's get to it."
    sleep 3
    clear
    echo "I am going to look for your phone now."
    sleep 2
    if [ -d $mount/$phone/'Internal shared storage' ]; then
        clear
        echo "......................."
        sleep 2
        echo "Ok, I found the phone!"
        sleep 2
        clear
        echo I found a total of $cfiles files.
        sleep 3
        echo I see $vid native videos and $pic native pictures.
        sleep 3
        echo "I am going to save all the files here. [/home/[user]/Desktop/Phone]"
        sleep 3
        echo "Git'n Err done.... This my take a minute." 
        mkdir $home/Phone
        cp $mount/$phone/'Internal shared storage'/DCIM/Camera/* $home/Phone
        sleep 3
        clear 
        echo "All Done. Here is the list of files." 
        echo "-----------------------------------------------------------------"
        ls -l ~/Desktop/Phone
        # Uncomment to add delete feature
        #echo "-----------------------------------------------------------------"
        #echo " "
        #echo "Do you want me to delete the images from your phone? (y/n) [Enter]"
        #read ans
            #if [ $ans = "y" ]; then
            #rm $mount/$phone/'Internal shared storage'/DCIM/Camera/*
            #echo "The files have been removed"
            #ls -l $mount/$phone/'Internal shared storage'/DCIM/Camera/
            #fi
    else
        clear
        echo "Oh no. I was not able to find your phone. Please check it. See if you connected it and placed it in transfer mode."
        echo " "
        echo "[press any key to end]"
        read pause
    fi
else
    echo "OK, I'll see you later."
    echo "[press any key to end]"
    read pasue
fi
