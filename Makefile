DIRS = $(shell find . -mindepth 1 -maxdepth 1 -type d)
SOURCES = $(shell find . -name '*.cpp' -o -name '*.c')
OBJS = $(patsubst %.c,%.o,$(patsubst %.cpp,%.o,$(SOURCES)))

PKGS = gl glu freeglut
COMMON_FLAGS = $(shell for d in $(DIRS); do echo -I$$d; done) -Wno-write-strings -include stdlib.h -include string.h $(shell pkg-config --cflags $(PKGS))
CFLAGS = $(COMMON_FLAGS) -Wno-implicit-int
CXXFLAGS = $(COMMON_FLAGS)
LIBS = $(shell pkg-config --libs $(PKGS))

all: hfp

hfp: $(OBJS)
	$(CXX) $^ $(LIBS) -o $@ 

clean:
	rm -f $(OBJS) hfp
