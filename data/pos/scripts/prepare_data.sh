set -e
#scp nayakne@jacob.stanford.edu:/u/nlp/data/pos-tagger/english/train-wsj-0-18 .
#scp nayakne@jacob.stanford.edu:/u/nlp/data/pos-tagger/english/test-wsj-19-21 .
#cat /scratch2/jiang_guo/data/ptb/dependency-stanford-3.3.0/PTB_development_gold.conll | awk '{print $2"_"$4}' | python -c "import codecs; import sys; f = sys.stdin.read(); f = f.replace('\n_\n', '#####').replace('\n', ' ').replace('#####', '\n'); print f"  > train-wsj-0-18
#cat /scratch2/jiang_guo/data/ptb/dependency-stanford-3.3.0/PTB_train_gold.conll | awk '{print $2"_"$4}' | python -c "import codecs; import sys; f = sys.stdin.read(); f = f.replace('\n_\n', '#####').replace('\n', ' ').replace('#####', '\n'); print f"  > test-wsj-19-21

curl -O https://raw.githubusercontent.com/slavpetrov/universal-pos-tags/master/en-ptb.map

cat train-wsj-0-18 | python preprocess_files.py en-ptb.map
cat test-wsj-19-21 | python preprocess_files.py en-ptb.map

cat en-ptb.map | cut -f2 | sort | uniq > tagset.txt
echo "O" >> tagset.txt

python make_datasets.py ./ ../  5

#rm train-wsj-0-18
#rm test-wsj-19-21 
rm train.txt
rm dev.txt
