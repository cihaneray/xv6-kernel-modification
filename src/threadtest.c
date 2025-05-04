#include "types.h"
#include "user.h"
#include "fcntl.h"
#include "stat.h"
#define TIME 10

lock_thread* lock;

void proc1(void* arg1, void* arg2) {
  int is_lock = *(int*)arg1;
  if (is_lock) 
    lock_acquire(lock);
  printf(1, "Proc 1\n");
  sleep(TIME);
  printf(1,"Proc 1 second print\n");
  if (is_lock) 
    lock_release(lock);
  exit();
}

void proc2(void* arg1, void* arg2) {
  int is_lock = *(int*)arg1;
  if (is_lock) 
    lock_acquire(lock);
  printf(1, "Proc 2\n");
  sleep(TIME);
  printf(1,"Proc 2 second print\n");
  if (is_lock) 
    lock_release(lock);
  exit();
}

void proc3(void* arg1, void* arg2) {
  int is_lock = *(int*)arg1;
  if (is_lock) 
    lock_acquire(lock);
  printf(1, "Proc 3\n");
  sleep(TIME);
  printf(1,"Proc 3 second print\n");
  if (is_lock) 
    lock_release(lock);
  exit();
}

void proc4(void* arg1, void* arg2) {
  int is_lock = *(int*)arg1;
  if (is_lock) 
    lock_acquire(lock);
  printf(1, "Proc 4\n");
  sleep(TIME);
  printf(1,"Proc 4 second print\n");
  if (is_lock) 
    lock_release(lock);
  exit();
}
int
main()
{
  lock_init(lock);
  int arg1 = 1, arg2 = 1;

  printf(1, "Threads will be executed in call order in this section:\n");
  thread_create(&proc1, (void *)&arg1, (void *)&arg2);
  thread_join();
  thread_create(&proc2, (void *)&arg1, (void *)&arg2);
  thread_join();
  thread_create(&proc3, (void *)&arg1, (void *)&arg2);
  thread_join();
  thread_create(&proc4,(void *)&arg1, (void *)&arg2);
  thread_join();

  printf(1,"\n");
  arg1 = 0;
  printf(1, "Threads will print their output in the order they finish in this section:\n");
  thread_create(&proc1, (void *)&arg1, (void *)&arg2);
  thread_create(&proc2, (void *)&arg1, (void *)&arg2);
  thread_create(&proc3, (void *)&arg1, (void *)&arg2);
  thread_create(&proc4,(void *)&arg1, (void *)&arg2);
  thread_join();
  thread_join();
  thread_join();
  thread_join();

  exit();
}