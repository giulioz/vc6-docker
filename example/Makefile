OBJ  = test.obj
LINKOBJ  = test.obj
LIBS = /LIBPATH:Z:\opt\vc\LIB
INCS =  /IZ:\opt\vc\INCLUDE
CXXINCS =  /IZ:\opt\vc\INCLUDE
BIN  = test.exe
CXXFLAGS = $(CXXINCS) /GX

all: test.exe

clean:
	del $(OBJ) $(BIN)

$(BIN): $(OBJ)
	link $(LINKOBJ) /out:"test.exe" $(LIBS)

test.obj: test.cpp
	cl /c test.cpp /Fetest.obj $(CXXFLAGS)
