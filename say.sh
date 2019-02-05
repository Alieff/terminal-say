filename="$HOME/Documents/.script/database/ignorable/say-temp.png"
base_folder="$HOME/Documents/.script/database/ignorable/base"
temp_folder="$HOME/Documents/.script/database/ignorable/temp"
mkdir -p $base_folder
mkdir -p $temp_folder
word_to_say="$1"
is_generate_image="$2"

# |imagick|
# create canvas and put image (Avatar final image fusioner)
# inkscape -z -e $temp_folder/callout.png -w 300 -h 100 $base_folder/template-callout.svg ;# generate callout from svg

convert -size 450x200 canvas:transparent $filename; # create canvas
convert -resize 30% $base_folder/avatar.png $base_folder/temp.png #resize avatar
composite $base_folder/temp.png $filename $filename ; # put avatar
rm $base_folder/temp.png # cleaning
convert -pointsize 20 -background transparent -font Comic-Sans-MS-Bold -fill black label:"$word_to_say" $temp_folder/label.gif; # create text
composite -geometry +10+0 -gravity Center $temp_folder/label.gif $temp_folder/callout.png $temp_folder/labelled-callout.gif; # combine text with callout
composite -geometry +120+30 $temp_folder/labelled-callout.gif $filename $filename ;  # combine callout with main canvas
# copying images
if [ "$#" -eq 2 ]; then
  echo 'generating images at '$(pwd)'/'$(basename $filename)
  "cp" $filename "$(pwd)"
fi

# eog $filename
splash "$filename"

