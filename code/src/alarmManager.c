#include <lcdManager.h>
#include <buzzerManager.h>
#include <probManager.h>
#include <bluetoothManager.h>

void alarmStart(){
    buzzerConfiguration();
    buzzerOn();

    // // Sleep for 3 seconds
    // for(int i = 0; i < 3000000; i++) {;}

    // buzzerOff();

    // Problem problem = getRandomProblem();
    // showProb(problem);
    // activateRecordButtonListener();
}

void alarmListener(){
    // while(!receivedMessageFromApp){;}
    // buzzerOn();
    // Problem problem = getRandomProblem();
    // showProb(problem);
    // activateRecordButtonListener();
}