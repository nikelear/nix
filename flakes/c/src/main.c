#include <stdio.h>

int main() {
    int N;
    scanf("%d", &N);

    if (N > 0 && N < 101) {
        printf("%d\n", N * N);
    } else {
    	printf("Inputs is out of range");
    };
    return 0;
}
