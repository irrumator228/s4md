#!/bin/dash -e
input_file=$1
output_folder=$2
name=""
input_text=""
output_text=""
count=1
itsblock=0
while IFS= read -r line; do
	if [[ "$line" == "\`\`\`"* ]]; then
		if [[ "$itsblock" == "1" ]]; then
			case "$name" in
				"dot")
					output_image="$output_folder/$count.svg"
					output_text=$(printf "\n\n![$count dot graph]($output_image)\n")
					echo "$input_text" | dot -Tsvg -o $output_image
					# echo $input_text | dot -Tsvg
					((count++))
					;;
				"octave")
						
					;;
				"csv")
					;;
				"R")

					;;
				*)
					printf "\`\`\`$name\n$input_text\n\`\`\`"
					;;
			esac
			echo "$output_text"
			output_text=""
			input_text=""
			itsblock=0
		else
			name="${line:3}"
			itsblock=1
		fi
	else
	 	if [[ "$itsblock" == "1" ]]; then
			input_text=$(printf "$input_text\n$line")
			# echo \<!--$input_text--\>
		else
			echo "$line"
		fi
	fi
done < $input_file
