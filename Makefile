CC=gcc
OBJF=./obj
CFLAGS=-g

_OBJS=tcpd.o timer.o ftpc.o ftps.o libvt_pm.o
OBJS=$(patsubst %,$(OBJF)/%,$(_OBJS))


all : ftpc ftps tcpd timer

$(OBJF)/%.o : %.c $(DEPS)
	$(CC) $(CFLAGS) -o $@ -c $<


ftpc : obj/libvt_pm.o obj/ftpc.o
	$(CC) $(CFLAGS) -o $@ $^

ftps : obj/libvt_pm.o obj/ftps.o
	$(CC) $(CFLAGS) -o $@ $^

tcpd : obj/tcpd.o
	$(CC) $(CFLAGS) -o $@ $^

timer : obj/timer.o
	$(CC) $(CFLAGS) -o $@ $^

.PHONY : clean

clean:
	rm timer ftpc ftps tcpd -f $(OBJS)
