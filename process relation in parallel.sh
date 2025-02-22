#!/bin/bash
start_time=$(date +%s)

# Define the directory path
dataset_dir="/media/randah/0b60ddf9-4b0c-4b37-afaf-93898a41f63a/Dataset/text_tparse"

# Define relations and corresponding input files
declare -A relation_files=(
    ["antonyms"]="./text_pair/antonyms_pairs_search.txt"
    ["meronyms"]="./text_pair/meronyms_pairs_search.txt"
    ["synonyms"]="./text_pair/synonyms_pairs_search.txt"
    ["hypernyms"]="./text_pair/hypernyms_pairs_search.txt"
    ["holonyms"]="./text_pair/holonyms_pairs_search.txt"
    ["attributes"]="./text_pair/attributes_pairs_search.txt"
)

# Path to the file containing the list of file paths
file_paths="./file_paths.txt"

echo "Processing all relations at once..."

# Create grep patterns for each relation
declare -A grep_patterns

for relation in "${!relation_files[@]}"; do
    word_pairs_file="${relation_files[$relation]}"
    output_file="$dataset_dir/${relation}_search.txt"
    
    # Clear any previous output for this relation
    > "$output_file"
    
    while IFS= read -r pair; do
        word1=$(echo "$pair" | awk '{print $1}')
        word2=$(echo "$pair" | awk '{print $2}')
        grep_patterns["$relation"]+="${word1}.*${word2}|${word2}.*${word1}|"
    done < "$word_pairs_file"
    
    # Remove the trailing '|' from the pattern
    grep_patterns["$relation"]="${grep_patterns["$relation"]%|}"
done

# Function to process each relation
process_relation() {
    local relation="$1"
    output_file="$dataset_dir/${relation}_search.txt"
    relation_start_time=$(date +%s)
    
    # For each file, search for the current relation's word pairs
    while IFS= read -r file; do
        if [[ -f "$file" ]]; then
            grep -E "${grep_patterns[$relation]}" "$file" | sort -u >> "$output_file"
        else
            echo "File $file does not exist."
        fi
    done < "$file_paths"
    
    relation_end_time=$(date +%s)
    # Get the size of the constructed relation file in human-readable format
    file_size=$(du -h "$output_file" | cut -f1)
    echo "Constructed: $output_file | Size: $file_size | Time taken: $((relation_end_time - relation_start_time)) sec"
}

# Process each relation in parallel
for relation in "${!relation_files[@]}"; do
    process_relation "$relation" &
done

# Wait for all background processes to complete
wait

end_time=$(date +%s)
execution_time=$((end_time - start_time))
echo "Total execution time: $execution_time seconds"

