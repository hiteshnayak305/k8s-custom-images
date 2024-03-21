export VERSION="X.X.X"
docker build --build-arg VERSION=$VERSION -t hiteshnayak305/<name>:$VERSION -f gitea.Dockerfile .
