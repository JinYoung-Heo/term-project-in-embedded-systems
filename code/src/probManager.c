#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "../inc/cJSON.h"

cJSON* read_json(const char *filename) {
    // Open the JSON file
    FILE *file = fopen(filename, "r");
    if (!file) {
        perror("Failed to open file");
        exit(EXIT_FAILURE);
    }

    // Get the file size
    fseek(file, 0, SEEK_END);
    long filesize = ftell(file);
    rewind(file);

    // Allocate memory to read the file
    char *json_data = (char *)malloc(filesize + 1);
    if (!json_data) {
        perror("Failed to allocate memory");
        fclose(file);
        exit(EXIT_FAILURE);
    }

    // Read the file into the buffer
    fread(json_data, 1, filesize, file);
    json_data[filesize] = '\0'; // Null-terminate the string

    fclose(file);

    // Parse the JSON data
    cJSON *json = cJSON_Parse(json_data);
    if (!json) {
        fprintf(stderr, "Error parsing JSON: %s\n", cJSON_GetErrorPtr());
        free(json_data);
        exit(EXIT_FAILURE);
    }

    // Example: Print the JSON data (Assuming it's an object with key-value pairs)
    // cJSON *item = NULL;
    // cJSON_ArrayForEach(item, json) {
    //     printf("Key: %s, Value: %s\n", item->string, cJSON_Print(item));
    // }

    // Clean up
    // cJSON_Delete(json);
    free(json_data);

    return json;
}

// Generate a random number between 0 and max - 1
int getRandomNumber(int max) {
    return rand() % max;
}

// Get a random problem from the json file
// string getRandomProblem(cJSON *json_map) {
//     int rand1 = getRandomNumber(10);
//     int rand2 = getRandomNumber(10);
//     return json_map[rand1][rand2];
// }

char* getRandomProblem(cJSON *json_map) {
    srand(time(NULL));   // Initialization, should only be called once.
    int rand1 = getRandomNumber(10);
    int rand2;
    // Buffer to hold the resulting string
    char key[20];
    
    // Converting integer to string using sprintf
    // printf("Random numbers: %d, %d\n", rand1, rand2);
    sprintf(key, "%d", rand1);
    // printf("Key: %s\n", key);
    cJSON *probArray = cJSON_GetObjectItemCaseSensitive(json_map, key);
    
    size_t arraySize = cJSON_GetArraySize(probArray);
    rand2 = getRandomNumber(arraySize);
    // printf("Array size: %ld\n", arraySize);
    // printf("%s\n", cJSON_GetArrayItem(probArray, 0)->valuestring);
    return cJSON_GetArrayItem(probArray, rand2)->valuestring;
}

char* generateAlarmProblem(){
    const char *filename = "algebraic-expressions.json";
    cJSON *algebraic_expressions = read_json(filename);
    char* problem = getRandomProblem(algebraic_expressions);
    return problem;
}

// int main(void) {
//     const char *filename = "algebraic-expressions.json";
//     cJSON *algebraic_expressions = read_json(filename);
//     char* problem = getRandomProblem(algebraic_expressions);
//     printf("Random problem: %s\n", problem);
//     // cJSON *probArray = cJSON_GetObjectItemCaseSensitive(algebraic_expressions, "0");
//     // printf("%s\n", cJSON_GetArrayItem(probArray, 0)->valuestring);
//     printf("Press Enter to continue...");
//     getchar();
//     // string problem = getRandomProblem(json_map);
//     // printf("%s\n", problem);
//     return 0;
// }