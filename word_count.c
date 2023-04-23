#include <stdio.h>
#include <stdlib.h>

#include "map_reduce.h"

#define MAX_WORDS 10000

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <file_path>\n", argv[0]);
        return 1;
    }

    FILE *file = fopen(argv[1], "r");
    if (file == NULL) {
        perror("Error opening file");
        return 1;
    }

    fseek(file, 0, SEEK_END);
    size_t file_size = ftell(file);
    fseek(file, 0, SEEK_SET);

    char *file_content = (char *)malloc(file_size + 1);
    size_t read_bytes = fread(file_content, 1, file_size, file);
    if (read_bytes != file_size) {
        perror("Error reading file");
        fclose(file);
        free(file_content);
        return 1;
    }
    file_content[file_size] = '\0';

    fclose(file);

    WordCount word_counts[MAX_WORDS];
    int word_count_size = 0;

    // Call the Mapper function from mapper_reduce.c
    mapper(file_content, word_counts, &word_count_size);

    // Call the Reducer function from mapper_reduce.c
    reducer(word_counts, word_count_size);

    printf("Word occurrences:\n");
    for (int i = 0; i < word_count_size; i++) {
        printf("%s: %d\n", word_counts[i].word, word_counts[i].count);
    }

    free(file_content);
    return 0;
}
