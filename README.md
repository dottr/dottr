# dottr
A place for dotfile snippets (here: `yolks`) which are not worth creating a new repository but are still non-trivial. Or with other words: Snippets which needed a good amount of time to create and tune. Each `yolk` is simply sourced using the `fry` command, which exists for every environment (here: `pan`). With this approach, users (here: `chefs`) can share and improve their `yolks` together and keep their dotfiles (here: `kitchen`) clean. Tasty.

## Usage
1. Clone this repo.
2. Follow the instructions for every `pan` you like.

### ZSH - The Teflon Pan
Source the `pan.zsh` once in your `.zshrc` to get the command `fry`:
```sh
source [path to where you cloned dottr]/pan.zsh
```
Then simply declare every snippet you want to use with `fry` in your `.zshrc` or activate it on demand with:
```sh
fry ncserve
fry alias-usage-analysis
```

## Contribute
Please send in pull requests for your `yolks` and spread the word. It's also nice to include some words in the files about the usage and possibly the authors/sources. If you have any problem or idea, please [open an issue](https://github.com/dottr/dottr/issues/new).

## Somebody out there?
When we started this project we didn't know an alternative doing exactly this. If you know one, please tell us in the issues. We are interested to merge.
