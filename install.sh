#!/bin/bash

# Script de instalação dos dotfiles
# Autor: Maikon
# Versão: 2.0 - Atualizado para estrutura atual

set -e

# Detectar diretório do script automaticamente
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$SCRIPT_DIR"
BACKUP_DIR="$DOTFILES_DIR/backup"

echo "🚀 Iniciando instalação dos dotfiles..."
echo "📂 Diretório fonte: $DOTFILES_DIR"

# Criar diretório de backup
mkdir -p "$BACKUP_DIR"

# Função para criar link simbólico com backup
link_file() {
    local source="$1"
    local target="$2"
    
    if [ -e "$target" ]; then
        echo "📦 Fazendo backup de $target"
        mv "$target" "$BACKUP_DIR/$(basename $target).backup.$(date +%Y%m%d_%H%M%S)"
    fi
    
    echo "🔗 Criando link: $source -> $target"
    ln -sf "$source" "$target"
}

# Configurações do shell (zsh)
if [ -f "$DOTFILES_DIR/shell/.zshrc" ]; then
    link_file "$DOTFILES_DIR/shell/.zshrc" "$HOME/.zshrc"
fi

# Configurações do Git
if [ -f "$DOTFILES_DIR/git/.gitconfig" ]; then
    link_file "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
fi

# Configurações do Vim (opcional)
if [ -f "$DOTFILES_DIR/vim/.vimrc" ]; then
    link_file "$DOTFILES_DIR/vim/.vimrc" "$HOME/.vimrc"
    echo "✅ Vim configurado"
else
    echo "⚠️  Arquivo vim/.vimrc não encontrado (opcional)"
fi

# Configurar gitignore global
if [ -f "$DOTFILES_DIR/git/.gitignore_global" ]; then
    echo "🔧 Configurando gitignore global..."
    git config --global core.excludesfile "$DOTFILES_DIR/git/.gitignore_global"
    echo "✅ Gitignore global configurado"
else
    echo "⚠️  Arquivo git/.gitignore_global não encontrado"
fi

echo ""
echo "✅ Instalação concluída!"
echo ""
echo "📋 Resumo:"
echo "   • Shell: ~/.zshrc"
echo "   • Git: ~/.gitconfig"
echo "   • Gitignore: $DOTFILES_DIR/git/.gitignore_global"
if [ -f "$DOTFILES_DIR/vim/.vimrc" ]; then
    echo "   • Vim: ~/.vimrc"
fi
echo ""
echo "💡 Reinicie o terminal ou execute 'source ~/.zshrc' para aplicar as mudanças."
echo "🔄 Para desinstalar, remova os links simbólicos e execute:"
echo "   git config --global --unset core.excludesfile"