%This function runs MCMC simulation for an Ising moldel with magnetic field
%"h" and temperature "t"
function [M E]=ising(h,t,N)
%S=rand(N,N,N)>.5;%making random initial state of the lattice
%S=true(N,N,N);
S=false(N,N,N);
for n=1:2%I sweep the whole lattice two times
    for m=1:N^3%running over the lattice points
        E=energy(S,h);%calculating energy of the lattice
        S(m)=~S(m);%fliping the spin of the lattice point the we are at it
        dE=energy(S,h)-E;%finding the energy difference that has made after fliping
        if dE>0 && rand(1)>exp(-dE/t)
        S(m)=~S(m);%turning back the change if it oncreases energy with the written probability
        end
    end
end
M=2*sum(S(:))/N^3-1;%Calculating the magnetization of the lattice