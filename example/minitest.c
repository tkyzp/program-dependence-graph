#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char __attribute__((annotate("sensitive"))) *key;
char *ciphertext;
unsigned int i;

void greeter(char *str){
    printf(str);
    printf(", Hello!\n");
}

void initkey(int sz){
    key = (char *) malloc(sz);
    for(i=0; i<sz; i++){
        key[i] = 'A';
    }
}

void encrypt(char *plaintext, int sz){
    ciphertext = (char *) malloc(sz);
    for(i=0; i<sz; i++){
        ciphertext[i] = plaintext[i] ^ key[i];
    }
}

int main(){
    char username[20], text[1024];
    printf("Enter your name: ");
    scanf("%19s", username);
    greeter(username);
    printf("Enter your text: ");
    scanf("%1023s", text);
    initkey(strlen(text));
    encrypt(text, strlen(text));
    printf("Encrypted text: ");
    for(i=0; i<strlen(text); i++){
        printf("%02X", ciphertext[i]);
    }
    printf("\n");
    return 0;
}