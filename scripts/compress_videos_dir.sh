#!/bin/bash

# Target directory containing .mp4 files
target_directory="/home/lucas/Dropbox/lols"

# Constant Rate Factor (CRF) value for compression
crf=25

# Desired max width for the output files
width=1280

preset="fast"

# Loop through all .mp4 files in the target directory
for file in "$target_directory"/*.mkv; do
	if [ -f "$file" ]; then
		# Get the file name without extension
		filename=$(basename -- "$file")
		filename="${filename%.*}"

		# Compressed output file path
		output_file="$target_directory/${filename}_compressed.mp4"

		# Check if the compressed version exists
		if [ -f "$output_file" ]; then
			echo "Compressed file already exists: $output_file. Skipping..."
		else
			# Run ffmpeg to compress the file
			ffmpeg -i "$file" -vf "scale=$width:-1" -c:v libx264 -preset "$preset" -crf "$crf" "$output_file"

			echo "Compressed file: $output_file"
		fi
	fi
done
