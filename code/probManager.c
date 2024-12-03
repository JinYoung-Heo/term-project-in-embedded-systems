#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <jsoncpp/json/json.h>

void read_json_file(const char *filename, struct json_object **json_map) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        perror("Unable to open file");
        return;
    }

    fseek(file, 0, SEEK_END);
    long file_size = ftell(file);
    fseek(file, 0, SEEK_SET);

    char *file_contents = (char *)malloc(file_size + 1);
    fread(file_contents, 1, file_size, file);
    fclose(file);
    file_contents[file_size] = '\0';

    *json_map = json_tokener_parse(file_contents);

    free(file_contents);
}

struct json_object* readProblemJson(const char *filename) {
    struct json_object *json_map = NULL;
    read_json_file(filename, &json_map);
    return json_map;
}

// Generate a random number between 0 and max - 1
int getRandomNumber(int max) {
    return rand() % max;
}

// Get a random problem from the json file
string getRandomProblem(struct json_object *json_map) {
    int rand1 = getRandomNumber(10);
    int rand2 = getRandomNumber(10);
    return json_map[rand1][rand2];
}

int main() {
    struct json_object *json_map = readProblemJson("problems.json");
    string problem = getRandomProblem(json_map);
    printf("%s\n", problem);
    return 0;
}