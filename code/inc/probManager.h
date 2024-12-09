#ifndef probManager_h
#define probManager_h

#include "../inc/cJSON.h"

cJSON* read_json(const char *filename);
int getRandomNumber(int max);
char* getRandomProblem(cJSON *json_map);
char* generateAlarmProblem();

#endif