#define _POSIX_C_SOURCE 200809L

#include <string.h>
#include <stdlib.h>

#include "map_reduce.h"

void mapper(const char *content, WordCount *word_counts, int *word_count_size) {
    const char *delimiters = " \n.,;:!?'\"()[]{}<>-";
    char *content_copy = strdup(content);
    char *token = strtok(content_copy, delimiters);

    while (token != NULL) {
        int word_exists = 0;

        for (int i = 0; i < *word_count_size; i++) {
            if (strcmp(token, word_counts[i].word) == 0) {
                word_counts[i].count++;
                word_exists = 1;
                break;
            }
        }

        if (!word_exists) {
            word_counts[*word_count_size].word = strdup(token);
            word_counts[*word_count_size].count = 1;
            (*word_count_size)++;
        }

        token = strtok(NULL, delimiters);
    }
}

int compare_word_count(const void *a, const void *b) {
    WordCount *wc_a = (WordCount *)a;
    WordCount *wc_b = (WordCount *)b;

    return wc_b->count - wc_a->count;
}

void reducer(WordCount *word_counts, int word_count_size) {
    qsort(word_counts, word_count_size, sizeof(WordCount), compare_word_count);
}
