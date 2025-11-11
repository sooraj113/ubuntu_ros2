# ==============================
# 🚀 Docker + WSL + Ubuntu 22.04 Installer
# ==============================

Write-Host "`n=== Starting Docker + WSL + Ubuntu Setup ===`n" -ForegroundColor Cyan

# --- 1️⃣ Enable WSL & Virtual Machine Platform ---
Write-Host "🔧 Enabling WSL and Virtual Machine Platform..."
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart | Out-Null
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart | Out-Null

# --- 2️⃣ Set WSL 2 as default ---
Write-Host "⚙️  Setting WSL 2 as default version..."
wsl --set-default-version 2

# --- 3️⃣ Install Ubuntu 22.04 from Microsoft Store ---
Write-Host "🐧 Installing Ubuntu 22.04 (Jammy Jellyfish)..."
wsl --install -d Ubuntu-22.04

# --- 4️⃣ Install Docker Desktop ---
Write-Host "🐋 Installing Docker Desktop (this may take a few minutes)..."
winget install -e --id Docker.DockerDesktop -h --accept-package-agreements --accept-source-agreements

# --- 5️⃣ Post-install info ---
Write-Host "`n✅ Docker Desktop installed."
Write-Host "✅ WSL 2 enabled and Ubuntu 22.04 installed."
Write-Host "`n🔄 Please RESTART your computer before continuing."
Write-Host "After reboot, open Ubuntu 22.04 from Start Menu to finish setup."
Write-Host "`nOnce inside Ubuntu, you can install ROS 2 Humble using:"
Write-Host "bash <(curl -sSL https://raw.githubusercontent.com/soorajvs/ros2-auto-installer/main/ubuntu_ros2_install.sh)" -ForegroundColor Yellow
