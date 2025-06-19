
## List of services
declare -a arr=(\
"game-service-01" \
"order-service-02" \
)

cp -R base-template temp-base-template

for chartName in "${arr[@]}"
do
   echo "Creating chart #$chartName"
   sed 's/^\(name: \).*$/\1'"$chartName"'/' base-template/Chart.yaml > temp-base-template/Chart.yaml
   helm package temp-base-template -d charts
done

rm -rf temp-base-template
helm repo index .