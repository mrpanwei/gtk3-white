CC = gcc
PROG_NAME=hello
INCS=
SRCS=hello.c 
OBJS=${SRCS:.c=.o}
LIBS=gtk+-3.0
CFLAGS=`pkg-config --cflags ${LIBS}` -g -Wall -lpthread 
LDFLAGS=`pkg-config --libs ${LIBS}`  -g -Wall -lpthread 
all:${PROG_NAME}
${PROG_NAME}:${OBJS}
	${CC} -o ${PROG_NAME} ${OBJS} ${LDFLAGS}
${OBJS}:${INCS}
.c.o:
	${CC} -c $< ${CFLAGS}
clean:
	rm -f *.o ${PROG_NAME}
rebuild:clean all
