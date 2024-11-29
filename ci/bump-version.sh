#!/bin/bash
if [ $# -lt 2 ]; then
  echo "not enough arguments"
  exit 1
elif [ $# -gt 2 ]; then
  echo "too many arguments"
  exit 1
fi

echo "bump version from $1 to $2"

# change version in galaxy.yml
sed -i "s/sonar.projectVersion=$1/sonar.projectVersion=$2/1" sonar-project.properties

# push new version to scm
git add .
git commit -m "chore(dev): bump version to $2"
git tag $2
git push origin master --tags
