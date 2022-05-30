
# # *** docker pull image list of rke
# while IFS= read -r i; do
#     docker pull $i
# done < $(pwd)/imageList


# # *** docker save all rke image to tar file
# while IFS= read -r i; do

#     line=$(echo $i | sed -e "s/\//-/g" -e "s/\:/-/g")

#     docker save $i > $(pwd)/images/$line.tar
#     echo "the $i image save to tar file"
# done < $(pwd)/imageList

sleep 5

# # *** transfer image tar file to all machine cluster
while IFS= read -r i; do
    echo "***************************************"
    echo "transfer tar file to $i"
    echo "***************************************"
    scp $(pwd)/images/*.tar root@$i:/root
    sleep 5
done < $(pwd)/ipList

sleep 5

# # *** load docker images tar file
# while IFS= read -r i; do
#     ssh root@$i lsb_release -a
# done < $(pwd)/ipList