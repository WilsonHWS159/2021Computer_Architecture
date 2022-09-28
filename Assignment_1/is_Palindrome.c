#include<stdio.h>

int is_Palindrome(int x){
	if(x >= 0){
		int tmp = x;
		long rv_Int = 0;
		while(tmp){
			rv_Int *= 10;
			rv_Int += tmp % 10;
			tmp /= 10;
		}
		return x == rv_Int;
	}
	return 0;
}

int main(){
	int data[5] = {0, 1234567899, 12321, -878, -789};
	for(int i=0; i<(sizeof(data)/sizeof(int)); i++){
		if(is_Palindrome(data[i]))
			printf("%d is palindrome\n", data[i]);
		else
			printf("%d is not palindrome\n", data[i]);
	}
	return 0;
}
