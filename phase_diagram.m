% In this code I just run my Ising model routin for all grid points of a
% given phase space
N=10;%7;%%"N" is the size of the lattice in every dimension
%Defining grid for the phase space
h=0:1/25:2;
t=0:.2:10;
M=zeros(length(h),length(t));
E=zeros(length(h),length(t));
%Just running over the grid
for m=1:length(h)
    for n=1:length(t)
        [M(m,n) E(m,n)]=ising(h(m),t(n),N);
        m
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PLOTING DISCRIPTION AND DISCUSSION
%I plotted everything separately in command window using the results from
%above code.(I give dataset of results for both N=7 and N=10 separately)
%First I plotted Magnetization contour and Internal Energy Density (which is total energy divide by size of the lattice)
%both for N=7 and N=10. (all plots are given in PDF format separately)
%%%%%%%%%%%%%%%%%%%%%%%
%EFFECT OF FINITE SIZE
%Qualitatively I can say that the lattices of size N=7 and N=10 behaves in
%the same way, but the result for N=7 lattice is much more noisy.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PHASE TRANSITION IN MAGNETIZATION
%From Magnetization contour plot I can see that there is a flat area in
%which almost all of spins are aligned. For any given external field we can
%recognize some specific temperature at which the transition occurs. It
%means that for every temprature lower than that magnetization is about "1" or
%in other word all of spins are aligned in the direction of external field.
%I also drew a 2D plot to show this behavior better for some selected
%values of external field.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PHASE TRANSITION IN HEAT CAPACITANCE
%Heat capacitance is the rate of changing of internal energy with respect to
%temperature. In order to find this quantity for each point of phase diagram
%we need to differentiate total energy "E" in the teperature dimension.
%However, I couldn't actually do that because the fluctuation on the data
%was very large and the size of grid was very small to find some average
%change on that. I couldn't increase the size of meshgrid because of time
%limitation. Each single running of Ising model for N=10 lattice takes
%about 6 sec which was too long.
%By the way, I could actually see qualitatively that the transition really
%happens. It is because of the same reason that it occurs for
%magnetization. For any given value of external field there is a certain
%temperature that below it almost all of spins are aligned. It means that
%there is almost no change in internal energy when we change the
%temperature below that critical temperature. In other word, the heat
%capacitance below the critical teperature is almost zero and above it has
%some finite value and so it shows a dicontinuouity which is the
%characteristic of phase transition. This flat area is still visible in
%Internal energy contour. But to make it more visible I subtracted the field
%energy from all lattice point to show just interaction energy which is a
%better quantity for representing the level of alignment. In fact, for a
%compeletly aligned lattice the interaction energy per lattice ponit is
%"-6". Therefore, we can see this region by drawing a contour-line near
%"-6" for value of interaction energy per lattice and I did so. Beside, I also
%drew a 2D plot for different value of external field to put emphasis on
%this behavior.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%COMPARISION WITH MEAN FIELD MODEL
%As mean field model suggests I expected to see three distinct value for
%magnetization in absence of external field and in low temperature (in my
%model it is for K_BT/J<6). I tested it in this way: ran the Ising for the
%same value of temerature and for zero field hundred times and drew the histogram of
%results. I expected to see three almost distinct value for
%magnetization in the histogram, but I didn't!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%LOOKING FOR HYSTERSIS EFFECT
%Hysteresis effect says that we can have different values for
%magnetization depending on initial condition. My Ising model takes a
%random lattice as initial condition. I didn't see any considerable feature
%in histogram which shows presence of some alternative solution. But may be I
%should feed the model by some aligned and anti-aligned pattern to see the
%different solutions. I actually did it by doing some temporary
%manipulation in my Ising model function to take "true" and "false" lattice
%as the initial condition. I saw that there is really different solution
%for each of these initial condition, but I didn't have time and energy to prepare
%suitable figure or plot to show it officially (sorry!).