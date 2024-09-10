# Default branch
git config --global init.defaultBranch main

# Checksums
git config --system receive.fsckObjects true

# Allow fast-forwards
git config --system receive.denyNonFastForwards false

# Line endings
git config --global core.autocrlf true

# Identification
git config --global user.name 'Server'
git config --global user.email server@domain.com

# Disable proxy
git config --global --unset https.proxy
git config --global --unset http.proxy
