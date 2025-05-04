# xv6 Kernel Modifications

## Overview

This project involves extending the standard xv6 teaching operating system kernel with several new features and system calls. The modifications enhance process scheduling, add basic threading capabilities, implement memory protection, and provide tools for system call analysis.

## Features Implemented

1.  **System Call Counting:**
    *   Added a new system call `getreadcount()` (syscall number 22) to count the total number of `read` system calls invoked since kernel boot.
2.  **System Call Tracing:**
    *   Modified the main `syscall()` function to print the name and return value of each system call executed to the console.
3.  **Lottery Scheduler:**
    *   Replaced the default round-robin scheduler with a lottery scheduler.
    *   Processes are assigned "tickets"; the scheduler randomly selects a winning ticket to determine the next process to run.
    *   Added `settickets()` (syscall number 23) for processes to potentially adjust their ticket count (though primarily used internally in `fork` and `allocproc` in this implementation).
    *   Added `getpinfo()` (syscall number 24) to retrieve process status information (PID, tickets, ticks used) via a `struct pstat`.
    *   Included a modified `ps` user program to display this lottery scheduler information.
    *   Discussed aging mechanisms theoretically to prevent starvation in potentially unfair scheduling scenarios.
4.  **User-Level Threads:**
    *   Introduced lightweight user-level threads using shared address spaces.
    *   Added `clone()` (syscall number 25) to create a new thread sharing the parent's address space but with its own stack.
    *   Added `join()` (syscall number 26) for a parent process to wait for a child thread (created via `clone`) to exit.
    *   Implemented user library functions (`thread_create`, `thread_join`) and basic spinlocks (`lock_init`, `lock_acquire`, `lock_release`) in `ulib.c`.
    *   Provided a `threadtest` user program to demonstrate thread creation, joining, and locking.
5.  **Memory Protection:**
    *   Added `mprotect()` (syscall number 22 - *Note: Reused from Task 1, adjusted to 25/26 in Task 3, implies syscall numbers need final verification*) and `munprotect()` (syscall number 23 - *See previous note*) system calls.
    *   `mprotect()` makes specified memory pages read-only.
    *   `munprotect()` makes specified memory pages writable again.
    *   Modified the user program entry point in the `Makefile` to `0x1000`.
    *   Included `mprotectTest` and `munprotectTest` user programs to verify functionality.

## Setup and Running

### Prerequisites

*   A C compiler (like GCC) and build tools (`make`).
*   QEMU system emulator (`qemu-system`). On Ubuntu/Debian: `sudo apt install qemu-system`
*   `git` for cloning the repository.

### 1. Get the Code

Clone the original xv6 repository (or your modified fork if applicable):

```bash
git clone https://github.com/cihaneray/xv6-kernel-modification.git
cd xv6-kernel-modification/src
```

### 2. Build the Kernel

Navigate to the `xv6-kernel-modification/src` directory in your terminal and run:

```bash
make
```

This compiles the kernel and user programs.

### 3. Run xv6 in QEMU

To start xv6 within the QEMU emulator, run:

```bash
make qemu
```

or for a graphical console without backgrounding:

```bash
make qemu-nox
```

You will see the xv6 boot messages and eventually the `$` shell prompt.

## Feature Details and Testing

### System Call Counting & Tracing

*   **Implementation:** Modified `syscall.h`, `syscall.c`, `sysfile.c`, `user.h`, `usys.S`.
*   **Testing:**
    *   Run any command within xv6 (e.g., `ls`, `echo hello`). The console will display output like `fork -> 3`, `exec -> 0`, `open -> 3`, `write -> 1`, etc., showing the system call name and its return value.
    *   While a specific user program calling `getreadcount()` wasn't detailed in the final test steps, the underlying mechanism is in place. `read` calls will increment the internal `readcount`.

### Lottery Scheduler

*   **Implementation:** Modified `proc.h`, `syscall.h`, `syscall.c`, `sysproc.c`, `proc.c`, `defs.h`, `user.h`, `usys.S`, `pstat.h`. Created/modified `ps.c`. Updated `Makefile`.
*   **Key Changes:** `proc` struct has `tickets` and `pticks`. `scheduler()` in `proc.c` implements lottery logic. `allocproc` initializes tickets, `fork` inherits and slightly randomizes them.
*   **Testing:** Run the `ps` command in the xv6 shell. Output will include process PID, tickets allocated, and ticks accumulated for each active process.
    ```bash
    $ ps
    PInuse: 1 PID: 1 PTickets: 10 PTicks: 5
    PInuse: 1 PID: 2 PTickets: 15 PTicks: 2
    ...
    ```
*   **Starvation:** Addressed theoretically by proposing an aging mechanism where processes gain tickets over time if not scheduled, ensuring eventual execution.

### User-Level Threads

*   **Implementation:** Added `clone`, `join` syscalls (`syscall.h`, `syscall.c`, `sysproc.c`, `proc.c`). Added user library functions and lock structure (`ulib.c`, `user.h`). Added `threadtest` to `Makefile`. Modified `forktest` dependencies in `Makefile` to allow `malloc` in `ulib.c`.
*   **Key Changes:** `clone()` shares address space but uses a new stack. `join()` waits specifically for `clone`d children. `thread_create` allocates stack via `malloc`. Spinlock uses `xchg` atomic instruction.
*   **Testing:** Run the `threadtest` command in the xv6 shell.
    ```bash
    $ threadtest
    ```
    Observe the output:
    1.  The first part demonstrates sequential execution using `thread_join` immediately after each `thread_create` with locks enabled. Output should be ordered (Proc 1, Proc 1 second, Proc 2, Proc 2 second, ...).
    2.  The second part runs threads concurrently without locks or intermediate joins. The output order will likely be interleaved (e.g., Proc 1, Proc 3, Proc 2, Proc 1 second, Proc 4, ...), demonstrating non-deterministic scheduling.

### Memory Protection

*   **Implementation:** Added `mprotect`, `munprotect` syscalls (`syscall.h`, `syscall.c`, `sysproc.c`, `vm.c`, `user.h`, `usys.S`). Modified `Makefile` entry point, `vm.c` (`copyuvm`, `argptr`), added test programs.
*   **Key Changes:** `mprotect` clears the `PTE_W` (write) flag for specified pages. `munprotect` sets the `PTE_W` flag. `argptr` checks against null pointer access. User programs now start at `0x1000`.
*   **Testing:**
    *   Run `mprotectTest`:
        ```bash
        $ mprotectTest
        Allocated page at address 0x...
        if a trap err occurred ----> mprotect test passed
        # (Expect a trap/page fault here as the process tries to write to read-only memory)
        ```
    *   Run `munprotectTest`:
        ```bash
        $ munprotectTest
        Allocated page at address 0x...
        munprotect test passed
        # (No trap occurs as the page is made writable again before the write)
        ```

## Build System Modifications

*   Added `_ps`, `_threadtest`, `_mprotectTest`, `_munprotectTest` to `UPROGS` in the `Makefile`.
*   Updated `EXTRA` in `Makefile` for `threadtest`.
*   Removed `forktest` dependencies conflicting with `malloc` usage in `ulib.c`.
*   Changed the user program linker script (`user.ld`) entry point target address to `0x1000`.

## Acknowledgements

Based on the xv6 teaching operating system from MIT PDOS.
