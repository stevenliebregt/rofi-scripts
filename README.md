# Rofi Scripts

This repository contains a couple of usefull [Rofi](https://github.com/DaveDavenport/rofi) scripts.

## Web search

The web search script opens a Rofi window which allows you to select a site to
search on. Then it shows you another screen with a list of previous search
queries. Here you can either select an old one, or search something else.

After pressing enter on entering a search query, the script will open a browser
tab with the requested site and search query.

### Dependencies

* [Rofi](https://github.com/DaveDavenport/rofi) (duh)

### Usage

`web-search.sh`

#### Options

**-h**

Use this flag to show the help.

`web-search.sh -h`

**-s**

Use this flag to set the site to search on. By default this is empty, which makes Rofi show you another window in which you can choose the site manually.

`web-search.sh -s <site name>`

You can use the following options:

* google (https://www.google.com/search?q=)
* stackoverflow (https://www.stackoverflow.com/search?q=)
* github (https://www.github.com/search?q=)
* youtube (https://www.youtube.com/results?search_query=)
* superuser (https://www.superuser.com/search?q=)

**-b**

Use this flag to set the browser executable to use, by default the `google-chrome-stable` executable is used.

`web-search.sh -b <browser executable>`

## License

This repository is licensed under the `MIT` license. To view the full license,
please refer to the `LICENSE.md` file in the root of the repository.