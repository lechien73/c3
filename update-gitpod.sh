#!/bin/bash
#
# Gitpod Template Upgrader
# er...upgrades the Gitpod template?
#
# Matt Rudge, 2024

ide="Gitpod"
pwd=`pwd`

echo ""
echo -e "\e[1;33mTemplate Upgrader\e[0m by \e[1;31mCode Institute\e[0m"
echo ""
echo -n "Would you like to continue? [yes/no]: "
read answer

if [ $answer != "yes" ] && [ $answer != "y" ] && [ $answer != "YES" ] && [ $answer != "Y" ] ; then
    return 1
fi

wget https://raw.githubusercontent.com/Code-Institute-Org/ci-full-template/main/.gitpod.dockerfile && curl https://raw.githubusercontent.com/Code-Institute-Org/ci-full-template/main/.gitpod.yml > .gitpod.yml
cd .vscode && wget https://raw.githubusercontent.com/Code-Institute-Org/ci-full-template/main/.vscode/uptime.sh && wget https://raw.githubusercontent.com/Code-Institute-Org/ci-full-template/main/.vscode/init_tasks.sh && wget https://raw.githubusercontent.com/Code-Institute-Org/ci-full-template/main/.vscode/heroku_config.sh && wget https://raw.githubusercontent.com/Code-Institute-Org/ci-full-template/main/.vscode/make_url.py && wget https://raw.githubusercontent.com/Code-Institute-Org/ci-full-template/main/.vscode/arctictern.py && wget https://raw.githubusercontent.com/Code-Institute-Org/ci-full-template/main/.vscode/settings.json

cd $pwd

clear
echo "Update complete. You will now be asked whether you want the script"
echo "to automatically add, commit and push the changes to GitHub. After this"
echo "has been done, close the workspace and reopen it from GitHub."
echo ""
echo -ne "\e[35;1mWould you like me to add, commit and push to GitHub for you? [yes / no]: \e[0m"
read answer

rm update.sh >/dev/null 2>&1

if [ $answer = "yes" ] || [ $answer = "y" ] || [ $answer = "YES" ] || [ $answer = "Y" ] ; then
    git add .
    git commit -m "maint: upgrade project template"
    git push
    echo ""
    echo -e "\e[32;1mAll done! Please close this workspace and recreate it.\e[0m"
else
    echo ""
    echo "You will need to add, commit and push to GitHub manually"
    echo "before recreating the workspace."
fi
echo ""