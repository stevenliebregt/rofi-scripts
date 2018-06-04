#!/usr/bin/env bash
#
# Rofi script for searching the web.

set -u
set -e

declare -A SITES

SEARCH_ENGINE=""

CACHE_DIR="$HOME/.rofi-search-cache"
BROWSER="google-chrome-stable"

SITES=(
    ["google"]="https://www.google.com/search?q="
    ["stackoverflow"]="https://www.stackoverflow.com/?q="
)

# Show usage for the script.
usage()
{
    echo "Usage: $0 [-s <string>]"
    echo "  -s <string>     give the search engine to use"
    exit 1
}

# Creates the cache directory if it does not exist.
create_cache_dir() {
    if [ ! -d "$CACHE_DIR" ]; then
        mkdir "$CACHE_DIR"
    fi
}

# Create the cache files if they do not exist.
create_cache_files() {
    for site in "${!SITES[@]}"
    do
        if [ ! -f "$CACHE_DIR/$site.txt" ]; then
            touch "$CACHE_DIR/$site.txt"
        fi
    done
}

# Generate the list of sites.
#
# If a config file exists, use the sites from that list, otherwise populate
# the list with the sites from the $SITES variable.
gen_sites_list() 
{
    for site in "${!SITES[@]}"
    do
        echo "$site"
    done
}

# Generate the list of previously used search queries.
gen_queries_list() 
{
    site=$1
    
    cat "$CACHE_DIR/$site.txt"
}

# Handle the query.
handle_query()
{
    echo "query: $@"
}

main()
{
    create_cache_dir
    create_cache_files

    if [ "$@" ]
    then 
        handle_query "$@"
    else
        # Check if search engine set.
        if [ "$SEARCH_ENGINE" ]; then
            echo "$(gen_queries_list $SEARCH_ENGINE)" | rofi -dmenu -p "Search"
        else
            site=$(echo "$(gen_sites_list)" | rofi -dmenu -p "Search" -no-custom)
            query=$(echo "$(gen_queries_list $site)" | rofi -dmenu -p "Search")

            handle_query $query
        fi
    fi
}

# Get argument options.
while getopts "hs:" opt; do
    case $opt in
        h) usage
        ;;
        s) SEARCH_ENGINE="$OPTARG"
        shift
        ;;
        \?) usage
        ;;
    esac
    shift
done

main "$@"
