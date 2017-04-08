##  LEGEND  ##
# cible: dependances
#		commandes
#
# $< signifie premiere dependance
# $^ signifie toute les dependances
# $@ signifie la cible
# % signifie wildcard (un a plusieurs caractere)
# .PHONY utilisee pour differencier un commande d'un fichier du meme nom que la commande
#.SUFFIXES:            # Delete the default suffixes
#.SUFFIXES: .c .o .h   # Define our suffix list
## ## ## ## ## ## 

.SUFFIXES:
.SUFFIXES: .c .o

####################
#    VARIABLES     #
####################
CC = gcc
CFLAGS = -g -Wall -ansi -std=c99
LDFLAGS =
BIN_DIR = inf3172/bin
SRC_DIR = ./src
SRCS= $(wildcard *.c)
OBJS= $(SRCS:.c=.o)
PROG= fin list new newdir rmall size tsh
LIST= $(addprefix $(BIN_DIR)/, $(PROG))

all: dir $(LIST) tsh
.PHONY: all dir

dir:
	mkdir -p $(BIN_DIR)

# COMMAND
$(BIN_DIR)/%: %.o
	$(CC) -o $@ $^ $(LDFLAGS)

%.o: %.c
	$(CC) -o $@ -c $< $(CFLAGS)

# MAIN
tsh: tsh.o
	$(CC) -o $@ $^ $(LDFLAGS)


.PHONY: clean cleanExec
clean: cleanExec
	rm -rf $(OBJS)
cleanExec:
	rm -f $(LIST) tsh