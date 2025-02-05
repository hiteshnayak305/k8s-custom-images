## declare an array variable
declare -a arr=( \
   "hiteshnayak305/jenkins@2.479.3-alpine" \
   "hiteshnayak305/inbound-agent@3273.v4cfe589b_fd83-1-alpine" \
   "hiteshnayak305/grafana@11.4.0" \
   "hiteshnayak305/immich-server@v1.123.0" \
   "hiteshnayak305/immich-server@v1.124.2" \
)

## now loop through the above array
for i in "${arr[@]}"
do
   echo "Deleting branch $i"
   git push -d origin $i  && git branch -d $i
done

# You can access them using echo "${arr[0]}", "${arr[1]}" also