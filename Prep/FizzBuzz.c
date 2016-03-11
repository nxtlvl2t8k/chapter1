#include <stdio.h>



int main() {

char div3[4] = "Fizz";
char div5[4] = "Buzz";
char both[9] = "FizzBuzz";

	for (int i = 1; i <= 100; i++) {
		//for (int multiplier = 1; multiplier <= 35; multiplier++) {
	
			if (i %3 == 0 && i %5 == 0) {
				printf("FizzBuzz \n");
				//printf("A");
				
			}else if (i %3 == 0) {
				printf("Fizz \n");
				//printf("B");
			}else if (i % 5 == 0) {
				printf("Buzz \n");
				//printf("C");
            }else{
                printf("%d \n", i);
            }
	}
	return 0;

}
