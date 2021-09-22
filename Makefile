object := main.o sum.o hello.o leehm.o
cobject := $(object:.o=.cc)
cur-dir := $(shell pwd)
objects := $(patsubst %.cc,%.o,$(wildcard *.cc))
main : $(objects)
	@g++ -o main  $(objects)
#@不会显示此行命令
main.o :  sum.h
sum.o : sum.h hello.h
hello.o : hello.h
leehm.o : leehm.h
#$(objects):%.o:%.cc
.PHONY : clean
clean :
	@ls
	@rm  -f main $(objects)
	@echo "i love u"
	echo $(cobject)