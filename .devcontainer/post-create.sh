#!/usr/bin/env bash

if [ -f package.json ]; then
  bash -i -c "nvm install --lts && nvm install-latest-npm"
  npm i
  npm run build
fi

# Install dependencies for shfmt extension
curl -sS https://webi.sh/shfmt | sh &>/dev/null

# Add OMZ plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
sed -i -E "s/^(plugins=\()(git)(\))/\1\2 zsh-syntax-highlighting zsh-autosuggestions\3/" ~/.zshrc

# Ignore credential helpers forwarded from the host (empty value resets the list)
# and cache credentials entered in this container for 1 hour instead
git config --local --unset-all credential.helper || true
git config --local --add credential.helper ""
git config --local --add credential.helper "cache --timeout=3600"

# Avoid git log use less
echo -e "\nunset LESS" >>~/.zshrc
