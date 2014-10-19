#!/bin/bash
#
# Git is already installed, but has had standard features disabled that we require, such as HTTPS support for remote
# repositories.

rm /etc/portage/package.use/git
emerge $EM_VERBOSE --update --newuse dev-vcs/git

git config --system core.autocrlf input
git config --system core.eol native
