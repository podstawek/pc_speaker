filename=$1
filename="${filename%.*}"

echo "Filename without extension is ${filename}"

echo -n "Compiling $1 with vasm... " &&\
vasmx86_std -m8086 $1 -Faout -o ${filename}.obj &&\
echo "done." 

echo -n "Linking $1 with vlink... " &&\
vlink ${filename}.obj -b rawbin1 -o ${filename}.com &&\
echo "done." 

echo -n "Copying ${filename}.com to DOSBox space... " &&\
cp ${filename}.com ~/retro/pc/dosbox/
echo "done." 
