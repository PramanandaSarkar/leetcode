#!/bin/bash

# Environment check
if ! command -v javac &>/dev/null || ! command -v java &>/dev/null; then
    echo "Java is not installed. Please install Java to run .java files."
    exit 1
fi

if ! command -v python3 &>/dev/null; then
    echo "Python3 is not installed. Please install Python3 to run .py files."
    exit 1
fi

if ! command -v tsc &>/dev/null || ! command -v node &>/dev/null; then
    echo "Node.js or TypeScript is not installed. Please install them to run .ts files."
    exit 1
fi

# Function to run the specified file
run_file() {
    DIR=$1
    EXT=$2
    FILE="$DIR/*.$EXT"

    # Check if files matching the extension exist in the specified directory
    FILE_MATCHES=$(ls $FILE 2>/dev/null)
    if [ -z "$FILE_MATCHES" ]; then
        echo "No files found with the .$EXT extension in directory $DIR."
        exit 1
    fi

    for FILE in $FILE_MATCHES; do
        echo "Running $FILE..."

        case $EXT in
            java)
                javac "$FILE" && java -cp "$DIR" $(basename "$FILE" .java)
                ;;
            py)
                python3 "$FILE"
                ;;
            ts)
                tsc "$FILE" && node "${FILE%.ts}.js"
                ;;
            *)
                echo "Unsupported file extension. Please use 'java', 'py', or 'ts'."
                exit 1
                ;;
        esac
    done
}

# Check for arguments
if [ $# -ne 2 ]; then
    echo "Usage: ./run.sh <directory_name> <file_extension (java|py|ts)>"
    exit 1
fi

# Run the file based on the arguments
run_file "$1" "$2"
