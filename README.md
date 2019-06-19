# smagit - Standalone Magit

## Installation

You need recent Emacs (v25+) installed on your system. E.g., for MacOS you can find it at http://emacsformacosx.com/

Then clone this repository and put/link smagit script somewhere in your PATH.

    git clone https://github.com/maio/smagit.git
    cd smagit
    ln -s `pwd`/smagit /usr/local/bin/smagit

## Usage

Execute `smagit` in any Git repository. First run will fetch all necessary packages so it may take little bit longer than consecutive runs.

When everything goes OK, you should see Git status screen for your repository. You can get help by hitting `?` key.

![smagit status](https://raw.githubusercontent.com/maio/smagit/master/images/smagit.png)

You may also find [Magit Introduction](https://youtu.be/vQO7F2Q9DwA?t=2m44s) screencast useful.

## License

Copyright © 2016 Marian Schubert

MIT
