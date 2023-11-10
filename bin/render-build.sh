#!/usr/bin/env bash
# エラーが発生した場合にスクリプトを停止
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate