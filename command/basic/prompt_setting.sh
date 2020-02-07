# https://wiki.archlinux.jp/index.php/Bash プロンプトのカスタマイズ

# 対応色を一覧で表示する・文字色として
for i in {0..255}; do
  tput setaf $i
  echo -n "$i "
done

# 対応色を一覧で表示する・背景色として
for i in {0..255}; do
  tput setab $i
  echo -n "$i "
done

# シェルスクリプトとかで色変更して文字表示する場合、これだと分かりにくい
printf '\033[1;31mRED\033[m \033[1;32mGREEN\033[m\n'
printf '\033[1;33mYELLOW\033[m \033[1;35mPINK\033[m\n'

# 黒背景で見やすい色を定義しておく
RED="$(tput setaf 9)"
GREEN="$(tput setaf 10)"
YELLOW="$(tput setaf 11)"
PINK="$(tput setaf 13)"
ORANGE="$(tput setaf 209)"
RESET="$(tput sgr0)"

# 見通しが良くなる
echo "${RED}RED${RESET} ${GREEN}GREEN${RESET}"
printf "${YELLOW}YELLOW${RESET} ${PINK}PINK${RESET} ${ORANGE}ORANGE${RESET}\n"

# PS1設定用
_RED="\[$(tput setaf 9)\]"
_GREEN="\[$(tput setaf 10)\]"
_YELLOW="\[$(tput setaf 11)\]"
_PINK="\[$(tput setaf 13)\]"
_ORANGE="\[$(tput setaf 209)\]"
_RESET="\[$(tput sgr0)\]"

# 定数を使ったPS1設定も見通しが良くなる
export PS1="${_GREEN}[\w]${_RESET}${_YELLOW}\$(__git_ps1)${_RESET}\n\$ "

# SSH接続先用の設定
export PS1="\[\e[1;35m\](gcp)\[\e[00m\] \[\e[1;33m\][\w]\[\e[00m\]\n\$ "
export PS1="\[\e[1;35m\](aws)\[\e[00m\] \[\e[1;33m\][\w]\[\e[00m\]\n\$ "
