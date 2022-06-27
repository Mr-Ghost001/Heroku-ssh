#!/bin/sh
set -e

vendor/bin/phpunit
npm run prod

git add .
(git commit -m "Build frontend assets for deployment to production") || true
(git push) || true

git checkout production
git merge master

git push origin production

git checkout master