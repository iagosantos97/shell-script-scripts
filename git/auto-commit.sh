#!/bin/bash

BASENAME_DIR=

#GITHUB_USER=
#GITHUB_TOKEN=

GITSTATUS=
COMMIT_MESSAGE=

if [[ $1 == "" ]]
then
echo "Modo de uso: ./$(basename $0) <PASTA_CONTENDO_OS_REPOS>"
exit 1
fi

for dir in $(ls "$1");
do

	if [[ -d "$1/$dir" ]]
	then
		cd "$1/$dir"

		BASENAME_DIR="$(basename $(pwd))"

		if [[ ! -d ./.git ]]
		then
			curl -u "$GITHUB_USER:$GITHUB_TOKEN" https://api.github.com/user/repos -d '{"name":"'$BASENAME_DIR'", "private": true, "visibility": "private"}' > /dev/null 2>&1
			git init
			git remote add origin git@github.com:$GITHUB_USER/$BASENAME_DIR.git

			if [[ ! -f ./.gitignore ]]
			then
				cp -f ~/estudos/.gitignore .
			fi
		fi

		GITSTATUS=$(git status | grep "nothing to commit")

		if [[ $GITSTATUS == "" ]]
		then
			git status
			git add .
			read -p "[ $BASENAME_DIR ] Digite a mensagem do seu commit: " COMMIT_MESSAGE
			git commit -m "$COMMIT_MESSAGE"
			git branch -M master
			git push -u origin master
		fi

	fi
done
