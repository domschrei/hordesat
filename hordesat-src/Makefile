WSPACE = 	..

LGLSRC = 	$(WSPACE)/lingeling
LGLBIN = 	$(WSPACE)/lingeling
YALBIN =    $(WSPACE)/yalsat

CXXFLAGS =	-O3 -g -std=c++11 -Wall -fmessage-length=0 -I$(LGLSRC) -D __STDC_LIMIT_MACROS -D __STDC_FORMAT_MACROS

OBJS =		hordesat.o utilities/ClauseFilter.o solvers/Lingeling.o utilities/ClauseDatabase.o \
			utilities/SatUtils.o utilities/Logger.o sharing/AllToAllSharingManager.o sharing/LogSharingManager.o

LIBS =		-lz -lpthread -L$(LGLBIN) -llgl

OLD_LINGELING=0 # Will be overriden by variable set in `make` command line
ifneq ($(OLD_LINGELING),0)
	CXXFLAGS += -DOLD_LINGELING=1
else
	LIBS += -L$(YALBIN) -lyals
endif

TARGET =	hordesat

CXX = 		mpicxx

$(TARGET):	$(OBJS)
		$(CXX) -o $(TARGET) $(OBJS) $(LIBS)

all:		$(TARGET)

clean:	rm -f $(OBJS) $(TARGET)
