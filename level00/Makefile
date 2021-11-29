NAME=helloworld

SRC=helloworld.c

$(NAME): $(SRC)
	gcc -g -o $(NAME) $(SRC)

clean:
	rm -f $(NAME)

fclean: clean

re: fclean all

all: $(NAME)

.PHONY: all re clean fclean