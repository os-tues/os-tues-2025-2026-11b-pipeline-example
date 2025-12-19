#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

int main(int argc, char const *argv[]) {
    if (argc < 2){
        const char *msg = "noArg";
        write(2, msg, 5);
        return 2;
    }

    for(int i=1;i<argc;i++){
        int fd = open(argv[i], O_RDONLY,0);
        if(fd==-1){
            const char *msg = "fileErr";
            write(2, msg, 7);
            return 2;
        }
        int end = lseek(fd,0,SEEK_END),pos=end,count=0;
        char ch;
        while(pos>0 && count<10){
            pos = lseek(fd,--pos,SEEK_SET);
            if(read(fd,&ch,1)==1 && ch=='\n') count++;
        }
        pos++;
        char *buff = malloc(end-pos);
        lseek(fd, pos, SEEK_SET);
        ssize_t dSize = read(fd,buff,end-pos);
        if(dSize>0) write(1,buff,dSize);
        free(buff);
        close(fd);
    }
  return 0;
}
