# Dotfiles

Automated dotfiles management system for macOS with modular package organization. Features a comprehensive CLI tool for setup, maintenance, and environment diagnostics.

## Overview

This repository contains my personal development environment configuration, managed through a custom CLI tool called `dot`. It uses GNU Stow for symlink management, Homebrew for package installation, and features a modular Brewfile system for organizing domain-specific tooling.

### Key Features

- 🚀 **One-command setup** - Complete development environment in minutes
- 📦 **Modular package system** - Separate Brewfiles for AWS, K8s, Terraform, ECMAScript, and work tools
- 🔄 **Resilient package management** - Continues installation even if packages fail
- 🛡️ **Security-first** - Socket Security Firewall protects against malicious packages
- 🔍 **Health monitoring** - Comprehensive environment diagnostics
- 🛠️ **VS Code integration** - Track and sync installed extensions

## Quick Start

```bash
# Clone the repository
git clone https://github.com/igalklebanov/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Full setup (installs everything)
./dot init

# Or customize the installation
./dot init --skip-ssh
```

After installation, the `dot` command will be available globally. Run `dot --help` for all available commands.

## Repository Structure

```
~/.dotfiles/
├── dot                      # Main CLI tool (Bash)
├── home/                    # Configuration files (stowed to ~)
│   ├── .config/
│   │   ├── git/            # Git configuration
│   │   ├── gh/             # GitHub CLI configuration
│   │   ├── opencode/       # OpenCode AI configuration
│   │   ├── ghostty/        # Ghostty terminal configuration
│   │   ├── raycast/        # Raycast launcher configuration
│   │   ├── ripgrep/        # Ripgrep configuration
│   │   └── starship.toml   # Starship prompt configuration
│   ├── Library/            # macOS Library preferences
│   ├── .zshrc              # Zsh shell configuration
│   ├── .zprofile           # Zsh profile
│   ├── .npmrc              # npm configuration
│   └── .bunfig.toml        # Bun configuration
├── homebrew/               # Package management
│   ├── Brewfile            # Base packages (all machines)
│   ├── Brewfile.aws        # AWS development tools
│   ├── Brewfile.ecmascript # JavaScript/TypeScript runtimes
│   ├── Brewfile.k8s        # Kubernetes tooling
│   ├── Brewfile.terraform  # Infrastructure as Code tools
│   └── Brewfile.work       # Workplace collaboration tools
├── vscode/
│   └── extensions.json     # VS Code extensions tracking
└── README.md               # This file
```

## The `dot` CLI Tool

The `dot` command is a comprehensive management tool for your dotfiles. It handles everything from initial setup to ongoing maintenance.

### Installation Commands

#### `dot init` - Initial Setup

Complete environment setup with all tools and configurations.

```bash
# Full installation
dot init

# Skip SSH key generation
dot init --skip-ssh
```

**What it does:**

1. Installs Homebrew (if not present)
2. Installs packages from all Brewfiles
3. Creates symlinks with GNU Stow
4. Installs Socket Security Firewall Free for package protection
5. Generates SSH key for GitHub (optional)
6. Sets up shell configuration

### Maintenance Commands

#### `dot update` - Update Everything

```bash
dot update
```

- Pulls latest dotfiles changes
- Updates Homebrew packages
- Re-stows configuration files

#### `dot doctor` - Health Check

```bash
dot doctor
```

Comprehensive diagnostics including:

- ✅ Homebrew installation
- ✅ Essential tools (git, stow, brew, etc.)
- ✅ Socket Security Firewall installation and functionality
- ✅ Shell configuration
- ✅ PATH configuration
- ⚠️ Broken symlinks detection
- ⚠️ Missing dependencies

#### `dot check-packages` - Package Status

```bash
dot check-packages
```

Shows which packages are installed vs. missing from your Brewfiles.

#### `dot retry-failed` - Retry Failed Installations

```bash
dot retry-failed
```

Attempts to reinstall packages that failed during initial setup.

### Package Management

The `dot package` command provides comprehensive package management across all Brewfiles.

```bash
# List packages
dot package list              # List all packages
dot package list base         # List base packages only
dot package list aws          # List AWS packages only
dot package list k8s          # List Kubernetes packages only

# Add packages
dot package add git           # Add git to base bundle
dot package add kubectl k8s   # Add kubectl to k8s bundle
dot package add terraform terraform  # Add to terraform bundle

# Update packages
dot package update            # Update all packages
dot package update git        # Update specific package
dot package update all k8s    # Update only k8s bundle packages

# Remove packages
dot package remove git        # Remove git from any bundle
dot package remove helm k8s   # Remove helm from k8s bundle only
```

**Available contexts:**

- `base` - Core tools (default)
- `aws` - AWS development tools
- `ecmascript` - JavaScript/TypeScript runtimes
- `k8s` - Kubernetes tooling
- `terraform` - Infrastructure as Code
- `work` - Workplace collaboration

### Utility Commands

#### `dot gen-ssh-key` - Generate SSH Key

```bash
dot gen-ssh-key                    # Prompts for email
dot gen-ssh-key user@github.com    # Generate with email
```

Generates an SSH key for GitHub/GitLab authentication.

#### `dot vscode-sync` - Sync VS Code Extensions

```bash
dot vscode-sync
```

Updates `vscode/extensions.json` from currently installed VS Code extensions.

#### `dot stow` - Update Symlinks

```bash
dot stow
```

Re-creates symlinks from `home/` directory to your home directory (`~`). Use this after editing configuration files.

#### `dot link` / `dot unlink` - Global Installation

```bash
# Install dot command globally (add to PATH)
dot link

# Remove global installation
dot unlink
```

Makes the `dot` command available from any directory.

#### `dot edit` - Open in Editor

```bash
dot edit
```

Opens the dotfiles directory in VS Code.

## Modular Package System

The dotfiles use a modular Brewfile architecture, allowing you to install only the tools you need for specific workflows.

### Brewfile Overview

#### `Brewfile` (Base - ~65 packages)

Core development tools installed on ALL machines:

**CLI Tools:**

- Modern replacements: `bat` (cat), `eza` (ls), `fd` (find), `ripgrep` (grep), `zoxide` (cd)
- Development: `git`, `gh`, `git-delta`, `lazygit`, `stow`
- Utilities: `fzf`, `jq`, `yq`, `just`, `direnv`, `starship`
- Monitoring: `bottom`, `dust`, `tokei`, `hyperfine`

**Applications:**

- Security: 1Password
- Development: VS Code, OrbStack, GitKraken, TablePlus
- Productivity: Raycast, Obsidian, DevUtils
- Utilities: IINA, Proxyman, Shottr, Stats
- Communication: Discord, Telegram, WhatsApp

#### `Brewfile.ecmascript` (JavaScript/TypeScript - 8 packages)

JavaScript and TypeScript runtime management:

- `fnm` - Node.js version manager
- `bun` - Fast all-in-one JavaScript runtime
- `deno` - Secure JavaScript/TypeScript runtime
- `corepack` - Package manager manager

#### `Brewfile.aws` (AWS Development - 21 packages)

AWS development and operations tooling:

- **Core**: `awscli`, `aws-vault`, `granted` (multi-account auth)
- **Kubernetes Bridge**: `aws-iam-authenticator`
- **Local Development**: `localstack`, `awscli-local`, `terraform-local`
- **Database**: `dynobase`, `dynamodb-local`
- **Utilities**: `cw` (CloudWatch logs), `sqsmover`, `cloud-nuke`, `steampipe`
- **IaC**: `iam-policy-json-to-terraform`

#### `Brewfile.k8s` (Kubernetes - 11 packages)

Kubernetes development and operations:

- **Core**: `kubectl`, `helm`, `kustomize`
- **Management**: `k9s` (TUI), `kubectx` (context switching)
- **Logging**: `stern` (tail logs across pods)

#### `Brewfile.terraform` (Infrastructure as Code - 13 packages)

Terraform and IaC tooling:

- **Core**: `tenv` (Terraform/OpenTofu/Terragrunt version manager)
- **Quality**: `tflint` (linting), `trivy` (security scanning)
- **Utilities**: `infracost` (cost estimation), `tf-summarize`, `terraformer`
- **Kubernetes**: `pluto` (deprecated API versions)
- **Visualization**: `graphviz`

#### `Brewfile.work` (Workplace Tools - 21 packages)

Collaboration and workplace-specific applications:

- **Communication**: Slack, Microsoft Teams
- **Project Management**: Linear, Notion
- **Design**: Figma, Miro
- **Video**: Loom
- **File Sharing**: Dropbox, Google Drive
- **On-Call**: PagerDuty
- **Infrastructure**: `cloudflared`, `doppler`

### Using the Modular System

```bash
# Install only what you need during init
dot init

# Later, add context-specific tools
brew bundle --file=./homebrew/Brewfile.aws
brew bundle --file=./homebrew/Brewfile.k8s

# Or add individual packages to specific contexts
dot package add kubectl k8s
dot package add tflint terraform
dot package add slack work
```

## Key Configurations

### Zsh

Modern shell setup with productivity enhancements:

- **Navigation**: `zoxide` (smart cd), `fzf` (fuzzy finder)
- **Prompt**: Starship (fast, customizable)
- **Tools**: `direnv` (auto-load environment variables), `fnm` (Node.js version manager)
- **Security**: Socket Firewall wraps npm/yarn/pnpm package managers
- **Aliases**: Modern tool replacements (bat, eza, ripgrep, fd)

### Git

Professional Git configuration:

- **GPG Signing**: SSH-based commit/tag signing
- **Editor**: VS Code
- **Modern Defaults**: Main branch, rebase on pull, auto-prune
- **Enhancements**: Git LFS support, rerere enabled, fsmonitor

### VS Code

Extension tracking and synchronization:

- Run `dot vscode-sync` to capture currently installed extensions
- Extensions stored in `vscode/extensions.json`
- Restore extensions on new machines

### OpenCode

AI assistant configuration with custom skills:

- Custom skills in `.config/opencode/skill/`
- Agent configuration and preferences

### Starship

Fast, customizable shell prompt with:

- Git status
- Language version indicators
- Execution time
- Custom styling

## Environment Setup

### Prerequisites

- macOS (Intel or Apple Silicon)
- Internet connection
- Terminal access

### First-Time Setup

1. **Clone repository:**

   ```bash
   git clone https://github.com/igalklebanov/.dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Run installation:**

   ```bash
   ./dot init
   ```

3. **Restart shell or source Zsh config:**

   ```bash
   source ~/.zshrc
   # Or restart terminal
   ```

4. **Verify installation:**
   ```bash
   dot doctor
   ```

### Customization

#### Adding Packages

**Method 1: Using package commands (recommended):**

```bash
# Add to base bundle
dot package add new-tool

# Add to specific context
dot package add kubectl k8s
dot package add awscli aws
```

**Method 2: Manual editing:**

Edit the appropriate Brewfile in `homebrew/`, then:

```bash
dot init  # Reinstall all packages
# or
brew bundle --file=./homebrew/Brewfile.aws  # Install specific bundle
```

#### Modifying Configurations

1. Edit files in `home/` directory (not your actual home directory)
2. Re-stow changes: `dot stow`
3. Test configuration changes

#### Selective Installation

```bash
# Install only base packages during init
dot init --skip-ssh

# Check what's missing
dot check-packages

# Install specific bundles later
brew bundle --file=./homebrew/Brewfile.aws
brew bundle --file=./homebrew/Brewfile.k8s
```

## Troubleshooting

### Common Issues

**Command not found: `dot`**

```bash
# Source Zsh configuration
source ~/.zprofile
```

**Package installation failures:**

```bash
# Check what failed
dot check-packages

# Retry failed packages
dot retry-failed
```

**Broken symlinks:**

```bash
# Diagnose issues
dot doctor

# Re-create symlinks
dot stow
```

**Getting help:**

```bash
# General help
dot --help

# Command-specific help
dot package --help
dot init --help
```

## Acknowledgments

- [GNU Stow](https://www.gnu.org/software/stow/) for symlink management
- [Homebrew](https://brew.sh/) for package management
- [dmmulroy's dotfiles](https://github.com/dmmulroy/.dotfiles) for inspiration and structure
- The dotfiles community for best practices
