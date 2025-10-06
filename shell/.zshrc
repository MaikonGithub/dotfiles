# Configuração do ZSH 
# Autor: Maikon

# ===============================================
# CONFIGURAÇÕES BÁSICAS
# ===============================================

# Variáveis de ambiente essenciais
export EDITOR=vim
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# ===============================================
# HISTÓRICO OTIMIZADO
# ===============================================

# Localização do histórico
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000

# Opções de histórico (técnicas testadas)
setopt HIST_IGNORE_DUPS          # Ignora duplicatas consecutivas
setopt HIST_IGNORE_ALL_DUPS      # Remove duplicatas antigas
setopt HIST_FIND_NO_DUPS         # Não mostra duplicatas na busca
setopt HIST_SAVE_NO_DUPS         # Não salva duplicatas
setopt HIST_REDUCE_BLANKS        # Remove espaços em branco extras
setopt HIST_VERIFY               # Verifica antes de executar
setopt SHARE_HISTORY             # Compartilha histórico entre sessões
setopt APPEND_HISTORY            # Anexa ao invés de sobrescrever
setopt INC_APPEND_HISTORY        # Anexa em tempo real

# ===============================================
# AUTO-COMPLETIONS ROBUSTAS
# ===============================================

# Carregar sistema de completions
autoload -Uz compinit
# Verificar se precisa recarregar (mais rápido)
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi

# Opções de completion (técnicas testadas)
setopt AUTO_LIST                 # Lista opções automaticamente
setopt AUTO_MENU                 # Menu de seleção
setopt COMPLETE_IN_WORD          # Completar no meio da palavra
setopt ALWAYS_TO_END             # Move cursor para o final
setopt LIST_PACKED               # Lista compacta
setopt LIST_ROWS_FIRST           # Lista em colunas

# Estilos de completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # Case insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"  # Cores do ls
zstyle ':completion:*' menu select                       # Menu de seleção
zstyle ':completion:*' group-name ''                     # Agrupa resultados
zstyle ':completion:*:descriptions' format '%B%d%b'      # Formato descrições

# ===============================================
# CONFIGURAÇÕES VISUAIS E INTERATIVAS
# ===============================================

# Carregar sistema de cores
autoload -U colors && colors

# Opções ZSH (técnicas testadas)
setopt PROMPT_SUBST              # Substituições no prompt
setopt AUTO_CD                   # cd automático
setopt CORRECT                   # Correção automática
setopt CORRECT_ALL               # Correção de todos os argumentos
setopt NO_CASE_GLOB              # Case insensitive globbing
setopt EXTENDED_GLOB             # Globbing estendido
setopt NOMATCH                   # Erro em patterns sem match
setopt NOTIFY                    # Notifica jobs em background

# Cores para macOS/Linux
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# ===============================================
# PROMPT MELHORADO (TÉCNICAS TESTADAS)
# ===============================================

# Função para mostrar branch Git (se disponível)
git_prompt_info() {
    if command -v git >/dev/null 2>&1; then
        local branch=$(git branch 2>/dev/null | sed -n '/\* /s///p')
        if [[ -n "$branch" ]]; then
            echo " (%{$fg[yellow]%}${branch}%{$reset_color%})"
        fi
    fi
}

# Prompt principal melhorado
PROMPT='%{$fg[cyan]%}%n@%m%{$reset_color%} %{$fg[blue]%}%1~%{$reset_color%}$(git_prompt_info)
%{$fg[green]%}❯%{$reset_color%} '

# Prompt para comandos multi-linha
PROMPT2='%{$fg[yellow]%}%_%{$reset_color%} ❯ '

# Prompt para correção de comandos
SPROMPT='%{$fg[red]%}zsh: correct ''%{$fg[yellow]%}%R%{$reset_color%}'' to ''%{$fg[green]%}%r%{$reset_color%}'' [nyae]? '

# ===============================================
# ALIASES SIMPLES E ÚTEIS
# ===============================================

# Aliases básicos (serão sobrescritos por sistema específico se necessário)
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias c='clear'
alias cls='clear'

# Aliases com tabela simples (SEM cores, bem alinhados)
alias llt='ls -la | column -t'
alias pst='ps aux | column -t'
alias dft='df -h | column -t'

# Desenvolvimento
alias python='python3'
alias pip='pip3'
alias runserver='uvicorn main:app --reload'
alias myip='curl -4 -s ipinfo.io/ip && echo'

# Git aliases rápidos
alias gs='git status --short'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git log --oneline --graph --decorate -10'

# ===============================================
# CONFIGURAÇÕES ESPECÍFICAS DO SISTEMA
# ===============================================

# macOS específico
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Homebrew (Apple Silicon e Intel)
    if [[ -d "/opt/homebrew" ]]; then
        export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
        export MANPATH="/opt/homebrew/share/man:$MANPATH"
    elif [[ -d "/usr/local" ]]; then
        export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
        export MANPATH="/usr/local/share/man:$MANPATH"
    fi
    
    # Aliases específicos do macOS
    alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
    alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
    
    # Aliases para utilitários macOS
    alias o='open'
    alias oo='open .'
    alias ll='ls -laG'
    alias la='ls -AG'
    alias l='ls -CFG'
fi

# Linux específico
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    alias ll='ls -la --color=auto'
    alias la='ls -A --color=auto'
    alias l='ls -CF --color=auto'
fi

# ===============================================
# FUNÇÕES SIMPLES
# ===============================================

# Função para buscar arquivos
function ff() {
    find . -iname "*$1*"
}


# Backup rápido com verificação
function backup() {
    if [[ -z "$1" ]]; then
        echo "❌ Uso: backup <arquivo>"
        return 1
    fi
    
    if [[ ! -e "$1" ]]; then
        echo "❌ Arquivo '$1' não encontrado"
        return 1
    fi
    
    local backup_file="$1.backup.$(date +%Y%m%d_%H%M%S)"
    cp "$1" "$backup_file"
    echo "✅ Backup criado: $backup_file"
}

# Função para criar diretório e entrar (melhorada)
function mkcd() {
    if [[ -z "$1" ]]; then
        echo "❌ Uso: mkcd <diretório>"
        return 1
    fi
    
    mkdir -p "$1" && cd "$1"
}

# Função para navegar para diretórios recentes
function recent() {
    if [[ -n "$1" ]]; then
        cd "$1"
    else
        dirs -v | head -10
    fi
}

# Função para extrair arquivos (universal)
function extract() {
    if [[ -z "$1" ]]; then
        echo "❌ Uso: extract <arquivo>"
        return 1
    fi
    
    case "$1" in
        *.tar.bz2)   tar xjf "$1"     ;;
        *.tar.gz)    tar xzf "$1"     ;;
        *.bz2)       bunzip2 "$1"     ;;
        *.rar)       unrar e "$1"     ;;
        *.gz)        gunzip "$1"      ;;
        *.tar)       tar xf "$1"      ;;
        *.tbz2)      tar xjf "$1"     ;;
        *.tgz)       tar xzf "$1"     ;;
        *.zip)       unzip "$1"       ;;
        *.Z)         uncompress "$1"  ;;
        *.7z)        7z x "$1"        ;;
        *)           echo "❌ Formato não suportado: $1" ;;
    esac
}