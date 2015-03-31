# dottr
A place for dotfile snippets which are not worth creating a new repository but are still non-trivial. Or with other words: Snippets which needed a good amount of time to create and tune. The snippets are simply sourced using a `fry` for every environment.

## Usage
1. Clone this repo.
2. Follow the instructions for every environment you like.

### ZSH
Source the `fry.zsh` once in your `.zshrc` to get the command `fry`:
```sh
source [path to where you cloned dottr]/fry.zsh
```
Then simply declare every snippet you want to use with `fry`:
```sh
fry ncserve
```

## Somebody out there?
When we started this project we didn't know an alternative doing exactly this. If you know one, please tell us in the issues. We are interested to merge.
