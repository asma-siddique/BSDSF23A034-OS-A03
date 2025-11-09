#include "shell.h"

int handle_builtin(char **arglist) {
    if (arglist == NULL || arglist[0] == NULL) return 0;

    if (strcmp(arglist[0], "exit") == 0) {
        printf("Exiting shell.\n");
        exit(0);
    }

    if (strcmp(arglist[0], "cd") == 0) {
        if (arglist[1] == NULL) {
            fprintf(stderr, "cd: missing argument\n");
            return 1;
        }
        if (chdir(arglist[1]) != 0) {
            perror("cd");
        }
        return 1;
    }

    if (strcmp(arglist[0], "help") == 0) {
        printf("Built-in commands:\n");
        printf("  exit - exit the shell\n");
        printf("  cd <dir> - change directory\n");
        printf("  help - show this message\n");
        printf("  jobs - list background jobs (not implemented yet)\n");
        return 1;
    }

    if (strcmp(arglist[0], "jobs") == 0) {
        printf("jobs: not implemented yet.\n");
        return 1;
    }

    return 0;
}

