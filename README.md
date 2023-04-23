# MapReduce - Word Count in C

This project demonstrates a simple MapReduce implementation in C for counting the occurrences of words in a text file. The project consists of the following files:

- `map_reduce.c`: Contains the Mapper and Reducer functions.
- `map_reduce.h`: Header file with declarations for the Mapper and Reducer functions.
- `word_count.c`: The main program that reads the input file, calls the Mapper and Reducer functions, and outputs the word count results.
- `Makefile`: A makefile to build and clean the project.

## Usage

To build the project, run the following command in the terminal:

```bash
make
```
To use the program, provide the path to the text file you want to analyze as a command-line argument:
```
./word_count <file_path>
```
Replace <file_path> with the path to the file you want to analyze. The program will output the word occurrences in the given text.

## Example

Let's say you have a text file named example.txt. To analyze the word occurrences in this file, run the following command:
```
./word_count example.txt
```
The output will display the word occurrences in the example.txt file.

## License

This project is open-source and available under the MIT License.