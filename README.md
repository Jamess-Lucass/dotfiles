# dotfiles

## Setup

Ensure your system is up-to-date via `sudo apt update`

> To customize your setup with values you want, for example your own git credentials you first need to create a `values.yaml` file using the command below

```
    cd $HOME && mkdir -p .config/dotfiles && vim .config/dotfiles/values.yaml
```

There are two required values you must set. These are
`git_user_email` and `git_user_name` they can be setup like the following:

values.yaml

```
---
git_user_email: test@email.com
git_user_name: JohnDoe
```

## Install

`bash -c "$(curl -fsSL https://raw.githubusercontent.com/Jamess-Lucass/dotfiles/main/bin/dotfiles)"`
