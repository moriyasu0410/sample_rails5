#!/bin/sh
set -e

export BRANCH=bundle_update_$(date -u "+%Y%m%d")
export GITHUB_ACCESS_TOKEN=[secure]

git config --global user.email 'travisci@mediba.jp'
git config --global user.name 'TravisCI'
git checkout -b $BRANCH
git add Gemfile.lock
git commit -m '$ bundle update'
git push origin $BRANCH

bundle exec ruby scripts/create_pullrequest.rb