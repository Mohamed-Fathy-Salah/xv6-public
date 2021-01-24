# Table of content
- [Scheduler](#Scheduler)
    - [Required](#Required)
    - [Implementation](#Implementation)
    - [Test](#Test)
- [Virtual memory](#Virtual-memory)
    - [Required](#Required-1)
    - [Implementation](#Implementation-1)
    - [Test](#Test-1)
- [Thread](#Threads)
    - [Required](#Required-2)
    - [Implementation](#Implementation-2)
    - [Test](#Test-2)
- [References](#References)
- [Team](#Team)

---
## Scheduler
### Required

### Implementation

### Test

---
## Virtual memory
### Required

Read-only code:
- change the protection of parts of the page table to be read-only or read/write
- xv6 should trap and kill the process if the code tries to access a protected page.
- the page protection should be inherited on `fork()` . Thus, if a process has mprotected some of its pages, when the process calls fork, the OS should copy those protections to the child process.
- if any of these happened : `return -1` and do not change anything. otherwise, `return 0` upon success.
> `addr` is not page aligned

> `addr` points to a region that is not currently a part of the address space

> `len` is less than or equal to zero.


### Implementation
- by changing the `WRITEABLE` protection bit in the page table entry we control its write protection
- to do this we created 2 system calls `int mprotect(void *addr,int len)` and `int munprotect(void *addr,int len)`.
    - `mprotect` change the protection of the page to read only
    - `munprotect` change the protection of the page to read/write 
    - `addr` is the start of the page.
    - `len` is the number of pages to be modified.
- the system calles are done by modifing the following files:
    - `syscall.h` in this file you add the system call name in the following pattern `SYS_name` and give it the mex of the numbers in the file. this will be used as an index in the array of functions in `syscall.c` and will be used by the trap frame to know which function to be executed when a system call occures.
        ```
        #define SYS_mprotect 25
        #define SYS_munprotect 26
        ```

    - `syscall.c` in this file you make the systemcall prototype and make it extern to be used outside this file in the following pattern `sys_name(void);`  and add them to the array `syscalls`
        ```
        extern int sys_mprotect(void);
        extern int sys_munprotect(void);
        ```
        ```
        [SYS_mprotect] sys_mprotect,
        [SYS_munprotect] sys_munprotect,
        ```

    - `defs.h`
        ```
        int mprotect(void *addr,uint len);
        int munprotect(void *addr,uint len);
        ```
    - `usys.S`
        ```
        SYSCALL(mprotect)
        SYSCALL(munprotect)
        ```
    - `sysproc.c` in this file you implement `sys_mprotect` and `sys_munprotect` . it's purpose is to get the arguments from the stack and check if they are valid before passing them to the `mprotect` and `munprotect`

        ```
        int sys_mprotect(void){
            void *addr;
            int len;
            if(argptr(0,(void*)&addr,sizeof(void*))<0||argint(1,&len)<0)return -1; 
            if(len <= 0){
                cprintf("\nzero/negative length!\n");
                return -1;
            }
            if((int)(((int)addr)%PGSIZE)){
                cprintf("\nnot page aligned!\n");
                return -1;
            }
            return mprotect(addr,len);
        }
        ```
        ```
        int sys_munprotect(void){
            void * addr;
            int len;
            if(argptr(0,(void*)&addr,sizeof(void*))<0||argint(1,&len)<0)return -1; 
            if(len <= 0){
                cprintf("\nzero/negative length!\n");
                return -1;
            }
            if((int)(((int)addr)%PGSIZE)){
                cprintf("\nnot page aligned!\n");
                return -1;
            }
            return munprotect(addr,len);
        }
        ```


### Test

---
## Threads
### Required

### Implementation

### Test

---
## References
- [add new system call]
- [how does system call works]
- [context switch]
- [memory managment]
- [xv6 book]
- [allocating memory]
- [sys calls]

## Team
- Mohamed Fathy Salah

[add new system call]: <https://medium.com/@viduniwickramarachchi/add-a-new-system-call-in-xv6-5486c2437573>
[how does system call works]: <https://medium.com/@flag_seeker/xv6-system-calls-how-it-works-c541408f21ff>
[context switch]: <https://ppan-brian.medium.com/context-switch-from-xv6-aedcb1246cd>
[memory managment]: <https://ppan-brian.medium.com/xv6-memory-management-3dfc1d53bd4f>
[xv6 book]: <https://pekopeko11.sakura.ne.jp/unix_v6/xv6-book/en/index.html>
[allocating memory]: <http://people.cs.pitt.edu/~lol16/CS1550_fall18/data/CS1550_Lab3.pdf>
[sys calls]: <https://github.com/YehudaShapira/xv6-explained/blob/master/xv6%20Code%20Explained.md>

