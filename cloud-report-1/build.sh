# Could be executed with sh from busybox scoop.sh package

document="main"
file=${document}.tex
iso_date=$(date "+%Y-%m-%d")
pdf_source=${document}.pdf
pdf_to_send="Karakin6semCloudReport-"${iso_date}.pdf

rm ${document}.aux
# rm ${document}.bbl

xelatex $file


test $? == 0 && biber $document

test $? == 0 && xelatex $file
test $? == 0 && xelatex $file

cp $pdf_source build/$pdf_to_send
