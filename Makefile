#
#
# Makefile for GCW Zero
#
#

TARGET = bearys_bash

#CC = mipsel-linux-gcc
CC = gcc

INC	= -Isrc -Isrc/algif -Isrc/fblend -Isrc/alfont \
	  `freetype-config --cflags`

WFLAGS	= \
	  -W -Wall -Wno-deprecated-declarations \
	  -Wno-write-strings -Wno-sign-compare \
	  -Wno-unused-value -Wno-type-limits

CFLAGS	= -g -O2 $(WFLAGS) $(INC)
LDFLAGS	= -lstdc++ -lm `allegro-config --libs` `freetype-config --libs`

OBJ	= \
	src/main.o \
	src/alfont/alfont.o \
	src/algif/algif.o \
	src/algif/gif.o \
	src/algif/lzw.o \
	src/fblend/2xstretch.o \
	src/fblend/cadd.o \
	src/fblend/ctrans.o \
	src/fblend/radd.o \
	src/fblend/rtrans.o

all : $(TARGET)

$(TARGET) : $(OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

%.o : %.c
	$(CC) -c $(CFLAGS) $< -o $@

%.o : %.cpp
	$(CC) -c $(CFLAGS) $< -o $@

clean :
	rm -rf $(OBJ) $(TARGET)
