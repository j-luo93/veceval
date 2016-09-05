#cp /path/to/test-wsj-19-21 .
#cp /path/to/train-wsj-0-18 .

wget https://raw.githubusercontent.com/slavpetrov/universal-pos-tags/master/en-ptb.map

cat train-wsj-0-18 | python preprocess_files.py en-ptb.map
cat test-wsj-19-21 | python preprocess_files.py en-ptb.map

cat en-ptb.map | cut -f2 | sort | uniq > tagset.txt
echo "O" >> tagset.txt

python make_datasets.py ./ ../  5

rm train-wsj-0-18
rm test-wsj-19-21 
rm train.txt
rm dev.txt
