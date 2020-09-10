#!/bin/bash

mkdir -p ~/.ssh/
echo "$ED25519_KEY" > ~/.ssh/id_ed25519
chmod 600 ~/.ssh/id_ed25519

git config --local user.email "71071723+Jorropo-berty-bot@users.noreply.github.com"
git config --local user.name "Jorropo-berty-bot"

git add .
if [ -n "$(git status --porcelain)" ]; then
 echo "New files, updating"
 git commit -m "Updated libtor dependencies."
 git tag v1.0.$(($(git tag | sort -r --version-sort | head -n 1 | tr -d '\n' | cut -d'.' -f3) + 1))
 git remote add berty git@github.com:berty/go-libtor.git
 git push berty
 git push --tags berty
fi
