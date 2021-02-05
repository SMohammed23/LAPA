%ELEC 4700 - PA4
%Saifuddin Mohammed #101092039

set(0,'DefaultFigureWindowStyle','docked')

nx = 100;
ny = 100; 
ni = 10000; %Number of Iterations


V = zeros(nx,ny);

%Defining Boundaries
V(:,nx)=0; %Top BC
V(ny,:) = 0; %Bottom BC
V(1,:) = 1; %Left BC
V(:,1) = 0; %Right BC

SideToZero = 0;

%Solving Laplace's equation Iteratively
for k = 1:ni
    for i = 2:nx-1
        for j = 2:ny-1
        V(i,j) = 0.25*(V(i+1,j)+V(i-1,j)+V(i,j+1)+V(i,j-1));  %Using BC to solve. 
        end
        if mod(k,50) == 0
            surf(V')  %plotting the surface plot
            pause(0.05)
        end 
    end
end

[Ex,Ey] = gradient(V);
imboxfilt(V,3)
figure
quiver(-Ey',-Ex',0.8) %Plotting the vector field

