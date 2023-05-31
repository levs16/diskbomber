#!/bin/bash
# This script will create a prompted number of files with a prompted size in GB

# Ask the user for the number of files to create
read -p "How many files do you want to create? " num

# Validate the input as a positive integer
if ! [[ $num =~ ^[1-9][0-9]*$ ]]
then
    echo "Invalid input. Please enter a positive integer."
    exit 1
fi

# Ask the user for the size of each file in GB
read -p "What size do you want each file to be in GB? " size

# Validate the input as a positive integer
if ! [[ $size =~ ^[1-9][0-9]*$ ]]
then
    echo "Invalid input. Please enter a positive integer."
    exit 2
fi

# Loop through the number of files and create them with the specified size
for ((i=1; i<=num; i++))
do
    # Generate a random file name with 8 characters
    name=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 8)

    # Create the file with the specified size using dd command
    dd if=/dev/zero of="$name" bs=1G count="$size"

    # Print a message indicating the file creation
    echo "Created file $name with size $size GB"
done

echo "Done."
