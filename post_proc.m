folder = '/glade/p/hao/wiltbemj/WHI/WHI-double/';
file = 'WHIDouble_mix_2008-03-20T00-00-00Z.hdf';
dir = [folder, file];
info = hdfinfo(dir);
GridX = hdfread(dir, 'Grid X');
GridY = hdfread(dir, 'Grid Y');
Pot_N = hdfread(dir, 'Potential North [V]');

GridZ = sqrt(1-GridX.^2-GridY.^2);
[phi, theta, ~] = cart2sph(GridX, GridY, GridZ);
phi(phi<0) = phi(phi<0)+2*pi;
theta = pi/2-theta;

phi = double(phi(1:end-1, :));
theta = double(theta(1:end-1, :));
theta(:, 1) = 0;
phi(:, 1) = phi(:, 2);
Pot_N =double(Pot_N(1:end-1, :));

[theta, phi] = meshgrid(theta(1, :), phi(:, 1));