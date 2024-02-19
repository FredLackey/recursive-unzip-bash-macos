#! /bin/bash


count-unzipped() {

    # Check if an argument is provided
    if [ "$#" -ne 1 ]; then
        echo "Usage: delete-unzipped <starting_folder>"
        return 1
    fi

    starting_folder="${1%/}"  # Remove trailing slash, if any

    count=0
    # Find all .zip files in the given folder and its subdirectories
    while IFS= read -r zip_file; do
        # Extract the filename without extension
        folder_name="${zip_file%.*}"
        # Check if a folder with the same name exists
        if [ ! -d "$folder_name" ]; then
            ((count++))
        fi
    done < <(find "$starting_folder" -type f -name "*.zip")
    echo "$count"
}


delete-unzipped() {
    # Check if an argument is provided
    if [ "$#" -ne 1 ]; then
        echo "Usage: delete-unzipped <starting_folder>"
        return 1
    fi

    starting_folder="${1%/}"  # Remove trailing slash, if any

    # Check if the provided path is a valid directory
    if ! [ -d "$starting_folder" ]; then
        echo "Error: '$starting_folder' is not a valid directory."
        echo "Usage: delete-unzipped <starting_folder>"
        return 1
    fi

    find "$starting_folder" -name "*.zip" -exec sh -c '
        folder="${1%.*}"
        if [ -d "$folder" ]; then
            rm "$1"
        fi
    ' _ {} \;
}

unzip-zips() {

    # Check if an argument is provided
    if [ "$#" -ne 1 ]; then
        echo "Usage: unzip-zips <starting_folder>"
        return 1
    fi

    starting_folder="${1%/}"  # Remove trailing slash, if any

    # Check if the provided path is a valid directory
    if ! [ -d "$starting_folder" ]; then
        echo "Error: '$starting_folder' is not a valid directory."
        echo "Usage: unzip-zips <starting_folder>"
        return 1
    fi

    find "$starting_folder" -name "*.zip" -exec sh -c 'if [ ! -d "${1%.*}" ]; then unzip -d "${1%.*}" "$1"; fi' _ {} \;
}

recursive-unzip() {
    # Check if an argument is provided
    if [ "$#" -ne 1 ]; then
        echo "Usage: recursive-unzip <starting_folder>"
        return 1
    fi

    starting_folder="${1%/}"  # Remove trailing slash, if any

    # Check if the provided path is a valid directory
    if ! [ -d "$starting_folder" ]; then
        echo "Error: '$starting_folder' is not a valid directory."
        echo "Usage: recursive-unzip <starting_folder>"
        return 1
    fi

    # Loop until there are no more .zip files to process
    while [ "$(count-unzipped "$starting_folder")" -gt 0 ]; do
        unzip-zips "$starting_folder"
        delete-unzipped "$starting_folder"
    done
}