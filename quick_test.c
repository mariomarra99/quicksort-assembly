#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void quick_c(int arr[], int low, int high);
void quick_assembly(int arr[], int low, int high);

int main() {
    time_t start, end;
	int n = 100000000, num_arr = 1, i, j, e;
	int *arr_c, *arr_assembly;

	start = time(NULL);
	for (i = 0; i < num_arr; i++){
		arr_c = (int*)calloc(n, sizeof(int));
		for (j = 0; j < n; j++){
			e = rand();
			arr_c[j] = e;
		}  
	}
	end = time(NULL);
	printf("Created C array in %.2f seconds", difftime(end, start));
	printf("\n");
	
	start = time(NULL);
	for (i = 0; i < num_arr; i++){
		arr_assembly = (int*)calloc(n, sizeof(int));
		for (j = 0; j < n; j++){
			e = rand();
			arr_assembly[j] = e;
		}  
	}
	end = time(NULL);
	printf("Created Assembly array in %.2f seconds", difftime(end, start));
	printf("\n");

	start = time(NULL);
	quick_c(arr_c, 0, n - 1);
	end = time(NULL);
	printf("Test (C): Sorted array in %.2f seconds", difftime(end, start));
	printf("\n");

	start = time(NULL);
	quick_assembly(arr_assembly, 0, n - 1);
	end = time(NULL);
	printf("Test (Assembly): Sorted array in %.2f seconds", difftime(end, start));
	printf("\n");
	
	free(arr_c);
	free(arr_assembly);

	return 0;
}
