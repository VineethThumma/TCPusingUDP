CC=gcc
OBJF=./obj
CFLAGS=-g
MKDIR_P = mkdir -p

_OBJS=tcpd.o timer.o ftp_client.o ftp_server.o lib_tcp.o
OBJS=$(patsubst %,$(OBJF)/%,$(_OBJS))


all : obj_dir ftp_client ftp_server tcpd timer

obj_dir:
	${MKDIR_P} obj/	 

$(OBJF)/%.o : %.c $(DEPS)
	$(CC) $(CFLAGS) -o $@ -c $<

ftp_client : obj/lib_tcp.o obj/ftp_client.o
	$(CC) $(CFLAGS) -o $@ $^

ftp_server : obj/lib_tcp.o obj/ftp_server.o
	$(CC) $(CFLAGS) -o $@ $^

tcpd : obj/tcpd.o
	$(CC) $(CFLAGS) -o $@ $^

timer : obj/timer.o
	$(CC) $(CFLAGS) -o $@ $^

.PHONY : clean

clean:
	rm timer ftp_client ftp_server tcpd -f $(OBJS)
	rm -r obj/
