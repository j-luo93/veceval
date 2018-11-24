#scp nayakne@jacob.stanford.edu:/u/nlp/data/ner/conll/eng.train ./train.txt
#scp nayakne@jacob.stanford.edu:/u/nlp/data/ner/conll/eng.testa ./dev.txt

#cp /scratch2/jiang_guo/data/ner/conll03/train.txt ./train.txt
#cp /scratch2/jiang_guo/data/ner/conll03/valid.txt ./dev.txt
python make_datasets.py ./ ../ 5
