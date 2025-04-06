## declare an array variable
declare -a arr=( \
   "hiteshnayak305/buildkit@v0.20.1" \
)

## now loop through the above array
for i in "${arr[@]}"
do
   echo "Deleting branch $i"
   git push -d origin $i  && git branch -d $i
done

# You can access them using echo "${arr[0]}", "${arr[1]}" also