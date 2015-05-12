OBJS=msdcon.o fileio.o ions.o species.o
EXECUTABLE=msdcon
FC=ifort

all: app

debug: FFLAGS = -check all
debug: app

opt: FFLAGS = -fast -O2
opt: app

app: $(OBJS)
	$(FC) $(FFLAGS) $(OBJS) -o $(EXECUTABLE)

msdcon.o: msdcon.f90 fileio.mod ions.mod species.mod
	$(FC) $(FFLAGS) -c msdcon.f90 

fileio.o: fileio.f90
	$(FC) $(FFLAGS) -c fileio.f90 

fileio.mod: fileio.f90
	$(FC) $(FFLAGS) -c fileio.f90 
	
ions.o: ions.f90
	$(FC) $(FFLAGS) -c ions.f90
	
ions.mod: ions.f90
	$(FC) $(FFLAGS) -c ions.f90
	
species.o: species.f90
	$(FC) $(FFLAGS) -c species.f90
	
species.mod: species.f90
	$(FC) $(FFLAGS) -c species.f90

clean:
	rm -f *.o $(EXECUTABLE)
