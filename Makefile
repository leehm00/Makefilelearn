object := main.o sum.o hello.o leehm.o
override cobject := $(object:.o=.cc)
cur-dir := $(shell pwd)
objects := $(patsubst %.cc,%.o,$(wildcard *.cc))
CC := g++
libs_for_gcc = -lgnu
normal_libs =

comma:= ,
empty:=
space:= $(empty) $(empty)
foo:= a b c
bar:= $(subst $(space),$(comma),$(foo))
ret := $(strip    a b c d )

names := a b c d
files := $(foreach n,$(names),$(n).o)
reverse =  $(2) $(1)

main : $(objects)
ifeq ($(CC),g++)
	@$(CC) -o main  $(objects) $(normal_libs)
else
	@$(CC) -o main $(objects) $(libs_for_gcc)
endif
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
	echo $(ret)
	echo $(join leehm ubuntu ,$(suffix src/foo.c bar.h))
	echo $(basename src/foo.c bar.h)
	echo $(addsuffix $(suffix bar.h),$(basename src/foo.c bar.h))
	echo $(files)
	echo $(call reverse,a,b)
	echo $(origin cobject)