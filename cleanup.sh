## declare an array variable
declare -a arr=( \
   "hiteshnayak305/inbound-agent@3301.v4363ddcca_4e7-3-alpine" \
)

## now loop through the above array
for i in "${arr[@]}"
do
   echo "Deleting branch $i"
   git push -d origin $i  && git branch -d $i
done

# You can access them using echo "${arr[0]}", "${arr[1]}" also