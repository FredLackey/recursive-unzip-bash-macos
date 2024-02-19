# Recursive Unzip Using BASH in MacOS (`recursive-unzip-bash-macos`)  

Set of four BASH functions that can be used independently or together.  When used together they recursively unzip files and remove the original zip files.  Sometimes a zip file can contain other zip files.  This set of functions will unzip all files in a directory and its subdirectories and then delete the original zip files.

## General Instructions

Your environment will most certainly be different than mine.  In my case, I have a `~/.bash_functions` file where all of my BASH functions are stored.  I then source this file in my `~/.bash_profile` file.  You may only have a `~/.bashrc` file.  If so, you could simply add these functions to that file.  If you have neither, you could create a `~/.bash_functions` file and source it in your `~/.bashrc` file.  The choice is yours.

## Terminology & Definitions

### Unzipped  

For a file to be considered "unzipped" a folder of the same name must exist in the same location.  When unzipped, the file `my_archive.zip` will be seen as:

    ```bash
    my_archive.zip
    my_archive/
    ```

## Functions

### `count-unzipped`

Takes a directory as an argument and returns a count of the number of unzipped files in the directory and its subdirectories.

```bash
Usage: delete-unzipped <starting_folder>
```

### `delete-unzipped`

Takes a directory as an argument and deletes all unzipped files in the directory and its subdirectories.

```bash
Usage: delete-unzipped <starting_folder>
```

### `unzip-zips`

Takes a directory as an argument and unzips all zip files in the directory and its subdirectories.

```bash
Usage: unzip-zips <starting_folder>
```

### `recursive-unzip`

Takes a directory as an argument and unzips all zip files in the directory and its subdirectories and then deletes the original zip files.

```bash
Usage: recursive-unzip <starting_folder>
```

## Contact  

If you have any questions, comments, or concerns, please feel free to reach out.  

**Fred Lackey**  
[fred.lackey@gmail.com](mailto:fred.lackey@gmail.com)  
[https://fredlackey.com](https://fredlackey.com)  