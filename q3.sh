#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <file1> <file2>"
    exit 1
fi

# Check if the files exist
if [ ! -f "$1" ]; then
    echo "Error: File '$1' does not exist."
    exit 1
fi

if [ ! -f "$2" ]; then
    echo "Error: File '$2' does not exist."
    exit 1
fi

# Function to calculate the SHA256 hash of a file
calculate_sha256() {
    sha256sum "$1" | cut -d ' ' -f 1
}

# Calculate the SHA256 hashes of the files if they exist
if [ -f "$1" ] && [ -f "$2" ]; then
    hash1=$(calculate_sha256 "$1")
    hash2=$(calculate_sha256 "$2")

    # Compare the hashes
    if [ "$hash1" == "$hash2" ]; then
        echo "The files $1 and $2 are identical."
        exit 0
    else
        echo "The files $1 and $2 are different."
        exit 1
    fi
fi
