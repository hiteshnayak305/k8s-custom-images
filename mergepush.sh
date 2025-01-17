## declare an array variable
declare -a arr=("hiteshnayak305/eclipse-temurin@21-jdk-alpine" "hiteshnayak305/eclipse-temurin@22-jdk-alpine" "hiteshnayak305/gitea@1.22.3-rootless" "hiteshnayak305/grafana@11.4.0" "hiteshnayak305/inbound-agent@3273.v4cfe589b_fd83-1-alpine" "hiteshnayak305/jenkins@2.479.3-alpine" "hiteshnayak305/k8s@1.31.4" "hiteshnayak305/kaniko@debug" "hiteshnayak305/kubernetes-event-exporter@1.7.0-debian-12-r21" "hiteshnayak305/node@20-alpine" "hiteshnayak305/node@22-alpine" "hiteshnayak305/promtail@3.0.0" "hiteshnayak305/sonar-scanner-cli@5" "hiteshnayak305/sonarqube@24.12.0.100206-community" "hiteshnayak305/ubuntu@latest")

## now loop through the above array
for i in "${arr[@]}"
do
   echo "updating branch $i"
   git checkout $i  && git merge master
   echo "pushing branch $i"
   git push origin $i
done

# You can access them using echo "${arr[0]}", "${arr[1]}" also