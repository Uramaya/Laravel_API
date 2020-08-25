# bash
alias ..="cd .."
alias ...="cd ../.."
alias home='cd'
#ターミナルのプロンプトの色、表示の設定
PS1="\[\e[34m\]\u\[\e[33m\]@docker\[\e[32m\]:\w\$\[\e[0m\]"

# Laravel
function art() {
    php artisan "$@"
}
