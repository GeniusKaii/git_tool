#!/bin/sh
SEPARATE_LINE="\033[35m--------------------------------\033[0m"
echo -e "\033[36m######################\033[0m"
echo -e "\033[36m#   GIT AUTO REBASE  #\033[0m"
echo -e "\033[36m#   author Kaii      #\033[0m"
echo -e "\033[36m#   version 1.2.2    #\033[0m"
echo -e "\033[36m######################\033[0m"
echo
echo -e "\033[36mAUTO REBASE STARTING\033[0m"
echo -e $SEPARATE_LINE

current_branch=`git symbolic-ref --short -q HEAD`
git_status=`git status | grep "nothing to commit" | wc -l`
# git_status!=0 means nothing to add&stash
# git_status=0 means something to add&stash

gitStash() {
    if [ $git_status -eq 0 ]
    then
    	echo -e "\033[35mmodification detected\033[0m"
    	git status
    	echo -e $SEPARATE_LINE
    	echo -e "\033[35mgit add .\033[0m"
    	git add .
    	echo -e "\033[35mgit add completed\033[0m"
    	echo -e $SEPARATE_LINE
    	echo -e "\033[35mgit stash\033[0m"
    	git stash
    	echo -e "\033[35mgit stash completed\033[0m"
    else
    	echo -e "\033[35mnothing modified\033[0m"
    fi
    echo -e $SEPARATE_LINE
}

gitCheckOutMaster() {
    if [ $current_branch != "master" ]
    then
    	# if working on a checkout branch
        echo -e "\033[35mgit checkout master\033[0m"
        git checkout master
        echo -e "\033[35mcurrent branch: `git symbolic-ref --short -q HEAD`\033[0m"
        echo -e $SEPARATE_LINE
    fi
}

gitPull(){
    echo -e "\033[35mgit pull\033[0m"
    git pull
    echo -e $SEPARATE_LINE
}

gitCheckOutMasterBack(){
    if [ $current_branch != "master" ]
    then
    	# if working on a checkout branch
        echo -e "\033[35mgit checkout -\033[0m"
        git checkout -
        echo -e "\033[35mcurrent branch: `git symbolic-ref --short -q HEAD`\033[0m"
        echo -e $SEPARATE_LINE
        echo -e "\033[35mgit rebase master\033[0m"
        git rebase master
        echo -e "\033[35mgit rebase completed\033[0m"
        echo -e $SEPARATE_LINE
    fi
}

gitStashPop(){
    if [ $git_status -eq 0 ]
    then
    	echo -e "\033[35mgit stash pop\033[0m"
    	git stash pop
    	echo -e "\033[35mgit stash pop completed\033[0m"
    	git_conflict=`git status | grep -i "CONFLICT" | wc -l`
    	if [ $git_conflict -eq 0 ]; then
    	    git reset HEAD
    	fi
    else
    	echo -e "\033[35mnothing stashed to pop\033[0m"
    fi
    echo -e $SEPARATE_LINE
    echo -e "\033[36mAUTO REBASE FINISHED\033[0m"
}

if [[ "$1"x == "master"x ]]; then
    gitStash
    gitCheckOutMaster
    gitPull
    gitCheckOutMasterBack
    gitStashPop
else
    gitStash
    gitPull
    gitStashPop
fi
