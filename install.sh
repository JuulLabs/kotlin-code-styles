#!/bin/bash
# Installs JUUL Labs' IntelliJ configs into your user configs.

# Script adapted from:
# https://github.com/square/java-code-styles/blob/5d09b48d82fe80403fb49ffdb28e1161d58c5ad1/install.sh

echo "Installing JUUL Labs IntelliJ configs..."

CONFIGS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/configs"

for i in $HOME/Library/Preferences/IntelliJIdea*  \
         $HOME/Library/Preferences/IdeaIC*        \
         $HOME/Library/Preferences/AndroidStudio* \
         $HOME/Library/Application\ Support/JetBrains/IntelliJIdea* \
         $HOME/.IntelliJIdea*/config              \
         $HOME/.IdeaIC*/config                    \
         $HOME/.AndroidStudio*/config \
         $HOME/Library/Application\ Support/Google/AndroidStudio* \
         $HOME/Library/Application\ Support/JetBrains/IdeaIC*
do
  if [[ -d "$i" ]]; then
    # Install codestyles
    mkdir -p "$i/codestyles"
    cp -frv "$CONFIGS/codestyles"/* "$i/codestyles"

    # Install inspections
    #mkdir -p "$i/inspection"
    #cp -frv "$CONFIGS/inspection"/* "$i/inspection"

    # Install options ("Exclude from Import and Completion")
    mkdir -p "$i/options"
    cp -frv "$CONFIGS/options"/* "$i/options"
  fi
done

echo "Done."
echo ""
echo "Restart IntelliJ and/or AndroidStudio, go to preferences, and apply 'JUUL Labs'."
