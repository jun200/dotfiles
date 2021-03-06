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
alias airmail='open -a Airmail2.app'
alias alternote='open -a Alternote.app'

alias byword='open -a Byword.app'
alias coda='open -a Coda.app'
alias coteditor='open -a CotEditor.app'
alias dayone='open -a Dayone.app'
alias iawriter='open -a iA Writer.app'
alias janetterpro='open -a Janetter_Pro.app'
alias marsedit='open -a MarsEdit.app'
alias mi='open -a mi.app'
alias sourcetree='open -a SourceTree.app'
alias transmit='open -a Transmit.app'
alias tree2='open -a Tree 2.app'
alias tweetbot='open -a Tweetbot.app'
alias ulysses='open -a Ulysses.app'
alias yoruFukurou='open -a YoruFukurou.app'
alias forkLift='open -a ForkLift.app'


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

# git関連の設定
# ここはプロンプトの設定なので今回の設定とは関係ありません
if [ $UID -eq 0 ];then
# ルートユーザーの場合
PROMPT="%F{red}%n:%f%F{green}%d%f [%m] %%
"
else
# ルートユーザー以外の場合
PROMPT="%F{cyan}%n:%f%F{green}%d%f [%m] %%
"
fi


# ブランチ名を色付きで表示させるメソッド
function rprompt-git-current-branch {
  local branch_name st branch_status

  if [ ! -e  ".git" ]; then
    # gitで管理されていないディレクトリは何も返さない
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # 全てcommitされてクリーンな状態
    branch_status="%F{green}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # gitに管理されていないファイルがある状態
    branch_status="%F{red}?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # git addされていないファイルがある状態
    branch_status="%F{red}+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # git commitされていないファイルがある状態
    branch_status="%F{yellow}!"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # コンフリクトが起こった状態
    echo "%F{red}!(no branch)"
    return
  else
    # 上記以外の状態の場合は青色で表示させる
    branch_status="%F{blue}"
  fi
  # ブランチ名を色付きで表示する
  echo "${branch_status}[$branch_name]"
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

# プロンプトの右側(RPROMPT)にメソッドの結果を表示させる
RPROMPT='`rprompt-git-current-branch`'
