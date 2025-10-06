# 🚀 Dotfiles do Maikon

**Configurações personalizadas do terminal para desenvolvimento Python/FastAPI e Swift/iOS em macOS.**

**Autor:** Maikon | **Sistema:** macOS | **Data:** Outubro 2025

---

## 🎯 **Visão Geral**

Dotfiles robustos e funcionais para desenvolvimento em **Python/FastAPI**, **Swift/iOS**, e uso geral em macOS. Utiliza técnicas testadas pela comunidade ZSH para máxima compatibilidade e performance.

### **Filosofia:**
- **Robusto e testado**: Técnicas amplamente validadas pela comunidade
- **Produtivo**: Aliases e funções que economizam tempo
- **Seguro**: Gitignore global para proteger secrets
- **Visual**: Terminal colorido e organizado
- **Compatível**: Funciona em macOS e Linux

---

## 📂 **Estrutura dos Arquivos**

```
dotfiles/
├── README.md                # Esta documentação completa
├── install.sh              # Script de instalação automática
├── git/
│   ├── .gitconfig          # Configurações do Git (otimizado)
│   └── .gitignore_global   # Gitignore global (enxuto)
└── shell/
    └── .zshrc              # Configurações do terminal ZSH (robusto)
```

---

## 🚀 **Instalação**

### **Instalação Automática:**
```bash
# Clone o repositório
git clone https://github.com/SEU_USUARIO/dotfiles.git ~/.dotfiles

# Entre no diretório
cd ~/.dotfiles

# Execute o script de instalação
./install.sh
```

### **Instalação Manual:**
```bash
# Criar links simbólicos
ln -sf ~/.dotfiles/shell/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/git/.gitconfig ~/.gitconfig

# Configurar gitignore global
git config --global core.excludesfile ~/.dotfiles/git/.gitignore_global

# Recarregar configurações
source ~/.zshrc
```

### **Desinstalação:**
```bash
# Remover links simbólicos
rm ~/.zshrc ~/.gitconfig

# Desconfigurar gitignore global
git config --global --unset core.excludesfile
```

---

## 📋 **Aliases Disponíveis**

### **🗂️ Navegação e Arquivos**
| Comando | Função | Exemplo |
|---------|---------|---------|
| `ll` | Lista detalhada com cores | `ll` |
| `la` | Lista todos os arquivos (incluindo ocultos) | `la` |
| `l` | Lista simples em colunas | `l` |
| `..` | Volta um diretório | `..` |
| `...` | Volta dois diretórios | `...` |
| `....` | Volta três diretórios | `....` |
| `c` | Limpa a tela | `c` |
| `cls` | Limpa a tela (alternativo) | `cls` |

### **📊 Formato de Tabela (Bem Alinhados)**
| Comando | Função | Exemplo |
|---------|---------|---------|
| `llt` | Lista arquivos em formato de tabela | `llt` |
| `pst` | Lista processos em formato de tabela | `pst` |
| `dft` | Mostra espaço em disco em tabela | `dft` |

### **🐍 Desenvolvimento Python/FastAPI**
| Comando | Função | Exemplo |
|---------|---------|---------|
| `python` | Python 3 (alias) | `python app.py` |
| `pip` | Pip 3 (alias) | `pip install fastapi` |
| `runserver` | Inicia servidor FastAPI | `runserver` |
| `myip` | Mostra seu IP público | `myip` |

### **📝 Git (Workflow Rápido)**
| Comando | Função | Exemplo |
|---------|---------|---------|
| `gs` | Status resumido | `gs` |
| `ga` | Adicionar arquivos | `ga .` |
| `gc` | Commit com mensagem | `gc "fix: bug corrigido"` |
| `gp` | Push para origem | `gp` |
| `gl` | Log gráfico (últimos 10) | `gl` |

### **🍎 macOS Específicos**
| Comando | Função | Exemplo |
|---------|---------|---------|
| `showfiles` | Mostra arquivos ocultos no Finder | `showfiles` |
| `hidefiles` | Esconde arquivos ocultos no Finder | `hidefiles` |
| `o` | Abre arquivo/diretório | `o .` |
| `oo` | Abre diretório atual | `oo` |

---

## 🔧 **Funções Úteis**

### **🔍 Busca e Navegação**
```bash
# Buscar arquivos por nome (case-insensitive)
ff nome_arquivo

# Criar pasta e entrar nela automaticamente
mkcd nova_pasta

# Fazer backup rápido com timestamp
backup arquivo.txt
# Resultado: arquivo.txt.backup.20251005_143627

# Navegar para diretórios recentes
recent
```

### **📦 Extração de Arquivos**
```bash
# Extrair qualquer tipo de arquivo
extract arquivo.zip
extract arquivo.tar.gz
extract arquivo.7z
```

---

## ⚙️ **Configurações do Terminal**

### **🎨 Visual:**
- **Prompt colorido** com usuário, máquina, diretório e branch Git
- **Auto-correção** de comandos digitados errado
- **Auto-CD** - digite só o nome da pasta para entrar nela
- **Histórico inteligente** - sem duplicatas, 50.000 comandos
- **Auto-completions** avançadas com menu visual

### **📚 Histórico Otimizado:**
- **50.000 comandos** salvos
- **Sem duplicatas**
- **Busca inteligente** no histórico
- **Compartilhamento** entre sessões
- **Verificação** antes de executar comandos do histórico

### **⚡ Performance:**
- **Cache inteligente** de completions
- **Monitoramento** de arquivos
- **Preload** de índices Git

---

## 📝 **Configurações Git**

### **👤 Usuário (Configure suas informações!)**
```bash
# IMPORTANTE: Edite suas informações em git/.gitconfig
name = Maikon
email = SEU_EMAIL_AQUI@example.com
```

### **🎨 Aliases Git Avançados**
| Alias | Comando Completo | Uso |
|-------|------------------|-----|
| `st` | `status` | `git st` |
| `co` | `checkout` | `git co branch` |
| `br` | `branch` | `git br` |
| `graph` | Log gráfico colorido | `git graph` |
| `cleanup` | Remove branches merged | `git cleanup` |
| `url` | Mostra URL do repositório | `git url` |
| `undo` | Desfaz último commit | `git undo` |
| `amend` | Amend sem editor | `git amend` |
| `stash` | Stash com mensagem | `git stash "mensagem"` |
| `pop` | Stash pop | `git pop` |

### **⚡ Performance Git:**
- **Preload index** - carrega índice em background
- **Filesystem cache** - cache de filesystem
- **File monitoring** - monitoramento de arquivos

---

## 🛡️ **Gitignore Global (Enxuto)**

### **🎯 O que é ignorado automaticamente em TODOS os projetos:**

#### **🍎 macOS:**
- `.DS_Store` - Metadados do Finder
- `._*` - Thumbnails e metadados

#### **🪟 Windows:**
- `Thumbs.db` - Thumbnails do Explorer
- `Desktop.ini` - Configurações de pasta

#### **🐧 Linux:**
- `*~` - Arquivos temporários
- `.directory` - Metadados do KDE

#### **💻 IDEs (Configurações Pessoais):**
- `.vscode/settings.json` - Configs pessoais VS Code
- `.cursor/` - Configurações Cursor IDE
- `.idea/` - JetBrains IDEs
- `*.swp` - Arquivos temporários Vim

#### **🔐 Segurança:**
- `.env` - Variáveis de ambiente
- `secrets.json` - Arquivos de secrets
- `*.key`, `*.pem` - Chaves privadas

#### **📁 Backup e Temporários:**
- `*.bak`, `*.backup` - Arquivos de backup
- `*.log` - Logs do sistema
- `dist/`, `build/` - Artefatos de build

---

## ⚡ **Exemplos de Uso**

### **💻 Workflow de Desenvolvimento FastAPI:**
```bash
# Criar projeto
mkcd meu-projeto-api
echo "from fastapi import FastAPI\napp = FastAPI()" > main.py

# Iniciar servidor
runserver  # Equivale a: uvicorn main:app --reload

# Git workflow
ga .
gc "feat: API inicial"
gp
```

### **📱 Workflow iOS/Swift:**
```bash
# Verificar espaço e processos
dft  # Tabela de espaço em disco
pst  # Tabela de processos rodando

# Navegação rápida
oo   # Abre diretório atual no Finder
```

### **🗂️ Organização de Arquivos:**
```bash
# Listar arquivos organizados
llt  # Tabela bem alinhada

# Buscar arquivos
ff config  # Encontra qualquer arquivo com "config" no nome

# Backup antes de editar
backup important-file.py

# Extrair arquivos
extract project.zip
```

---

## 🔄 **Backup e Recuperação**

### **📦 Localização dos Backups:**
```bash
~/.dotfiles/backup/  # Backups automáticos do install.sh
```

### **🚨 Recuperar Configuração Anterior:**
```bash
# Se algo der errado, use o backup mais recente:
cp ~/.dotfiles/backup/.zshrc.backup.YYYYMMDD_HHMMSS ~/.zshrc
source ~/.zshrc
```

---

## 🛠️ **Personalização**

### **✏️ Adicionar Seus Próprios Aliases:**
```bash
# Edite o arquivo:
vim ~/.dotfiles/shell/.zshrc

# Adicione na seção "ALIASES SIMPLES E ÚTEIS":
alias meucomando='comando-longo-que-uso-sempre'

# Reinstale:
./install.sh && source ~/.zshrc
```

### **🔧 Configurar Informações Git:**
```bash
# Edite suas informações:
vim ~/.dotfiles/git/.gitconfig

# Mude as linhas:
name = SEU_NOME
email = seu.email@dominio.com
```

---

## 📊 **Estatísticas**

- **236 linhas** no .zshrc (robusto e otimizado)
- **30+ aliases** úteis
- **6 funções** essenciais
- **110 linhas** no gitignore global (enxuto)
- **81 linhas** no gitconfig (otimizado)
- **Zero dependências** externas
- **Técnicas testadas** pela comunidade ZSH

---

## 🐛 **Troubleshooting**

### **❌ Terminal em loop infinito:**
```bash
# Use backup de emergência:
cp ~/.dotfiles/backup/.zshrc.backup.* ~/.zshrc
```

### **❌ Aliases não funcionam:**
```bash
# Recarregue as configurações:
source ~/.zshrc

# Ou reinstale:
cd ~/.dotfiles && ./install.sh
```

### **❌ Git não reconhece gitignore global:**
```bash
# Verifique se está configurado:
git config --global core.excludesfile

# Deve retornar: ~/.dotfiles/git/.gitignore_global
```

### **❌ Completions lentas:**
```bash
# Limpe o cache de completions:
rm -f ~/.zcompdump*
source ~/.zshrc
```

---

## 📚 **Referências**

- **ZSH Manual:** `man zsh`
- **Git Config:** `man git-config`
- **Column Command:** `man column`

---

## 📞 **Suporte**

Para dúvidas ou problemas:
1. Consulte as seções desta documentação
2. Verifique os comentários nos arquivos de configuração
3. Use os backups automáticos em `~/.dotfiles/backup/`

---

**Última atualização:** 06 de Outubro de 2025  
**Versão:** 2.0 - Robusto e Otimizado