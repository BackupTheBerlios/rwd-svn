//
// $Id$
//
// gcc -o operatr operatr
//
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h> 
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <string.h>

#define TRUE  1
#define FALSE 0

#define HTTP_PORT 80

void error(char *message)
{
    perror(message);
    exit(1);
}

int main(int argc, char *argv[])
{
    int sockfd;
    char s[200];
    char old_line[200];
    char request[300];
    FILE *fp;
    struct sockaddr_in serv_addr;
    struct hostent *server;
    int opt= TRUE;
    
    // server:
    server = gethostbyname(argv[1]);
    if (server == NULL) {
        fprintf(stderr,"ERROR, no such host\n");
        exit(0);
    }
    
    // socket:
    sockfd = socket(PF_INET, SOCK_STREAM, 0);
    // sockfd = socket ( PF_INET, SOCK_RAW, IPPROTO_RAW );
    if (sockfd < 0) {
        error("ERROR opening socket");
    }
    // socket options:
    // setsockopt(sockfd,SOL_SOCKET,SO_REUSEADDR, (char *)&opt,sizeof(opt));
    // setsockopt(sockfd, IPPROTO_IP, IP_HDRINCL, (char *)&opt,sizeof(opt));
    
    // connect:
    serv_addr.sin_family = AF_INET;
    bcopy((char *)server->h_addr, (char *)&serv_addr.sin_addr.s_addr, server->h_length);
    serv_addr.sin_port = htons(HTTP_PORT);
    
    if (connect(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0) {
        error("ERROR connecting");
    }

    // file descriptor
    fp = fdopen(sockfd, "r+");
    // fillin the request:
    sprintf(request, "GET / HTTP/1.1\r\nHost: %s\r\nUser-Agent: Operatr/0.1 [%s-%s]\r\nReferer: %s\r\n\r\n", 
                     argv[1],__DATE__,__TIME__,
                     "http://www.example.org");
    // send request:
    fprintf(fp, request);
    printf( request );
    // ensure it got out
    fflush(fp);
    // response:
    // while ( fgets(s, sizeof(s), fp) != 0 ) {
    //     fputs(s, stdout);
    // }
    fclose(fp);
}

