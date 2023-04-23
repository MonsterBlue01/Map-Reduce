#ifndef MAP_REDUCE_H
#define MAP_REDUCE_H

typedef struct {
    char* word;
    int count;
} WordCount;

void mapper(const char *content, WordCount *word_counts, int *word_count_size);
void reducer(WordCount *word_counts, int word_count_size);

#endif
