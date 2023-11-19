# uhead

Inspired by https://codingchallenges.fyi/challenges/challenge-head

Head is a command line tool that displays the first n lines or bytes of a file, where the user can provide the value for n. If no file or value for n is provided then it displays the first 10 lines from the standard input.

This challenge is a good way for me to familiarise myself with unix commands and shell scripting.

To set up, add the following alias to `~/.bashrc` or `~/.zshrc`: `alias uhead=bash /{filepath}/uhead/uhead.sh`

Interesting commands to try:

- `uhead -c1000 /{filepath}/uhead/test1.txt`
- `uhead -c1000 /{filepath}/uhead/test2.txt`
- `uhead -n50 /{filepath}/uhead/test1.txt`
- `uhead -n50 /{filepath}/uhead/test2.txt`
- `uhead`
