# dottr
A place for dotfile snippets (here: `yolks`) which are not worth creating a new repository but are still non-trivial. Or with other words: Snippets which needed a good amount of time to create and tune. Each `yolk` is simply sourced using the `fry` command, which exists for every environment (here: `pan`). With this approach, users (here: `chefs`) can share and improve their `yolks` together and keep their dotfiles (here: `kitchen`) clean. Tasty.

## ZSH - The Teflon Pan
### Installation
Clone this repo and source the `pan.zsh` once in your `.zshrc` to get the command `fry`:
```sh
source [path to where you cloned dottr]/pan.zsh
```

If you are using [zgen](https://github.com/tarjoilija/zgen), load `dottr` with this line in your `.zshrc`:
```sh
zgen load dottr/dottr
```

### Usage

Then simply declare every snippet you want to use with `fry` in your `.zshrc` or activate it on demand with:
```sh
fry ncserve
fry alias-usage-analysis
```

The `yolks` have long names in order to avoid name clashes and encourage you to define your own aliases. Here are some examples:

```sh
alias imv='interactive-mv'
alias gsc='git-select-commit'
```

### Tab completion
You can activate tab completion for all zsh-yolks with:
```sh
fry completion
```

## git brunch
### Installation
You need to put `git-fry` in your path (for example in `.profile`):
```
export PATH="$PATH:[path to where you cloned dottr]/pan.git"
```

### Usage
Now you can execute predifined aliases with:
```sh
git fry word-based-diff HEAD~1
```

Create custom aliases in your `.gitconfig`:
```ini
[alias]
    dw = fry word-based-diff
    dws = fry word-based-diff --staged
```

## Contribute
Please send in pull requests for your `yolks` and spread the word. It's also nice to include some words in the files about the usage and possibly the authors/sources. If you have any problem or idea, please [open an issue](https://github.com/dottr/dottr/issues/new).
### Style
Write the names of the yolks in `kebap-case`.

## Somebody out there?
When we started this project we didn't know an alternative doing exactly this. If you know one, please tell us in the issues. We are interested to merge.
