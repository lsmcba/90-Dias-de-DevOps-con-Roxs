90-Dias-de-DevOps-con-Roxs
Semana 1 - Dia 1
Punto 1
DevOps es una cultura, una metodología de cómo hacer de forma más ordenada, rápida y con mayor calidad. Yo ya conocia todas las herramientas nombradas, aunque sé que constantemente se van publicando nuevas herramientas, mientras otras quedan obsoletas, así que es importante establecer una conciencia de estudio permanente, esta cultura nunca deja de crecer, siempre seremos alumnos, cometeremos errores, pero prevaleceremos.

Punto 2
Comandos Basicos....

$ whoami
kali
$ pwd
/home/kali
$ ls -lah
total 184K
drwx------ 16 kali kali 4.0K Jun 17 20:39 .
drwxr-xr-x  3 root root 4.0K May 29 15:25 ..
-rw-r--r--  1 kali kali  220 May 29 15:25 .bash_logout
-rw-r--r--  1 kali kali 5.5K May 29 15:25 .bashrc
-rw-r--r--  1 kali kali 3.5K May 29 15:25 .bashrc.original
drwxrwxr-x 10 kali kali 4.0K Jun 17 20:25 .cache
drwxr-xr-x 11 kali kali 4.0K Jun 17 20:17 .config
drwxr-xr-x  2 kali kali 4.0K Jun 17 20:17 Desktop
-rw-r--r--  1 kali kali   35 Jun 17 20:17 .dmrc
drwxr-xr-x  2 kali kali 4.0K Jun 17 20:17 Documents
drwxr-xr-x  2 kali kali 4.0K Jun 17 20:17 Downloads
-rw-r--r--  1 kali kali  12K May 29 15:25 .face
lrwxrwxrwx  1 kali kali    5 May 29 15:25 .face.icon -> .face
drwx------  3 kali kali 4.0K Jun 17 20:17 .gnupg
-rw-------  1 kali kali    0 Jun 17 20:17 .ICEauthority
drwxr-xr-x  3 kali kali 4.0K May 29 15:25 .java
drwxr-xr-x  5 kali kali 4.0K Jun 17 20:17 .local
drwx------  4 kali kali 4.0K Jun 17 20:25 .mozilla
drwxr-xr-x  2 kali kali 4.0K Jun 17 20:17 Music
drwxr-xr-x  2 kali kali 4.0K Jun 17 20:17 Pictures
-rw-r--r--  1 kali kali  807 May 29 15:25 .profile
drwxr-xr-x  2 kali kali 4.0K Jun 17 20:17 Public
-rw-r--r--  1 kali kali    0 Jun 17 20:17 .sudo_as_admin_successful
drwxr-xr-x  2 kali kali 4.0K Jun 17 20:17 Templates
drwxr-xr-x  2 kali kali 4.0K Jun 17 20:17 Videos
$ mkdir devops-d1
$ cd devops-d1
$ echo "Hola DevOps" > hola.txt
$ cat hola.txt
Hola DevOps

$ ls
hola.txt
Punto 3
$ uptime
20:59:59 up 32 min,  1 user,  load average: 0.11, 0.09, 0.08
$ top
top - 21:06:54 up 39 min,  1 user,  load average: 0.00, 0.02, 0.05
Tasks: 189 total,   1 running, 188 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.6 us,  1.1 sy,  0.0 ni, 98.3 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :   3921.4 total,   2804.5 free,    857.7 used,    486.5 buff/cache     
MiB Swap:    953.7 total,    953.7 free,      0.0 used.   3063.7 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
    704 root      20   0  440008 151180  64280 S   3.3   3.8   0:19.87 Xorg
   5971 kali      20   0  732892  68756  53020 S   2.3   1.7   0:07.53 qterminal
   1041 kali      20   0 1189480 136160  93712 S   0.3   3.4   0:05.44 xfwm4
      1 root      20   0   23456  14168  10652 S   0.0   0.4   0:00.99 systemd
      2 root      20   0       0      0      0 S   0.0   0.0   0:00.03 kthreadd
      3 root      20   0       0      0      0 S   0.0   0.0   0:00.00 pool_workqueue_release
      4 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/R-kvfree_rcu_reclaim
      5 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/R-rcu_gp
      6 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/R-sync_wq
      7 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/R-slub_flushwq
      8 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/R-netns
     10 root      20   0       0      0      0 I   0.0   0.0   0:00.01 kworker/0:1-ata_sff
     11 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/0:0H-events_highpri
     12 root      20   0       0      0      0 I   0.0   0.0   0:00.00 kworker/u16:0-ipv6_addrconf
     13 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/R-mm_percpu_wq
     14 root      20   0       0      0      0 I   0.0   0.0   0:00.00 rcu_tasks_kthread
     15 root      20   0       0      0      0 I   0.0   0.0   0:00.00 rcu_tasks_rude_kthread
     16 root      20   0       0      0      0 I   0.0   0.0   0:00.00 rcu_tasks_trace_kthread
     17 root      20   0       0      0      0 S   0.0   0.0   0:00.02 ksoftirqd/0
     18 root      20   0       0      0      0 I   0.0   0.0   0:00.71 rcu_preempt
     19 root      20   0       0      0      0 S   0.0   0.0   0:00.00 rcu_exp_par_gp_kthread_worker/0
     20 root      20   0       0      0      0 S   0.0   0.0   0:00.03 rcu_exp_gp_kthread_worker
     21 root      rt   0       0      0      0 S   0.0   0.0   0:00.05 migration/0
     22 root     -51   0       0      0      0 S   0.0   0.0   0:00.00 idle_inject/0
     23 root      20   0       0      0      0 S   0.0   0.0   0:00.00 cpuhp/0
     24 root      20   0       0      0      0 S   0.0   0.0   0:00.00 cpuhp/1
     25 root     -51   0       0      0      0 S   0.0   0.0   0:00.00 idle_inject/1
     26 root      rt   0       0      0      0 S   0.0   0.0   0:00.53 migration/1
     27 root      20   0       0      0      0 S   0.0   0.0   0:00.04 ksoftirqd/1
     29 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/1:0H-events_highpri
     30 root      20   0       0      0      0 S   0.0   0.0   0:00.00 cpuhp/2
     31 root     -51   0       0      0      0 S   0.0   0.0   0:00.00 idle_inject/2
     32 root      rt   0       0      0      0 S   0.0   0.0   0:00.55 migration/2
$ free -h
               total        used        free      shared  buff/cache   available
Mem:           3.8Gi       855Mi       2.7Gi        17Mi       486Mi       3.0Gi
Swap:          953Mi          0B       953Mi
