#include "types.h"
#include "pstat.h"
#include "user.h"
#include "param.h"
#include "pstat.h"
int
main(int argc, char *argv[]) {
    struct pstat *prstat = malloc(sizeof(struct pstat));
    getpinfo(prstat);
    int i;
    for(i=0;i<NPROC-1;i++){
        if(prstat->inuse[i]>0){
            printf(1,"\nPInuse: %d ",prstat->inuse[i]);
            printf(1,"PID: %d ", prstat->pid[i]);
            printf(1,"PTickets: %d ", prstat->tickets[i]);
            printf(1,"PTicks: %d",prstat->ticks[i]);
        }
    }
    printf(1,"\n");
    exit();
}
