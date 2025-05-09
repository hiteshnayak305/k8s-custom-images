## declare an array variable
declare -a arr=( \
   "hiteshnayak305/bitnami-postgresql-pgvecto-rs@16.4.0-debian-12-r14" \
   "hiteshnayak305/buildkit@v0.20.2" \
   "hiteshnayak305/docker@cli" \
   "hiteshnayak305/eclipse-temurin@17-jdk-alpine" \
   "hiteshnayak305/eclipse-temurin@21-jdk-alpine" \
   "hiteshnayak305/eclipse-temurin@23-jdk-alpine" \
   "hiteshnayak305/gitea@1.23.6-rootless" \
   "hiteshnayak305/grafana@11.6.1" \
   "hiteshnayak305/immich-server@v1.132.1" \
   "hiteshnayak305/inbound-agent@3307.v632ed11b_3a_c7-2-alpine" \
   "hiteshnayak305/jenkins@2.492.3-alpine-jdk21" \
   "hiteshnayak305/k8s@1.32.4" \
   "hiteshnayak305/kaniko@debug" \
   "hiteshnayak305/kubernetes-event-exporter@1.7.0-debian-12-r33" \
   "hiteshnayak305/node@22-alpine" \
   "hiteshnayak305/node@23-alpine" \
   "hiteshnayak305/promtail@3.0.0" \
   "hiteshnayak305/sonar-scanner-cli@latest" \
   "hiteshnayak305/sonarqube@25.1.0.102122-community" \
   "hiteshnayak305/ubuntu@latest" \
)

## now loop through the above array
for i in "${arr[@]}"
do
   echo "updating branch $i"
   git checkout $i  && git merge master
   echo "pushing branch $i"
   git push origin $i
done

# You can access them using echo "${arr[0]}", "${arr[1]}" also