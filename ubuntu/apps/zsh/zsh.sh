#!/usr/bin/env bash

BASEDIR="$(cd "$(dirname "$0")" && pwd)"

## Instala My Zsh
sh -cI "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Força o caminho para o diretório custom se a variável não for reconhecida
ZSH_CUSTOM="${ZSH_CUSTOM:-/home/$USER/.oh-my-zsh/custom}"

echo ""  >> /home/$USER/.zshrc

echo -e "SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
  #line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SUFFIX=\" \""  >> /home/$USER/.zshrc

# Adiciona .bash_aliases para os seus scripts serem reconhecidos no zsh
echo -e "if [ -f ~/.bash_aliases ]; then\n\
    source ~/.bash_aliases\n\
fi\n" >> /home/$USER/.zshrc

# Instala tema spaceship
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
sed -Ei "s/^(ZSH_THEME=\").*(\")$/\1spaceship\2/" /home/$USER/.zshrc
sed -Ei "s/plugins=(git)/plugins=(git bgnotify)/g" /home/$USER/.zshrc

# Instala repositório de plugins
sh -cI "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"

# Adiciona syntax highlighting na hora da escrita de comandos;
echo "zplugin light zdharma/fast-syntax-highlighting" >> /home/$USER/.zshrc
# Sugere comandos baseados no histórico de execução conforme você vai digitando. É necessário apertar a seta para direita para completar;
echo "zplugin light zsh-users/zsh-autosuggestions" >> /home/$USER/.zshrc
# Adiciona autocomplete para ferramentas comuns como Yarn, Homebrew, NVM, Node, etc. É necessário apenas apertar TAB para completar;
echo "zplugin light zsh-users/zsh-completions" >> /home/$USER/.zshrc

# Nvm para o zsh
echo -e "export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm" >> /home/$USER/.zshrc

echo -e "$(cat /home/$USER/.bash_profile)" >> /home/$USER/.zshrc
