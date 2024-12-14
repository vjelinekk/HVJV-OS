#include <stdio.h>
#include <string.h>
#include <process.h>

static int simulation_started = 0;

int main() {
    printf("shell> ");
    char buffer[100];
    int i = 0;
    while (1) {
        while (1) {
            char c = getchar();
            if (c == 0) {
                continue;
            }
            if (c == '\n') {
                i = 0;
                if (strcmp(buffer, "start simulation") == 0) {
                    printf("\n");
                    printf("Starting simulation\n");
                    start_simulation();
                    simulation_started = 1;
                    // clear buffer
                    memset(buffer, 0, sizeof(buffer));
                } else {
                    printf("\n");
                    printf("Unknown command\n");
                    memset(buffer, 0, sizeof(buffer));
                }
                break;
            }
            buffer[i++] = c;
            printf("%c", c);
        }
        if (simulation_started) {
            simulation_started = 0;
            continue;
        }
        printf("\nshell> ");
    }

    return 0;
}
