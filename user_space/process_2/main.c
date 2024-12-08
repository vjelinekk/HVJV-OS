#include <stdio.h>
#include <process.h>

int main() {
    for (int i = 0; i < 10; i++) {
        printf("Hello from process 2\n");
    }
    int pid = getpid();
    printf("Process 2 PID: %d\n", pid);
    return 0;
}
