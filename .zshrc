# 補完
# for zsh-completions
 fpath=(/usr/local/share/zsh-completions $fpath)
# 補完機能を有効にする
autoload -Uz compinit
compinit -u

# 色を使用出来るようにする
autoload -Uz colors
colors

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY

# 他のターミナルとヒストリーを共有
setopt share_history

plugins=(git ruby osx bundler brew rails emoji-clock)

#aliasの設定

alias iterm='open -a iTerm.app -n' # 律儀に .app まで書いてますが、 'open -a iterm' でも大丈夫です
alias firefox='open -a Firefox.app --background'
alias chrome='open -a "Google Chrome.app" --background'
alias safari='open -a Safari.app --background'
alias opera='open -a Opera.app --background'
alias macvim='open -a MacVim.app -n'
alias atom='open -a Atom.app'

alias finder='open .'
alias slack='open -a Slack.app'

alias s='sudo'
alias ex='exit'
alias cd..='cd ..'

alias bri='brew install'
alias brs='brew search'
alias brr='brew remove'
alias bru='brew uninstall' # remove も uninstall も機能同じ
alias bci='brew cask install'
alias bcs='brew cask search'
alias bcr='brew cask remove'
alias bcu='brew cask uninstall'

alias em='emacs'
alias vi='vim'
alias py='python'
alias py3='python3'
alias g='git'
alias gad='git add .'

alias cdHome='cd ~/'
alias cdc='cd /'
alias cddoc='cd ~/Documents'
alias cdDownload='cd ~/Downloads'
alias cdSkype='cd ~/Downloads/Skype'
alias cdPlugin='cd ~/Plugin'

alias cdEmacs='cd ~/.emacs.d'


## ####################################################################
## @ コマンド

# エイリアス定義をリセット
##  unalias -a

# builtin
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# coreutils
alias ls='ls -aG' # -a は、隠しファイルを含めたすべての表示、-G は、フォルダーとファイルを分けて色付けしてくれるように
alias ll='ls -al'
alias cp='cp -i -p' # -i によって、確認メッセージが出る。ファイル数が多い場合は邪魔になるので注意
alias mv='mv -i'
alias rm='rm -i'

#### gnupack にあったマクロ
# ANISカラーコード表示
function ansi_color {
    for a in 3 4 ; do
        for b in 0 1 2 4 7 ; do
            for n in ${a}0 ${a}1 ${a}2 ${a}3 ${a}4 ${a}5 ${a}6 ${a}7 ; do
                echo -en "\e[${b};${n}m"
                echo -n  "\e[${b};${n}m"
                echo -ne "\e[0m"
                echo -n  "  "
            done
            echo
        done
        echo
    done
}
