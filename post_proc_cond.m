folder = '/glade/p/hao/wiltbemj/WHI/WHI-quad/';
all_files = dir([folder, 'WHIQuad_mix*']);
all_names = {all_files.name};

n = length(all_names);
all_Cond_N = cell(n, 1);


for i = 1:n
    name = [folder, all_names{i}];
    Pot_N = hdfread(name, 'Pedersen conductance North [S]');
    
    if i==1
        GridX = hdfread(name, 'Grid X');
        GridY = hdfread(name, 'Grid Y');
        GridZ = sqrt(1-GridX.^2-GridY.^2);
        [phi, theta, ~] = cart2sph(GridX, GridY, GridZ);
        phi(phi<0) = phi(phi<0)+2*pi;
        theta = pi/2-theta;

        phi = double(phi(1:end-1, :));
        theta = double(theta(1:end-1, :));
        theta(:, 1) = 0;
        phi(:, 1) = phi(:, 2);
        [theta, phi] = meshgrid(theta(1, :), phi(:, 1));
    end
    
    all_Cond_N{i} = double(Pot_N(1:end-1, :));
end

save('WHI_quad_cond.mat', 'theta', 'phi', 'all_Cond_N', '-v7.3')