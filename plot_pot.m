function plot_pot(Pot, phi, theta, res)

phi = phi/pi*180;
theta = (pi/2-theta)/pi*180;

theta_min = min(min(theta));

lonlim = [0 360];
latlim = [theta_min 90];

phi_interp = linspace(0, 360, res);
theta_interp = linspace(90, theta_min, res/4);

[theta_interp_mat, phi_interp_mat] = meshgrid(theta_interp, phi_interp);

Pot_interp = interp2(theta, phi, Pot, theta_interp_mat, phi_interp_mat, 'spline');

worldmap(latlim, lonlim);
pcolorm(theta_interp_mat, phi_interp_mat, Pot_interp);
h = colorbar;
ylabel(h, 'Potential Field [V]');

end
