#!/bin/bash
#
# WSL setup script
# Font: https://github.com/samuelramox/wsl-setup
# Main install script

source ./install/utils.sh
keep_sudo_alive

# Install applications
seek_confirmation "Warning: This step installs applications."
if is_confirmed; then
  e_header "Please, configure you applications before installation:"
  nano ${DOTFILES_DIRECTORY}/install/apps.sh
  bash ./install/apps.sh
else
  e_warning "Skipped applications install."
fi

# Dotfiles configs
seek_confirmation "Warning: This step may overwrite your existing dotfiles and git configs."
if is_confirmed; then
  bash ./install/dotfiles.sh
else
  e_warning "Skipped dotfiles settings."
fi

# Generate ssh
seek_confirmation "Warning: This step generates SSH"
if is_confirmed; then
  ask "Please provide an email address: " && printf "\n"
  ssh-keygen -t rsa -b 4096 -C "$REPLY"
  e_success "Generated SSH key."
  e_warning "After finishing the installation, use copyssh command to copy the SSH key to the clipboard."
else
  e_warning "Skipped SSH settings."
fi

# Cleanup cached downloads and remove the installation zip and folder
e_header "Removing unnecessary files"
sudo apt -y autoremove
rm -rf ${DOTFILES_DIRECTORY}

# Finish
e_success "Reboot and enjoy!"
