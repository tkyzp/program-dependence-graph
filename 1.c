#include <stdlib.h>

char * fun(char **q){
    *q = malloc(4);
    *q = malloc(4);
    *q = malloc(4);

    return *q;
}

char *fun2(){
    char *p;
    p = malloc(4);
    p = malloc(4);
    p = malloc(4);

    int a = (int)p + 4;
    p = (char *)((int)p + 1);
    fun(&p);
    return p;
}