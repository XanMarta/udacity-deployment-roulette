SERVICE_URL=172.20.56.57
rm -f ./canary.txt
for i in {1..10}; do
  echo "---------- Running test - $i ----------" >> canary.txt
  curl $SERVICE_URL >> canary.txt
done
