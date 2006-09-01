//
// $Id$
//
// gcc -o operatr operatr.c
//
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h> 
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <netinet/tcp.h>
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
    
    char packet[4096]; /* Datagram */
    
    char s[200];
    char request[300];
    FILE *fp;
    struct sockaddr_in serv_addr;
    struct hostent *server;
    int opt= TRUE;
    
    struct iphdr *ip = (struct iphdr *) packet;
    struct tcphdr *tcp = (struct tcphdr *) packet + sizeof(struct iphdr);
    
    // server:
    server = gethostbyname(argv[1]);
    if (server == NULL) {
        fprintf(stderr,"ERROR, no such host\n");
        exit(0);
    }
    
    // socket:
    sockfd = socket(AF_INET, SOCK_RAW, IPPROTO_TCP);
    // sockfd = socket ( PF_INET, SOCK_RAW, IPPROTO_RAW );
    if (sockfd < 0) {
        error("ERROR opening socket");
    }

    // socket options:
    // setsockopt(sockfd,SOL_SOCKET,SO_REUSEADDR, (char *)&opt,sizeof(opt));
    setsockopt(sockfd, IPPROTO_IP, IP_HDRINCL, (char *)&opt,sizeof(opt));
    
    // connect:
    serv_addr.sin_family = AF_INET;
    bcopy((char *)server->h_addr, (char *)&serv_addr.sin_addr.s_addr, server->h_length);
    serv_addr.sin_port = htons ( HTTP_PORT );
    
    // Fill in IP headers.
    ip->ihl = 5;
    ip->version = 4;
    ip->tot_len = sizeof(struct iphdr) + sizeof(struct tcphdr);
    ip->id = htons(1337);
    ip->saddr = inet_addr("27.90.90.191");
    ip->daddr = inet_ntoa(serv_addr.sin_addr);
    ip->ttl = 255;
    ip->protocol = 6;
    ip->check = 0;
    ip->tos = 0;
    ip->frag_off = 0;

    // Fill in TCP headers.
    tcp->source = htons(1337);
    tcp->dest = htons(HTTP_PORT);
    tcp->seq = htons(random());
    tcp->ack = 0;
    tcp->syn = 1;
    tcp->window = htons(65535);
    tcp->check = 0;
    tcp->doff = 5;
    tcp->rst = 0;
    tcp->psh = 0;
    tcp->fin = 0;
    tcp->urg = 0;
    tcp->ack_seq = htons(0);
    
    
    // if ( connect ( sockfd, (struct sockaddr *)&serv_addr, sizeof ( serv_addr ) ) < 0 ) {
    //      error ( "ERROR connecting" );
    // }

    // file descriptor
    // fp = fdopen ( sockfd, "r+" );
    // fillin the request:
    // sprintf ( request, "GET / HTTP/1.1\r\nHost: %s\r\nUser-Agent: Operatr/0.1 [%s-%s]\r\nReferer: %s\r\n\r\n", 
    //                    argv[1], __DATE__,__TIME__,
    //                    "http://bezna.org" );
    // send request:
    // fprintf(fp, request);
    // printf(request);
    // ensure it got out
    // fflush (fp);
    // response:
    // while (fgets(s, sizeof(s), fp) != 0) {
    //       fputs(s, stdout);
    // }
    // fclose( fp );

    // send( sockfd, request, sizeof( request ), 0 );
    
    if (sendto(sockfd, packet, ip->tot_len, 0, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0 ) {
        error("ERROR Sending");
    }
    
    close( sockfd );
    
    /*
    if (send(sockfd, argv[1], strlen(argv[1])+1, 0) < 0) {
        error("ERROR Sending");
    }
    */
    
    // printf("Hello Socket!\n");
}

