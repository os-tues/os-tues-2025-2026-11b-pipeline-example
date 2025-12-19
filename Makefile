build: tailC

tailC:
	gcc -Wall -Wextra -pedantic -std=c11 tail.c -o tail

clean:
	rm -f tail out* time_*
	rm -rf ./target