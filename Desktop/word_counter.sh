#!/bin/bash
text="$1"
k="$2"

# Remove punctuation, convert to lowercase, split into words, and sort
processed_text=$(cat "$text" | tr -d '[:punct:]' | tr ' ' '\n')

# Count the total words
total_words=$(echo "$processed_text" | wc -w)

# Count the total characters
total_characters=$(echo "$processed_text" | tr -d '\n' | wc -c)

# Count word frequency, remove digits, and display the top k words
word_frequency=$(echo "$processed_text" | uniq -c | sort -k1,1nr -k2,2 | tr -d '1234567890''  ' | head -n "$k")

echo "Total Words: $total_words"
echo "Total Characters: $total_characters"
echo -e "Word Frequency:\n$word_frequency"

