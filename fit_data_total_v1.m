close('all'); clc; clear;
rng(2360);

%% Load Data

load("processed_data.mat"); 
exp_data = {rep1, rep2, rep3};
trange = [0.01, 9.4101e+04];
model_fits = cell(9, 1);
run_cell = { ...
    false, false, false, false, ...
     true, false, false, false, ...
    false,  true,  true,  true, ...
    false, false, false, false, ...
    };

%% Model 0 - Independent Layer Growth
n = 1;
if run_cell{n}
    % test simulate_SEI_growth function
    x0 = [-90.0; -18.5; +0.75; +3.00; 1.25; +0.40; -18.5];
    [results, xchar] = run_simulation(x0, trange, n);
    plot_results(x0, exp_data, rep1_data, n, false);
    lb = [-90.0; -20.0; -1.00; +0.00; 1.25; +0.30; -23.0];
    ub = [-90.0; -16.0; +2.00; +5.00; 1.25; +0.45; -16.0];
    fun = @(x) calculate_objective_function(x, exp_data, n, lb, ub);
    options = optimset('Display', 'iter');
    % x_min = fmincon(fun, x0, [], [], [], [], lb, ub, [], options);
    x_min = fminsearch(fun, x0, options);
    
    model_fits{n} = plot_results(x_min, exp_data, rep1_data, n, false);
    saveas(gcf, fullfile('results', 'fit_00_independent_2SEI.fig'));
    saveas(gcf, fullfile('results', 'fit_00_independent_2SEI.jpg'));
    saveas(gcf, fullfile('results', 'fit_00_independent_2SEI.svg'));
end

%% Model 1 - Independent Layer Growth
n = 1;
% test simulate_SEI_growth function
if run_cell{n}
    x0 = [-35.5; -18.5; +0.75; +3.00; 1.25; +0.34; -18.5];
    [results, xchar] = run_simulation(x0, trange, n);
    plot_results(x0, exp_data, rep1_data, n, false);
    lb = [-37.0; -20.0; -1.00; +0.00; 1.25; +0.30; -23.0];
    ub = [-32.0; -16.0; +2.00; +5.00; 1.25; +0.45; -16.0];
    fun = @(x) calculate_objective_function(x, exp_data, n, lb, ub);
    options = optimset('Display', 'iter');
    % x_min = fmincon(fun, x0, [], [], [], [], lb, ub, [], options);
    x_min = fminsearch(fun, x0, options);
    
    model_fits{n} = plot_results(x_min, exp_data, rep1_data, n, false);
    saveas(gcf, fullfile('results', 'fit_01_independent_2SEI.fig'));
    saveas(gcf, fullfile('results', 'fit_01_independent_2SEI.jpg'));
    saveas(gcf, fullfile('results', 'fit_01_independent_2SEI.svg'));
end

%% Model 2 - Reaction Switching Mechanism with EXP switching
n = 2;
if run_cell{n}
    % test simulate_SEI_growth function
    x0 = [-32.0; -19.2; +1.77; +3.54; 1.25; 0.33; -20.0; +6.60];
    % [results, xchar] = run_simulation(x0, trange, n);
    % plot_results(x0, exp_data, rep1_data, n, false);
    lb = [-36.0; -21.0; -0.00; +3.00; 1.25; 0.30; -21.0; +2.00];
    ub = [-30.0; -16.0; +3.00; +5.00; 1.25; 0.40; -18.0; +20.0];
    fun = @(x) calculate_objective_function(x, exp_data, n, lb, ub);
    options = optimset('Display', 'iter');
    % x_min = fmincon(fun, x0, [], [], [], [], lb, ub, [], options);
    % x_min = fmincon(fun, x0, [], [], [], [], [], [], [], options);
    x_min = fminsearch(fun, x0, options);
    
    model_fits{n} = plot_results(x_min, exp_data, rep1_data, n, false);
    saveas(gcf, fullfile('results', 'fit_02_switching_exp_2SEI.fig'));
    saveas(gcf, fullfile('results', 'fit_02_switching_exp_2SEI.jpg'));
    saveas(gcf, fullfile('results', 'fit_02_switching_exp_2SEI.svg'));
end

%% Model 3 - 
n = 3;
if run_cell{n}
    % test simulate_SEI_growth function
    % [results, xchar] = run_simulation(x0, trange, n);
    % plot_results(x0, exp_data, rep1_data, n, false);
    x0 = [-33.0; -19.0; +1.70; +3.71; 1.25; 0.35; -19.0; 7.29];
    lb = [-36.0; -22.0; +0.00; +1.00; 1.25; 0.30; -22.0; 5.00];
    ub = [-31.0; -15.0; +3.00; +5.00; 1.25; 0.40; -17.0; 12.0];
    fun = @(x) calculate_objective_function(x, exp_data, n, lb, ub);
    options = optimset('Display', 'iter');
    options.Display = 'off';
    
    % x_min = fmincon(fun, x0, [], [], [], [], lb, ub, [], options);
    x_min = fminsearch(fun, x0, options);
    disp(x_min);
    
    model_fits{n} = plot_results(x_min, exp_data, rep1_data, n, false);
    saveas(gcf, fullfile('results', 'fit_03_spacelimited_2SEI.fig'));
    saveas(gcf, fullfile('results', 'fit_03_spacelimited_2SEI.jpg'));
    saveas(gcf, fullfile('results', 'fit_03_spacelimited_2SEI.svg'));
end

%% Model 4 - Reaction Switching Mechanism with ARCTAN switching
n = 4;
if run_cell{n}
    % test simulate_SEI_growth function
    x0 = [-32.1; -16.8; +1.60; +4.93; 1.25; 0.37; -20.3; +5.90];
    [results, xchar] = run_simulation(x0, trange, n);
    plot_results(x0, exp_data, rep1_data, n, false);
    lb = [-35.0; -18.0; +0.00; +1.00; 1.25; 0.30; -22.0; +5.00];
    ub = [-30.0; -16.0; +3.00; +6.00; 1.25; 0.40; -17.0; +10.0];
    fun = @(x) calculate_objective_function(x, exp_data, n, lb, ub);
    options = optimset('Display', 'iter');
    % x_min = fmincon(fun, x0, [], [], [], [], lb, ub, [], options);
    x_min = fminsearch(fun, x0, options);
    
    model_fits{n} = plot_results(x_min, exp_data, rep1_data, n, false);
    saveas(gcf, fullfile('results', 'fit_04_switching_atan_2SEI.fig'));
    saveas(gcf, fullfile('results', 'fit_04_switching_atan_2SEI.jpg'));
    saveas(gcf, fullfile('results', 'fit_04_switching_atan_2SEI.svg'));
end

%% Model 5 - POWER LAW
n = 5;
if run_cell{n}
    % test simulate_SEI_growth function
    x0 = [-0.94; +0.17; -0.29; -0.94; +0.17; -0.29; +2.72; +2.72];
    [results, xchar] = run_simulation(x0, trange, n);
    plot_results(x0, exp_data, rep1_data, n, false);
    lb = [-3.00; -0.00; -5.00; -3.00; -0.00; -5.00; +0.00; +0.00];
    ub = [+1.00; +1.00; +5.00; +1.00; +1.00; +5.00; +5.00; +5.00];
    fun = @(x) calculate_objective_function(x, exp_data, n, lb, ub);
    options = optimset('Display', 'iter');
    % x_min = fmincon(fun, x0, [], [], [], [], lb, ub, [], options);
    x_min = fminsearch(fun, x0, options);
    
    lb_new = x_min - 0.5;
    ub_new = x_min + 0.5;
    x_min = fmincon(fun, x_min, [], [], [], [], lb_new, ub_new, [], options);

    model_fits{n} = plot_results(x_min, exp_data, rep1_data, n, false);
    saveas(gcf, fullfile('results', 'fit_05_powerlaw_2SEI.fig'));
    saveas(gcf, fullfile('results', 'fit_05_powerlaw_2SEI.jpg'));
    saveas(gcf, fullfile('results', 'fit_05_powerlaw_2SEI.svg'));
end

%% Model 6 - ICET + Pinson Model 
n = 6;
if run_cell{n}
    % test simulate_SEI_growth function
    % [results, xchar] = run_simulation(x0, trange, n);
    % plot_results(x0, exp_data, rep1_data, n, false);
    x0 = [-33.0; -19.0; +1.70; +3.71; 1.25; 0.35; -19.0; 7.29];
    lb = [-36.0; -22.0; +0.00; +1.00; 1.25; 0.30; -22.0; 5.00];
    ub = [-31.0; -15.0; +3.00; +5.00; 1.25; 0.40; -17.0; 12.0];
    fun = @(x) calculate_objective_function(x, exp_data, n, lb, ub);
    options = optimset('Display', 'iter');
    x_min = fmincon(fun, x0, [], [], [], [], lb, ub, [], options);
    % x_min = fminsearch(fun, x0, options);
    disp(x_min);
    
    model_fits{n} = plot_results(x_min, exp_data, rep1_data, n, false);
    saveas(gcf, fullfile('results', 'fit_06_ICET_PINSON.fig'));
    saveas(gcf, fullfile('results', 'fit_06_ICET_PINSON.jpg'));
    saveas(gcf, fullfile('results', 'fit_06_ICET_PINSON.svg'));
end

%% Model 7 - ICET + ICET Models
n = 7;
if run_cell{n}
    % test simulate_SEI_growth function
    % [results, xchar] = run_simulation(x0, trange, n);
    % plot_results(x0, exp_data, rep1_data, n, false);
    x0 = [-32.0; -19.2; +1.51; +3.75; 1.25; 0.33; -19.3; 6.60];
    lb = [-34.0; -20.0; +1.20; +3.20; 1.25; 0.30; -21.0; 6.00];
    ub = [-31.0; -17.0; +2.20; +4.20; 1.25; 0.36; -18.0; 7.00];
    fun = @(x) calculate_objective_function(x, exp_data, n, lb, ub);
    options = optimset('Display', 'iter');
    x_min = fmincon(fun, x0, [], [], [], [], lb, ub, [], options);
    % x_min = fminsearch(fun, x0, options);
    disp(x_min);
    
    model_fits{n} = plot_results(x_min, exp_data, rep1_data, n, false);
    saveas(gcf, fullfile('results', 'fit_07_ICET_ICET.fig'));
    saveas(gcf, fullfile('results', 'fit_07_ICET_ICET.jpg'));
    saveas(gcf, fullfile('results', 'fit_07_ICET_ICET.svg'));
end

%% Model 8 - ICET + Pinson Model
n = 8;
if run_cell{n}
    % test simulate_SEI_growth function
    % [results, xchar] = run_simulation(x0, trange, n);
    % plot_results(x0, exp_data, rep1_data, n, false);
    x0 = [-35.0; -21; +1.78; +3.51; 1.25; 0.35; -21.0; 7.29];
    lb = [-36.0; -22.0; +0.00; +1.00; 1.25; 0.30; -22.0; 5.00];
    ub = [-31.0; -15.0; +3.00; +5.00; 1.25; 0.40; -17.0; 12.0];
    fun = @(x) calculate_objective_function(x, exp_data, n, lb, ub);
    options = optimset('Display', 'iter');
    % x_min = fmincon(fun, x0, [], [], [], [], lb, ub, [], options);
    x_min = fminsearch(fun, x0, options);
    
    model_fits{n} = plot_results(x_min, exp_data, rep1_data, n, false);
    saveas(gcf, fullfile('results', 'fit_08_ICET_Pinson.fig'));
    saveas(gcf, fullfile('results', 'fit_08_ICET_Pinson.jpg'));
    saveas(gcf, fullfile('results', 'fit_08_ICET_Pinson.svg'));
end

%% Model 9 - Independent SEI Models
n = 9;
if run_cell{n}
    % test simulate_SEI_growth function
    % [results, xchar] = run_simulation(x0, trange, n);
    % plot_results(x0, exp_data, rep1_data, n, false);
    x0 = [-32.0; -19.2; +1.51; +3.75; 1.25; 0.33; -19.3; 6.60];
    lb = [-36.0; -22.0; +0.00; +1.00; 1.25; 0.30; -22.0; 5.00];
    ub = [-31.0; -15.0; +3.00; +5.00; 1.25; 0.40; -17.0; 12.0];
    fun = @(x) calculate_objective_function(x, exp_data, n, lb, ub);
    options = optimset('Display', 'iter');
    % x_min = fmincon(fun, x0, [], [], [], [], lb, ub, [], options);
    x_min = fminsearch(fun, x0, options);
    
    model_fits{n} = plot_results(x_min, exp_data, rep1_data, n, false);
    saveas(gcf, fullfile('results', 'fit_09_independent.fig'));
    saveas(gcf, fullfile('results', 'fit_09_independent.jpg'));
    saveas(gcf, fullfile('results', 'fit_09_independent.svg'));
end

%% Model 10 - BEST MODEL
n = 10;
if run_cell{n}
    % test simulate_SEI_growth function
    % [results, xchar] = run_simulation(x0, trange, n);
    % plot_results(x0, exp_data, rep1_data, n, false);
    x0 = [-23.8; -29.7; +1.67; +3.80; -19.5; 7.78];
    [results, xchar] = run_simulation(x0, trange, n);
    plot_results(x0, exp_data, rep1_data, n, false);
    lb = [-34.0; -36.0; +0.60; +2.70; -21.0; 7.20];
    ub = [-20.0; -20.0; +2.60; +4.70; -17.0; 8.20];
    fun = @(x) calculate_objective_function(x, exp_data, n, lb, ub);
    options = optimset('Display', 'iter');
    % x_min = fmincon(fun, x0, [], [], [], [], lb, ub, [], options);
    x_min = fminsearch(fun, x0, options);
    
    lb_new = x_min - 0.5;
    ub_new = x_min + 0.5;
    x_min = fmincon(fun, x_min, [], [], [], [], lb_new, ub_new, [], options);

    disp(x_min);
    
    model_fits{n} = plot_results(x_min, exp_data, rep1_data, n, false);
    saveas(gcf, fullfile('results', 'fit_10_best_model.fig'));
    saveas(gcf, fullfile('results', 'fit_10_best_model.jpg'));
    saveas(gcf, fullfile('results', 'fit_10_best_model.svg'));
end

%% Model 11 - Independent Reaction Models with Both Being Irreversible
n = 11;
if run_cell{n}
    % test simulate_SEI_growth function
    % [results, xchar] = run_simulation(x0, trange, n);
    % plot_results(x0, exp_data, rep1_data, n, false);
    x0 = [-30.0; -30.0; +1.51; +3.75; -19.3; 7.70];
    lb = [-34.0; -36.0; +0.60; +2.70; -21.0; 7.20];
    ub = [-20.0; -20.0; +2.60; +4.70; -17.0; 8.20];
    fun = @(x) calculate_objective_function(x, exp_data, n, lb, ub);
    options = optimset('Display', 'iter');
    % x_min = fmincon(fun, x0, [], [], [], [], lb, ub, [], options);
    x_min = fminsearch(fun, x0, options);
    
    lb_new = x_min - 0.5;
    ub_new = x_min + 0.5;
    x_min = fmincon(fun, x_min, [], [], [], [], lb_new, ub_new, [], options);

    disp(x_min);
    
    model_fits{n} = plot_results(x_min, exp_data, rep1_data, n, false);
    saveas(gcf, fullfile('results', 'fit_11_Independent_Irreversible.fig'));
    saveas(gcf, fullfile('results', 'fit_11_Independent_Irreversible.jpg'));
    saveas(gcf, fullfile('results', 'fit_11_Independent_Irreversible.svg'));
end

%% Model 12 - Imposed Reaction Switching Through Switching Function
n = 12;
if run_cell{n}
    % test simulate_SEI_growth function
    % [results, xchar] = run_simulation(x0, trange, n);
    % plot_results(x0, exp_data, rep1_data, n, false);
    x0 = [-30.0; -30.0; +1.60; +3.70; -19.0; 7.70];
    lb = [-34.0; -36.0; +0.60; +2.70; -21.0; 7.20];
    ub = [-20.0; -20.0; +2.60; +4.70; -17.0; 8.20];
    fun = @(x) calculate_objective_function(x, exp_data, n, lb, ub);
    options = optimset('Display', 'iter');
    % x_min = fmincon(fun, x0, [], [], [], [], lb, ub, [], options);
    x_min = fminsearch(fun, x0, options);
    
    lb_new = x_min - 0.5;
    ub_new = x_min + 0.5;
    x_min = fmincon(fun, x_min, [], [], [], [], lb_new, ub_new, [], options);

    disp(x_min);
    
    model_fits{n} = plot_results(x_min, exp_data, rep1_data, n, false);
    saveas(gcf, fullfile('results', 'fit_12_Forced_Switching.fig'));
    saveas(gcf, fullfile('results', 'fit_12_Forced_Switching.jpg'));
    saveas(gcf, fullfile('results', 'fit_12_Forced_Switching.svg'));
end

%% Model 13 - 1-layer Polynomial Fit
n = 13;
if run_cell{n}
    % test simulate_SEI_growth function
    x0 = [+0.23; +1.09; -0.06; +1.60];
    [results, xchar] = run_simulation(x0, trange, n);
    plot_results(x0, exp_data, rep1_data, n, false);
    lb = [-5.00; -5.00; -100.; -10.00];
    ub = [+5.00; +5.00; +100.; +10.00];
    fun = @(x) calculate_objective_function(x, exp_data, n, lb, ub);
    options = optimset('Display', 'iter');
    % x_min = fmincon(fun, x0, [], [], [], [], lb, ub, [], options);
    x_min = fminsearch(fun, x0, options);

    lb_new = x_min - 0.5;
    ub_new = x_min + 0.5;
    x_min = fmincon(fun, x_min, [], [], [], [], lb_new, ub_new, [], options);

    model_fits{n} = plot_results(x_min, exp_data, rep1_data, n, false);
    saveas(gcf, fullfile('results', 'fit_05_powerlaw_2SEI.fig'));
    saveas(gcf, fullfile('results', 'fit_05_powerlaw_2SEI.jpg'));
    saveas(gcf, fullfile('results', 'fit_05_powerlaw_2SEI.svg'));
end

%% Save all data into .mat file
close('all');

figure('Position', [50, 50, 300, 200]); hold('on');box('on');
set(gcf, 'DefaultAxesFontName', 'Arial');
set(gcf, 'DefaultTextFontName', 'Arial');
set(gca,'FontSize', 10)
set(gca,'TickDir','out');
scatter(model_fits{10}{1}, model_fits{10}{2}, "black");
plot(model_fits{11}{3}, model_fits{11}{4}, "LineWidth", 2, "Color", 	"#EDB120");
plot(model_fits{12}{3}, model_fits{12}{4}, "LineWidth", 2, "Color",   "#A2142F");
plot(model_fits{10}{3}, model_fits{10}{4}, "LineWidth", 2, "Color", 	"#0000FF");
plot(model_fits{5}{3}, model_fits{5}{4}, "LineWidth", 2, "Color",   "#D95319");

% formatting
ylabel('SEI Thickness (nm)');
xlabel('Capacity (\muAh/cm^2)');
xlim([0 1.5]);
ylim([0 60]);
yticks([0, 15, 30, 45, 60])
yticklabels({'0','','30','','60'})
set(gca,'LineWidth', 1.5, 'TickLength',[0.005 0.005]);

saveas(gcf, fullfile('results', 'fit_total_capacity_height.fig'));
saveas(gcf, fullfile('results', 'fit_total_capacity_height.jpg'));
saveas(gcf, fullfile('results', 'fit_total_capacity_height.svg'));

figure('Position', [50, 50, 300, 200]); hold('on');box('on');
set(gcf, 'DefaultAxesFontName', 'Arial');
set(gcf, 'DefaultTextFontName', 'Arial');
set(gca,'FontSize', 10)
set(gca,'TickDir','out');
scatter(model_fits{10}{5}, model_fits{10}{6}, "black");
plot(model_fits{11}{7}, model_fits{11}{8}, "LineWidth", 2, "Color", 	"#EDB120");
plot(model_fits{12}{7}, model_fits{12}{8}, "LineWidth", 2, "Color",   "#A2142F");
plot(model_fits{10}{7}, model_fits{10}{8}, "LineWidth", 2, "Color", 	"#0000FF");
plot(model_fits{5}{7}, model_fits{5}{8}, "LineWidth", 2, "Color", "#D95319");

% formatting
ylabel('SEI Thickness (nm)');
xlabel('Time (h)');
xlim([0, 30]);
ylim([0 60]);
yticks([0, 15, 30, 45, 60])
yticklabels({'0','','30','','60'})
set(gca,'LineWidth', 1.5, 'TickLength',[0.005 0.005]);

saveas(gcf, fullfile('results', 'fit_total_height_time.fig'));
saveas(gcf, fullfile('results', 'fit_total_height_time.jpg'));
saveas(gcf, fullfile('results', 'fit_total_height_time.svg'));


%% Determine variable values
n_models = [10, 11, 12, 5];
Ageo = 2;

for i1 = 1:4
    n = n_models(i1);
    fprintf('Model %d Parameters\n', i1);
    if i1 ~= 4
        fprintf('nu_1 = %.3g \n', 1/(exp(model_fits{n}{end}(3))*1e-9*2*10^-4/(1e-6*3600)));
        fprintf('nu_2 = %.3g \n', 1/(exp(model_fits{n}{end}(4))*1e-9*2*10^-4/(1e-6*3600)));
        fprintf('k1 = %.3g \n', exp(model_fits{n}{end}(1))*96485*10);
        fprintf('k2 = %.3g \n', exp(model_fits{n}{end}(2))*96485*10);
        fprintf('Ds = %.3g \n', exp(model_fits{n}{end}(5))*10/1e9);
        fprintf('Hchar = %.3g \n', (model_fits{n}{end}(6)));
        fprintf('\n');
    else
        fprintf('nu_1 = %.3g \n', 1/(exp(model_fits{n}{end}(7))*1e-9*2*10^-4/(1e-6*3600)));
        fprintf('nu_2 = %.3g \n', 1/(exp(model_fits{n}{end}(8))*1e-9*2*10^-4/(1e-6*3600)));
        fprintf('A1 = %.3g \n', exp(model_fits{n}{end}(1))*1e-6*3600);
        fprintf('A2 = %.3g \n', exp(model_fits{n}{end}(4))*1e-6*3600);
        fprintf('B1 = %.3g \n', (model_fits{n}{end}(2)));
        fprintf('B1 = %.3g \n', (model_fits{n}{end}(5)));
        fprintf('C1 = %.3g \n', (model_fits{n}{end}(3))*1e-6*3600);
        fprintf('C2 = %.3g \n', (model_fits{n}{end}(6))*1e-6*3600);
        fprintf('\n');
    end
end


%% Generate Confidence Intervals

n_models = [10]; % only the best model
% n_models = [10, 11, 12, 5]; % if want all models
sample_arrays = cell(2, 4);

for i1 = 1:numel(n_models)
    fprintf('Generating 95%% confidence interval for Model - %d.\n', i1);
    n_model = n_models(i1);
    
    if i1 == 4
        % Define the number of Monte Carlo samples
        n_samples = 20000; % You can adjust this based on your computational resources
        
        n_params = 8; % number of parameters input into model
        lb = [-3.00; -0.00; -5.00; -3.00; -0.00; -5.00; +0.00; +0.00]; % low bound on parameters as input to objective function
        ub = [+1.00; +1.00; +5.00; +1.00; +1.00; +5.00; +5.00; +5.00]; % upper bound on parameters as input to objective function
        x_char = 0.05*ones(n_params, 1); % characteristic step size for sampling
        % x_char = [1.00; 0.10; 1.00; 1.00; 0.10; 1.00; 1.00; 1.00]; % characteristic step size for sampling

    else
        % Define the number of Monte Carlo samples
        n_samples = 2000; % You can adjust this based on your computational resources
       
        n_params = 6; % number of parameters input into model
        lb = [-34.0; -36.0; +0.60; +2.70; -21.0; 6.10]; % low bound on parameters as input to objective function
        ub = [-20.0; -20.0; +2.60; +4.70; -17.0; 7.10]; % upper bound on parameters as input to objective function
        x_char = 0.1*ones(n_params, 1); % characteristic step size for sampling
        % x_char = [2.00; 2.00; 1.00; 1.00; 1.00; 1.00]; % characteristic step size for sampling

    end

    % Define the time range on which the simulation results for each sample
    % will be interpolated.
    n_t = 500;
    t_plot = [linspace(trange(1)+10, 2000, n_t/2), linspace(2200, trange(2), n_t/2)] / 3600;
    % Preallocate array to store model predictions
    predictions = cell(3, 1); % Assuming dataset is a 2x1 cell array and objective function value is stored in first row.
    predictions{1} = nan(1, n_samples);
    predictions{2} = nan(length(t_plot), n_samples);
    
    % Generate Monte Carlo samples for model parameters
    x_min = model_fits{n_model}{end};
    obj_current = calculate_objective_function(x_min, exp_data, n_model, lb, ub);
    obj_best = obj_current;
    x_current = x_min;

    best_height = interp1(model_fits{n_model}{7}, model_fits{n_model}{3}, t_plot);
    best_capacity = interp1(model_fits{n_model}{7}, model_fits{n_model}{4}, t_plot);
    x_samples = nan(n_params, n_samples);

    % Calculate model predictions for each set of sampled parameters
    
    for i2 = 1:n_samples
        x_proposed = randn(n_params, 1).*x_char + x_current;
        obj_proposed = calculate_objective_function(x_proposed, exp_data, n_model, lb, ub);
        
        acceptance_probability = min(1, exp((obj_current - obj_proposed)/(obj_best/10)));

        if rand < acceptance_probability
            % accept step
            x_current = x_proposed;
            obj_current = obj_proposed;
            fprintf('Sample %d - Accepted.\n', i2);
        else
            fprintf('Sample %d - Rejected.\n', i2);
        end

        % calculate simulated results
        predictions{1}(i2) = obj_current;
        out_plot = plot_results(x_current, exp_data, rep1_data, n_model, true);
        predictions{2}(:,i2) = transpose(interp1(out_plot{7}, out_plot{3}, t_plot)); % simulated capacity
        predictions{3}(:,i2) = transpose(interp1(out_plot{7}, out_plot{4}, t_plot)); % simulated height

        x_samples(:, i2) = x_current;
    end
    
    % Calculate mean and standard deviation of model predictions
    predictions_capacity_mean = mean(predictions{2}, 2);
    predictions_capacity_std = std(predictions{2}, 0, 2);
    predictions_height_mean = mean(predictions{3}, 2);
    predictions_height_std = std(predictions{3}, 0, 2);
    
    % Calculate confidence interval bounds for model predictions
    alpha = 0.10; % 95% confidence interval
    z_critical = norminv(1 - alpha/2); % For a two-tailed test
    
    sorted_capacity = sort(predictions{2}, 2);
    lower_bound_capacity = sorted_capacity(:,round(alpha/2*n_samples));
    upper_bound_capacity = sorted_capacity(:,n_samples - round(alpha/2*n_samples));
    sorted_height = sort(predictions{3}, 2);
    lower_bound_height = sorted_height(:,round(alpha/2*n_samples));
    upper_bound_height = sorted_height(:,n_samples - round(alpha/2*n_samples));
     
    plot_results_confidence(x_min, n_model, t_plot(:), ...
        best_height, lower_bound_height, upper_bound_height, ...
        best_capacity, lower_bound_capacity, upper_bound_capacity, ...
        exp_data, rep1_data)
    plot_name = sprintf('model_%d_fit', i1);
    saveas(gcf, fullfile('results', [plot_name, '.fig']));
    saveas(gcf, fullfile('results', [plot_name, '.jpg']));
    saveas(gcf, fullfile('results', [plot_name, '.svg']));
    
    sample_arrays{i1, 1} = x_samples;
    sample_arrays{i1, 2} = predictions{1};

end

%% Functions

function voltage = LSV_hold(t)
% calculates the voltage at a given simulation time
V = -0.0050 * t + 2.6118;
voltage = max(V, 0.030);
end

function res = calculate_objective_function(x, exp_data, n, lb, ub)
% calculates the objective function value for a specified parameter list.

% solve the simulation for the given parameter list
trange = [0, 9.4101e+04];
[results, xchar] = run_simulation(x, trange, n);
sim_Time = results.("Time"); sim_Height = results.("Height"); 
sim_Capacity = results.("Capacity");

% calculates the residual
res = calculate_residual(exp_data, sim_Time, sim_Height, sim_Capacity, ...
    x, xchar, lb, ub);

end

function [results, xchar] = run_simulation(x, trange, n)
% runs a simulation over a specific time range, trange.
% defines the simulation model based on n
if n == 1
    [t, L, Q, V, a_solv, L_1, L_2, Q_1, Q_2] = simulate_SEI_growth_01(trange, x);
elseif n == 2
    [t, L, Q, V, a_solv, L_1, L_2, Q_1, Q_2] = simulate_SEI_growth_02(trange, x);
elseif n == 3
    [t, L, Q, V, a_solv, L_1, L_2, Q_1, Q_2] = simulate_SEI_growth_03(trange, x);
elseif n == 4
    [t, L, Q, V, a_solv, L_1, L_2, Q_1, Q_2] = simulate_SEI_growth_04(trange, x);
elseif n == 5
    [t, L, Q, V, a_solv, L_1, L_2, Q_1, Q_2] = simulate_SEI_growth_05(trange, x);
elseif n == 6
    [t, L, Q, V, a_solv, L_1, L_2, Q_1, Q_2] = simulate_SEI_growth_06(trange, x);
elseif n == 7
    [t, L, Q, V, a_solv, L_1, L_2, Q_1, Q_2] = simulate_SEI_growth_07(trange, x);
elseif n == 8
    [t, L, Q, V, a_solv, L_1, L_2, Q_1, Q_2] = simulate_SEI_growth_08(trange, x);
elseif n == 9
    [t, L, Q, V, a_solv, L_1, L_2, Q_1, Q_2] = simulate_SEI_growth_09(trange, x);
elseif n == 10
    [t, L, Q, V, a_solv, L_1, L_2, Q_1, Q_2] = simulate_SEI_growth_10(trange, x);
elseif n == 11
    [t, L, Q, V, a_solv, L_1, L_2, Q_1, Q_2] = simulate_SEI_growth_11(trange, x);
elseif n == 12
    [t, L, Q, V, a_solv, L_1, L_2, Q_1, Q_2] = simulate_SEI_growth_12(trange, x);
elseif n == 13
    [t, L, Q, V, a_solv, L_1, L_2, Q_1, Q_2] = simulate_SEI_growth_13(trange, x);
end

xchar = ones(size(x));

results = struct();
results.("Time") = t; results.("Height") = L;
results.("Capacity") = Q; results.("Voltage") = V;
results.("Solvent_Activity") = a_solv;
results.("L_1") = L_1; results.("L_2") = L_2;
results.("Q_1") = Q_1; results.("Q_2") = Q_2;

end

function res = calculate_residual(exp_data, sim_Time, sim_Height, sim_Capacity, ...
    x, xchar, lb, ub)
% calculates the residual value between the experimental data and the
% simulation time, SEI height, and capacity. Uses least squares.

nhold = 5;
time_llim = 250;
time_ulim = 5000;
rep1 = exp_data{1}; rep2 = exp_data{2}; rep3 = exp_data{3};
exp_Time = cat(2, linspace(time_llim, time_ulim, nhold), ...
    transpose(rep1.("Time s")(end-7:end)), ...
    transpose(rep2.("Time s")), transpose(rep3.("Time s")));
exp_Height = cat(2, interp1(rep1.("Time s"), rep1.("Height um"), linspace(time_llim, time_ulim, nhold)), ...
    transpose(rep1.("Height um")(end-7:end)), ...
    transpose(rep2.("Height um")), transpose(rep3.("Height um")));
exp_Capacity = cat(2, interp1(rep1.("Time s"), rep1.("Capacity muAh"), linspace(time_llim, time_ulim, nhold)), ...
    transpose(rep1.("Capacity muAh")(end-7:end)), ...
    transpose(rep2.("Capacity muAh")), transpose(rep3.("Capacity muAh")));

sHeight = interp1(sim_Time, sim_Height, exp_Time);
sCapacity = interp1(sim_Time, sim_Capacity, exp_Time);

res_misfit = sqrt(sum(((sHeight - exp_Height)./max(exp_Height)).^2)) + ...
    sqrt(sum(((sCapacity - exp_Capacity)./max(exp_Capacity)).^2));

% res_norm = 0;
delx = (x-xchar)./xchar;
res_norm = 0 * (norm(x, 1) + norm(x, 2));

res_bounds = (sum(exp(((lb - x)/0.2))) + sum(exp(((x - ub)/0.2))));

res = 10000*(res_norm + 10* res_misfit + res_bounds); % final residual

end

function out_plot = plot_results(x, exp_data, rep1_data, n, data_flag)

% run simulation
trange = [0.01, 9.4101e+04];
[results, ~] = run_simulation(x, trange, n);
% combine exp_data
total_data = vertcat(exp_data{1}, exp_data{2}, exp_data{3});

if ~data_flag
    figure('Position', [50, 50, 300, 600]);
    set(gcf, 'DefaultAxesFontName', 'Arial');
    set(gcf, 'DefaultTextFontName', 'Arial');
    s_tot = 3;
    
    subplot(s_tot,1,1); hold('on'); box('on');
    set(gca,'FontSize', 10)
    set(gca,'TickDir','out');
    % scatter(total_data.("Time s")/3600, total_data.("Capacity muAh"), "black");
    plot((rep1_data.("time/s")-1800)/3600, -rep1_data.("Capacity muAh")/2, ...
        "black", "LineWidth", 2);
    plot(results.("Time")/3600, results.("Capacity")/2, "LineWidth", 2, "Color", "#7E2F8E");
    plot(results.("Time")/3600, results.("Q_1")/2, "LineWidth", 2, "Color", "#0072BD");
    plot(results.("Time")/3600, results.("Q_2")/2, "LineWidth", 2, "Color", "#A2142F");
    % formatting
    ylabel('Capacity (\muAh/cm^2)');
    % legend({'Data', 'Full fit', 'Fit 1', 'Fit 2'}, "Location","northoutside")
    xlim([0 30]);
    ylim([0 1.5]);
    set(gca,'LineWidth', 1.5, 'TickLength',[0.005 0.005]);
    
    subplot(s_tot,1,2); hold('on'); box('on');
    set(gca,'FontSize', 10)
    set(gca,'TickDir','out');
    scatter(total_data.("Time s")/3600, total_data.("Height um"), "black");
    plot(results.("Time")/3600, results.("Height"), "LineWidth", 2, "Color", "#7E2F8E");
    plot(results.("Time")/3600, results.("L_1"), "LineWidth", 2, "Color", "#0072BD");
    plot(results.("Time")/3600, results.("L_2"), "LineWidth", 2, "Color", "#A2142F");
    % formatting
    ylabel('SEI Thickness (nm)');
    xlabel('Time (h)');
    xlim([0, 30]);
    ylim([0 60]);
    yticks([0, 15, 30, 45, 60])
    yticklabels({'0','','30','','60'})
    set(gca,'LineWidth', 1.5, 'TickLength',[0.005 0.005]);
    
    subplot(s_tot,1,3); hold('on'); box('on');
    set(gca,'FontSize', 10)
    set(gca,'TickDir','out');
    scatter(total_data.("Capacity muAh")/2, total_data.("Height um"), "black");
    plot(results.("Capacity")/2, results.("Height"), "LineWidth", 2, "Color", "#7E2F8E");
    % plot(results.("Q_1"), results.("L_1"), "LineWidth", 2, "Color", "#0072BD");
    % plot(results.("Q_2"), results.("L_2"), "LineWidth", 2, "Color", "#A2142F");
    % formatting
    ylabel('SEI Thickness (nm)');
    xlabel('Capacity (\muAh/cm^2)');
    xlim([0 1.5]);
    ylim([0 60]);
    yticks([0, 15, 30, 45, 60])
    yticklabels({'0','','30','','60'})
    set(gca,'LineWidth', 1.5, 'TickLength',[0.005 0.005]);
end

out_plot = {total_data.("Capacity muAh")/2;
    total_data.("Height um");
    results.("Capacity")/2;
    results.("Height");
    total_data.("Time s")/3600;
    total_data.("Height um");
    results.("Time")/3600;
    results.("Height");
    x};

end

function [] = plot_results_confidence(x, n, t, height_best, height_min, height_max, capacity_best, capacity_min, capacity_max, exp_data, rep1_data)

% run simulation
trange = [0, 9.4101e+04];
[results, ~] = run_simulation(x, trange, n);
% combine exp_data
total_data = vertcat(exp_data{1}, exp_data{2}, exp_data{3});

figure('Position', [50, 50, 250, 600]);
set(gcf, 'DefaultAxesFontName', 'Arial');
set(gcf, 'DefaultTextFontName', 'Arial');
s_tot = 3;

subplot(s_tot,1,1); hold('on'); box('on');
set(gca,'FontSize', 8)
set(gca,'TickDir','out');
% scatter(total_data.("Time s")/3600, total_data.("Capacity muAh"), "black");
fill_gcf(t, capacity_min, t, capacity_max)
plot((rep1_data.("time/s")-1800)/3600, -rep1_data.("Capacity muAh")/2, ...
    "black", "LineWidth", 2);
plot(results.("Time")/3600, results.("Capacity")/2, "LineWidth", 2, "Color", "#7E2F8E");
plot(results.("Time")/3600, results.("Q_1")/2, "LineWidth", 2, "Color", "#0072BD");
plot(results.("Time")/3600, results.("Q_2")/2, "LineWidth", 2, "Color", "#A2142F");
% formatting
ylabel('Capacity (\muAh/cm^2)');
% legend({'Data', 'Full fit', 'Fit 1', 'Fit 2'}, "Location","northoutside")
xlim([0 30]);
ylim([0 1.5]);
set(gca,'LineWidth', 1.5, 'TickLength',[0.005 0.005]);
xticks([0, 10, 20, 30]);

subplot(s_tot,1,2); hold('on'); box('on');
set(gca,'FontSize', 8)
set(gca,'TickDir','out');
fill_gcf(t, height_min, t, height_max);
scatter(total_data.("Time s")/3600, total_data.("Height um"), "black");
plot(results.("Time")/3600, results.("Height"), "LineWidth", 2, "Color", "#7E2F8E");
plot(results.("Time")/3600, results.("L_1"), "LineWidth", 2, "Color", "#0072BD");
plot(results.("Time")/3600, results.("L_2"), "LineWidth", 2, "Color", "#A2142F");
% formatting
ylabel('SEI Thickness (nm)');
xlabel('Time (h)');
xlim([0, 30]);
ylim([0 60]);
xticks([0, 10, 20, 30]);
yticks([0, 15, 30, 45, 60])
yticklabels({'0','','30','','60'})
set(gca,'LineWidth', 1.5, 'TickLength',[0.005 0.005]);

subplot(s_tot,1,3); hold('on'); box('on');
set(gca,'FontSize', 8)
set(gca,'TickDir','out');
fill_gcf(capacity_max, height_min, capacity_min, height_max);
scatter(total_data.("Capacity muAh")/2, total_data.("Height um"), "black");
plot(results.("Capacity")/2, results.("Height"), "LineWidth", 2, "Color", "#7E2F8E");
% plot(results.("Q_1"), results.("L_1"), "LineWidth", 2, "Color", "#0072BD");
% plot(results.("Q_2"), results.("L_2"), "LineWidth", 2, "Color", "#A2142F");
% formatting
ylabel('SEI Thickness (nm)');
xlabel('Capacity (\muAh/cm^2)');
xlim([0 1.5]);
ylim([0 60]);
xticks([0, 0.5, 1.0, 1.5])
yticks([0, 15, 30, 45, 60])
yticklabels({'0','','30','','60'})
set(gca,'LineWidth', 1.5, 'TickLength',[0.005 0.005]);

end

function [] = fill_gcf(x1, y1, x2, y2)
% Assuming x1 and y1 are the x and y values of the first dataset
% and x2 and y2 are the x and y values of the second dataset

fill_color = [126, 47, 142] / 255; % RGB values of "#7E2F8E" converted to [0,1] range
fill_alpha = 0.25; % 50% transparency

% Fill the area between the two curves
fill([x1; flip(x2(1:end-1),1)], [y1; flip(y2(1:end-1),1)], fill_color, 'EdgeColor', 'none', 'FaceAlpha', fill_alpha);

end



function [t, L, Q, V, a_solv, L_1, L_2, Q_1, Q_2] = ...
    simulate_SEI_growth_01(trange, x)
% simulates SEI growth over a certain range of time and with a certain SEI
% parameter set, x.
k0_1 = exp(x(1)); % [mol/m^2]
k0_2 = exp(x(2)); % [mol/m^2]
LQ_1 = exp(x(3)); % [nm/muAh] 
LQ_2 = exp(x(4)); % [nm/muAh]

V_1 = x(5); % [V]
V_2 = x(6); % [V]

Dsolv_2 = exp(x(7)); % [m^2/s]

y0 = [1e-5; 1e-12; 1];
model = @(t,y) DAE_model_01(t, y, k0_1, k0_2, LQ_1, LQ_2, V_1, V_2, Dsolv_2);
M = [1, 0, 0; 0, 1, 0; 0, 0, 0];
options = odeset('Mass', M, 'RelTol', 1e-6, 'AbsTol', [1e-6 1e-6 1e-6]);
[t,y] = ode15s(model, trange, y0, options);

% y = real(y);

L_1 = y(:,1);
L_2 = y(:,2);
Q_1 = L_1 / LQ_1;
Q_2 = L_2 / LQ_2;

L = L_1 + L_2; Q = Q_1 + Q_2;
V = LSV_hold(t);
a_solv = y(:,3);

end

function [t, L, Q, V, a_solv, L_1, L_2, Q_1, Q_2] = ...
    simulate_SEI_growth_02(trange, x)
% simulates SEI growth over a certain range of time and with a certain SEI
% parameter set, x.
k0_1 = exp(x(1)); % [mol/m^2]
k0_2 = exp(x(2)); % [mol/m^2]
LQ_1 = exp(x(3)); % [nm/muAh] 
LQ_2 = exp(x(4)); % [nm/muAh]

delmuref_1 = x(5); % [V]
delmuref_2 = x(6); % [V]

Dsolv_2 = exp(x(7)); % [m^2/s]
L_char = x(8); % [um]

y0 = [1e-5; 1e-12; 1];

model = @(t,y) DAE_model_02(t, y, ...
    k0_1, k0_2, LQ_1, LQ_2, delmuref_1, delmuref_2, Dsolv_2, L_char);
M = [1, 0, 0; 0, 1, 0; 0, 0, 0];
options = odeset('Mass', M, 'RelTol', 1e-6, 'AbsTol', [1e-6 1e-6 1e-6]);
[t,y] = ode15s(model, trange, y0, options);

y = real(y);

L_1 = y(:,1); L_2 = y(:,2);
Q_1 = L_1 / LQ_1; Q_2 = L_2 / LQ_2;
L = L_1 + L_2; Q = Q_1 + Q_2;

V = LSV_hold(t);
a_solv = y(:,3);

end

function [t, L, Q, V, a_solv, L_1, L_2, Q_1, Q_2] = ...
    simulate_SEI_growth_03(trange, x)
% simulates SEI growth over a certain range of time and with a certain SEI
% parameter set, x.
k0_1 = exp(x(1)); % [mol/m^2]
k0_2 = exp(x(2)); % [mol/m^2]
LQ_1 = exp(x(3)); % [nm/muAh] 
LQ_2 = exp(x(4)); % [nm/muAh]

V_1 = x(5); % [V]
V_2 = x(6); % [V]

Dsolv_2 = exp(x(7)); % [m^2/s]
L_char = x(8); % [um]

y0 = [0.1; 0.1; 0];

model = @(t,y) DAE_model_03(t, y, ...
    k0_1, k0_2, LQ_1, LQ_2, V_1, V_2, Dsolv_2, L_char);
M = [1, 0, 0; 0, 1, 0; 0, 0, 0];
options = odeset('Mass', M, 'RelTol', 1e-6, 'AbsTol', [1e-6 1e-6 1e-6]);
[t,y] = ode15s(model, trange, y0, options);

y = real(y);

L_1 = y(:,1);
L_2 = y(:,2);
Q_1 = L_1 / LQ_1;
Q_2 = L_2 / LQ_2;

L = L_1 + L_2;
Q = Q_1 + Q_2;
V = LSV_hold(t);
a_solv = y(:,3);

end

function [t, L, Q, V, a_solv, L_1, L_2, Q_1, Q_2] = ...
    simulate_SEI_growth_04(trange, x)
% simulates SEI growth over a certain range of time and with a certain SEI
% parameter set, x.
k0_1 = exp(x(1)); % [mol/m^2]
k0_2 = exp(x(2)); % [mol/m^2]
LQ_1 = exp(x(3)); % [nm/muAh] 
LQ_2 = exp(x(4)); % [nm/muAh]

V_1 = x(5); % [V]
V_2 = x(6); % [V]

Dsolv_2 = exp(x(7)); % [m^2/s]
L_char = x(8); % [um]

y0 = [0.1; 0.1; 0];

model = @(t,y) DAE_model_04(t, y, ...
    k0_1, k0_2, LQ_1, LQ_2, V_1, V_2, Dsolv_2, L_char);
M = [1, 0, 0; 0, 1, 0; 0, 0, 0];
options = odeset('Mass', M, 'RelTol', 1e-6, 'AbsTol', [1e-6 1e-6 1e-6]);
[t,y] = ode15s(model, trange, y0, options);

L_1 = y(:,1); L_2 = y(:,2);
Q_1 = L_1 / LQ_1; Q_2 = L_2 / LQ_2;
L = L_1 + L_2; Q = Q_1 + Q_2;

V = LSV_hold(t);
a_solv = y(:,3);

end

function [t, L, Q, V, a_solv, L_1, L_2, Q_1, Q_2] = ...
    simulate_SEI_growth_05(trange, x)
% simulates SEI growth over a certain range of time and with a certain SEI
% parameter set, x.
A1 = exp(x(1)); B1 = x(2); C1 = x(3);
A2 = exp(x(4)); B2 = x(5); C2 = x(6);
LQ_1 = exp(x(7)); % [nm/muAh] 
LQ_2 = exp(x(8)); % [nm/muAh]

t = linspace(trange(1), trange(2), 1000);
Q_1 = A1*t.^B1 + C1; Q_2 = A2*t.^B2 + C2;
L_1 = Q_1*LQ_1; L_2 = Q_2*LQ_2;
L = L_1 + L_2; Q = Q_1 + Q_2;
V = LSV_hold(t); a_solv = ones(size(t));

end

function [t, L, Q, V, a_solv, L_1, L_2, Q_1, Q_2] = ...
    simulate_SEI_growth_06(trange, x)
% simulates SEI growth over a certain range of time and with a certain SEI
% parameter set, x.
k0_1 = exp(x(1)); % [mol/m^2]
k0_2 = exp(x(2)); % [mol/m^2]
LQ_1 = exp(x(3)); % [nm/muAh] 
LQ_2 = exp(x(4)); % [nm/muAh]

V_1 = x(5); % [V]
V_2 = x(6); % [V]

Dsolv_2 = exp(x(7)); % [m^2/s]
L_char = x(8); % [um]

y0 = [0.1; 0.1; 0];

model = @(t,y) DAE_model_06(t, y, ...
    k0_1, k0_2, LQ_1, LQ_2, V_1, V_2, Dsolv_2, L_char);
M = [1, 0, 0; 0, 1, 0; 0, 0, 0];
options = odeset('Mass', M, 'RelTol', 1e-6, 'AbsTol', [1e-6 1e-6 1e-6]);
[t,y] = ode15s(model, trange, y0, options);

L_1 = y(:,1);
L_2 = y(:,2);
Q_1 = L_1 / LQ_1;
Q_2 = L_2 / LQ_2;

L = L_1 + L_2;
Q = Q_1 + Q_2;
V = LSV_hold(t);
a_solv = y(:,3);

end

function [t, L, Q, V, a_solv, L_1, L_2, Q_1, Q_2] = ...
    simulate_SEI_growth_07(trange, x)
% simulates SEI growth over a certain range of time and with a certain SEI
% parameter set, x.
k0_1 = exp(x(1)); % [mol/m^2] 
k0_2 = exp(x(2)); % [mol/m^2]
LQ_1 = exp(x(3)); % [nm/muAh] 
LQ_2 = exp(x(4)); % [nm/muAh]

delmuref_1 = x(5); % [V]
delmuref_2 = x(6); % [V]

Dsolv_2 = exp(x(7)); % [m^2/s]
L_char = x(8); % [um]

y0 = [1e-3; 1e-10; 1];

model = @(t,y) DAE_model_07(t, y, ...
    k0_1, k0_2, LQ_1, LQ_2, delmuref_1, delmuref_2, Dsolv_2, L_char);
M = [1, 0, 0; 0, 1, 0; 0, 0, 0];
options = odeset('Mass', M, 'RelTol', 1e-6, 'AbsTol', [1e-6 1e-6 1e-6]);
[t,y] = ode15s(model, trange, y0, options);
y = real(y);

L_1 = y(:,1); L_2 = y(:,2);
Q_1 = L_1 / LQ_1; Q_2 = L_2 / LQ_2;
L = L_1 + L_2; Q = Q_1 + Q_2; V = LSV_hold(t);
a_solv = y(:,3);

end

function [t, L, Q, V, a_solv, L_1, L_2, Q_1, Q_2] = ...
    simulate_SEI_growth_08(trange, x)
% simulates SEI growth over a certain range of time and with a certain SEI
% parameter set, x.
k0_1 = exp(x(1)); % [mol/m^2] 
k0_2 = exp(x(2)); % [mol/m^2]
LQ_1 = exp(x(3)); % [nm/muAh] 
LQ_2 = exp(x(4)); % [nm/muAh]

delmuref_1 = x(5); % [V]
delmuref_2 = x(6); % [V]

Dsolv_2 = exp(x(7)); % [m^2/s]
L_char = x(8); % [um]

y0 = [1e-3; 1e-10; 1];

model = @(t,y) DAE_model_08(t, y, ...
    k0_1, k0_2, LQ_1, LQ_2, delmuref_1, delmuref_2, Dsolv_2, L_char);
M = [1, 0, 0; 0, 1, 0; 0, 0, 0];
options = odeset('Mass', M, 'RelTol', 1e-6, 'AbsTol', [1e-6 1e-6 1e-6]);
[t,y] = ode15s(model, trange, y0, options);
y = real(y);

L_1 = y(:,1); L_2 = y(:,2);
Q_1 = L_1 / LQ_1; Q_2 = L_2 / LQ_2;
L = L_1 + L_2; Q = Q_1 + Q_2; V = LSV_hold(t);
a_solv = y(:,3);

end

function [t, L, Q, V, a_solv, L_1, L_2, Q_1, Q_2] = ...
    simulate_SEI_growth_09(trange, x)
% simulates SEI growth over a certain range of time and with a certain SEI
% parameter set, x.
k0_1 = exp(x(1)); % [mol/m^2] 
k0_2 = exp(x(2)); % [mol/m^2]
LQ_1 = exp(x(3)); % [nm/muAh] 
LQ_2 = exp(x(4)); % [nm/muAh]

delmuref_1 = x(5); % [V]
delmuref_2 = x(6); % [V]

Dsolv_2 = exp(x(7)); % [m^2/s]
L_char = x(8); % [um]

y0 = [1e-3; 1e-10; 1];

model = @(t,y) DAE_model_09(t, y, ...
    k0_1, k0_2, LQ_1, LQ_2, delmuref_1, delmuref_2, Dsolv_2, L_char);
M = [1, 0, 0; 0, 1, 0; 0, 0, 0];
options = odeset('Mass', M, 'RelTol', 1e-6, 'AbsTol', [1e-6 1e-6 1e-6]);
[t,y] = ode15s(model, trange, y0, options);
y = real(y);

L_1 = y(:,1); L_2 = y(:,2);
Q_1 = L_1 / LQ_1; Q_2 = L_2 / LQ_2;
L = L_1 + L_2; Q = Q_1 + Q_2; V = LSV_hold(t);
a_solv = y(:,3);

end

function [t, L, Q, V, a_solv, L_1, L_2, Q_1, Q_2] = ...
    simulate_SEI_growth_10(trange, x)
% simulates SEI growth over a certain range of time and with a certain SEI
% parameter set, x.
k0_1 = exp(x(1)); % [mol/m^2] 
k0_2 = exp(x(2)); % [mol/m^2]
LQ_1 = exp(x(3)); % [nm/muAh] 
LQ_2 = exp(x(4)); % [nm/muAh]

V_1 = 1.25; % [V]
V_2 = 1.25; % [V]

Dsolv_2 = exp(x(5)); % [m^2/s]
L_char = x(6); % [um]

y0 = [1e-3; 1e-10; 1];

model = @(t,y) DAE_model_10(t, y, ...
    k0_1, k0_2, LQ_1, LQ_2, V_1, V_2, Dsolv_2, L_char);
M = [1, 0, 0; 0, 1, 0; 0, 0, 0];
options = odeset('Mass', M, 'RelTol', 1e-6, 'AbsTol', [1e-6 1e-6 1e-6]);
[t,y] = ode15s(model, trange, y0, options);
y = real(y);

L_1 = y(:,1); L_2 = y(:,2);
Q_1 = L_1 / LQ_1; Q_2 = L_2 / LQ_2;
L = L_1 + L_2; Q = Q_1 + Q_2; V = LSV_hold(t);
a_solv = y(:,3);

end

function [t, L, Q, V, a_solv, L_1, L_2, Q_1, Q_2] = ...
    simulate_SEI_growth_11(trange, x)
% simulates SEI growth over a certain range of time and with a certain SEI
% parameter set, x.
k0_1 = exp(x(1)); % [mol/m^2] 
k0_2 = exp(x(2)); % [mol/m^2]
LQ_1 = exp(x(3)); % [nm/muAh] 
LQ_2 = exp(x(4)); % [nm/muAh]

V_1 = 1.25; % [V]
V_2 = 1.25; % [V]

Dsolv_2 = exp(x(5)); % [m^2/s]
L_char = x(6); % [um]

y0 = [1e-3; 1e-10; 1];

model = @(t,y) DAE_model_11(t, y, ...
    k0_1, k0_2, LQ_1, LQ_2, V_1, V_2, Dsolv_2, L_char);
M = [1, 0, 0; 0, 1, 0; 0, 0, 0];
options = odeset('Mass', M, 'RelTol', 1e-6, 'AbsTol', [1e-6 1e-6 1e-6]);
[t,y] = ode15s(model, trange, y0, options);
y = real(y);

L_1 = y(:,1); L_2 = y(:,2);
Q_1 = L_1 / LQ_1; Q_2 = L_2 / LQ_2;
L = L_1 + L_2; Q = Q_1 + Q_2; V = LSV_hold(t);
a_solv = y(:,3);

end

function [t, L, Q, V, a_solv, L_1, L_2, Q_1, Q_2] = ...
    simulate_SEI_growth_12(trange, x)
% simulates SEI growth over a certain range of time and with a certain SEI
% parameter set, x.
k0_1 = exp(x(1)); % [mol/m^2] 
k0_2 = exp(x(2)); % [mol/m^2]
LQ_1 = exp(x(3)); % [nm/muAh] 
LQ_2 = exp(x(4)); % [nm/muAh]

V_1 = 1.25; % [V]
V_2 = 1.25; % [V]

Dsolv_2 = exp(x(5)); % [m^2/s]
L_char = x(6); % [um]

y0 = [1e-3; 1e-10; 1];

model = @(t,y) DAE_model_12(t, y, ...
    k0_1, k0_2, LQ_1, LQ_2, V_1, V_2, Dsolv_2, L_char);
M = [1, 0, 0; 0, 1, 0; 0, 0, 0];
options = odeset('Mass', M, 'RelTol', 1e-6, 'AbsTol', [1e-6 1e-6 1e-6]);
[t,y] = ode15s(model, trange, y0, options);
y = real(y);

L_1 = y(:,1); L_2 = y(:,2);
Q_1 = L_1 / LQ_1; Q_2 = L_2 / LQ_2;
L = L_1 + L_2; Q = Q_1 + Q_2; V = LSV_hold(t);
a_solv = y(:,3);

end

function [t, L, Q, V, a_solv, L_1, L_2, Q_1, Q_2] = ...
    simulate_SEI_growth_13(trange, x)
% simulates SEI growth over a certain range of time and with a certain SEI
% parameter set, x.
A1 = exp(x(1)); B1 = x(2); C1 = x(3);
LQ_1 = exp(x(4)); % [nm/muAh] 

t = linspace(trange(1), trange(2), 1000);
Q_1 = A1*t.^B1 + C1;
L_1 = Q_1*LQ_1; L_2 = 0;
L = L_1; Q = Q_1; Q_2 = 0;
V = LSV_hold(t); a_solv = ones(size(t));

end



function dydt = DAE_model_01(t, y, k0_1, k0_2, LQ_1, LQ_2, V_1, V_2, D_solv)

% define lengths
L_1 = y(1); L_2 = y(2); a_solv = y(3);

% define voltage
V = LSV_hold(t);
kBToe = 0.025679; % [V]
e = 1.6022e-19; % [C/#]
NA = 6.022e23; 
F = e*NA; % [C/mole]

c0_solv = 13200 * (1 / 100^2) ; % [mole/m]

% define reactions
Rxn_1 = k0_1 * 1 * abs(a_solv)^(0.5) * exp(-0.5*(V-V_1)/kBToe); % [mole/s]
Rxn_2 = k0_2 * 1 * abs(a_solv)^(0.5) * exp(-0.5*(V-V_2)/kBToe); % [mole/s]

% Length evolution equations
diffeq_1 = Rxn_1 * F / 3.6 * LQ_1;
diffeq_2 = Rxn_2 * F / 3.6 * LQ_2;

%
algeeq_1 = Rxn_2 / (D_solv * c0_solv / L_2) - (1 - a_solv);

dydt = [diffeq_1; diffeq_2; algeeq_1];

end

function dydt = DAE_model_02(t, y, ...
    k0_1, k0_2, LQ_1, LQ_2, delmuref_1, delmuref_2, D_solv, L_char)

delmuref_1 = 1.25;

% define lengths
L_1 = y(1); L_2 = y(2); a_solv = y(3);

% define voltage
V = LSV_hold(t);
kBToe = 0.025679; % [V]
e = 1.6022e-19; % [C/#]
NA = 6.022e23; 
F = e*NA; % [C/mole]
kB = 1.381e-23; % [J/(#*K)]
kBT = kB*298; % [J/#]

c0_solv = 13200 * (1 / 100^2) ; % [mole/m]

a_e_1 = exp(-L_1/L_char);
a_e_2 = 1-exp(-L_1/L_char);

% a_SEI_1 = min([1, L_1/L_char]);
a_SEI_1 = L_1/L_char;
eta_1 = (-delmuref_1*e + kBT*log(a_SEI_1) - kBT*log(a_solv) - kBT*log(a_e_1) + e*V) / kBT;
alpha_1 = 1;

% a_SEI_2 = min([1, L_2/L_char]);
a_SEI_2 = min([1, L_2/L_char]);
eta_2 = (-delmuref_2*e + kBT*log(a_SEI_2) - kBT*log(a_solv) - kBT*log(a_e_2) + e*V) / kBT;
alpha_2 = 1;

% define reactions
Rxn_1 = k0_1 * a_SEI_1^alpha_1 * abs(a_solv)^(1-alpha_1) * abs(a_e_1)^(1-alpha_1) ...
    * (exp(-(alpha_1)*eta_1) - exp((1-alpha_1)*eta_1)); % [mole/s]
Rxn_2 = k0_2 * a_SEI_2^alpha_2 * abs(a_solv)^(1-alpha_2) * abs(a_e_2)^(1-alpha_2)  ...
    * (exp(-(alpha_2)*eta_2) - exp((1-alpha_2)*eta_2)); % [mole/s]

% % define reactions
% Rxn_1 = k0_1 * 1 * abs(a_solv)^(0.5) * exp(-0.5*(V-delmuref_1)/kBToe) * sqrt(exp(-L_1/L_char)); % [mole/s]
% Rxn_2 = k0_2 * 1 * abs(a_solv)^(0.5) * exp(-0.5*(V-delmuref_2)/kBToe) * sqrt((1 - exp(-L_1/L_char))); % [mole/s]

% Length evolution equations
diffeq_1 = Rxn_1 * F / 3.6 * LQ_1;
diffeq_2 = Rxn_2 * F / 3.6 * LQ_2;

%
algeeq_1 = Rxn_2 / (D_solv * c0_solv / L_2) - (1 - a_solv);

dydt = [diffeq_1; diffeq_2; algeeq_1];

end

function dydt = DAE_model_03(t, y, ...
    k0_1, k0_2, LQ_1, LQ_2, V_1, V_2, D_solv, L_char)

% define lengths
L_1 = y(1);
L_2 = y(2);
a_solv = y(3);

% define voltage
V = LSV_hold(t);
kBToe = 0.025679; % [V]
e = 1.6022e-19; % [C/#]
NA = 6.022e23; 
F = e*NA; % [C/mole]

c0_solv = 13200 * (1 / 100^2) ; % [mole/m]

% define reactions
Rxn_1 = k0_1 * 1 * abs(a_solv)^(0.5) * exp(-0.5*(V-V_1)/kBToe) ...
    * (L_1/L_char) * (1 - L_1/L_char); % [mole/s]
Rxn_2 = k0_2 * 1 * abs(a_solv)^(0.5) * exp(-0.5*(V-V_2)/kBToe) ...
    * (exp(-L_1/L_char)); % [mole/s]

% Length evolution equations
diffeq_1 = Rxn_1 * F / 3.6 * LQ_1;
diffeq_2 = Rxn_2 * F / 3.6 * LQ_2;

%
algeeq_1 = Rxn_2 / (D_solv * c0_solv / L_2) - (1 - a_solv);

dydt = [diffeq_1; diffeq_2; algeeq_1];

end

function dydt = DAE_model_04(t, y, ...
    k0_1, k0_2, LQ_1, LQ_2, V_1, V_2, D_solv, L_char)

% define lengths
L_1 = y(1); L_2 = y(2); a_solv = y(3);

% define voltage
V = LSV_hold(t);
kBToe = 0.025679; % [V]
e = 1.6022e-19; % [C/#]
NA = 6.022e23; 
F = e*NA; % [C/mole]

c0_solv = 13200 * (1 / 100^2) ; % [mole/m]

% define reactions
Rxn_1 = k0_1 * 1 * a_solv * exp(-0.5*(V-V_1)/kBToe) * (2-atan(L_1/L_char)); % [mole/s]
Rxn_2 = k0_2 * 1 * a_solv * exp(-0.5*(V-V_2)/kBToe) * atan(L_1/L_char); % [mole/s]

% Length evolution equations
diffeq_1 = Rxn_1 * F / 3.6 * LQ_1;
diffeq_2 = Rxn_2 * F / 3.6 * LQ_2;

%
algeeq_1 = Rxn_2 / (D_solv * c0_solv / L_2) - (1 - a_solv);

dydt = [diffeq_1; diffeq_2; algeeq_1];

end

function dydt = DAE_model_06(t, y, ...
    k0_1, k0_2, LQ_1, LQ_2, V_1, V_2, D_solv, L_char)

% define lengths
L_1 = y(1);
L_2 = y(2);
a_solv = y(3);

% define voltage
V = LSV_hold(t);
kBToe = 0.025679; % [V]
e = 1.6022e-19; % [C/#]
NA = 6.022e23; 
F = e*NA; % [C/mole]

c0_solv = 13200 * (1 / 100^2) ; % [mole/m]

% define reactions
Rxn_1 = k0_1 * 1 * exp(-(V-V_1)/kBToe) ...
    * (L_1/L_char) * (1 - L_1/L_char); % [mole/s]
% Rxn_2 = k0_2 * 1 * abs(a_solv)^(0.5) * exp(-0.5*(V-V_2)/kBToe) ...
%     * (exp(-L_1/L_char)); % [mole/s]
Rxn_2 = k0_2*a_solv;

% Length evolution equations
diffeq_1 = Rxn_1 * F / 3.6 * LQ_1;
diffeq_2 = Rxn_2 * F / 3.6 * LQ_2;

%
algeeq_1 = Rxn_2 / (D_solv * c0_solv / L_2) - (1 - a_solv);

dydt = [diffeq_1; diffeq_2; algeeq_1];

end

function dydt = DAE_model_07(t, y, ...
    k0_1, k0_2, LQ_1, LQ_2, delmuref_1, delmuref_2, D_solv, L_char)

delmuref_1 = 1.25;

% define lengths
L_1 = y(1);
L_2 = y(2);
a_solv = y(3);

% define voltage
V = LSV_hold(t);
kBToe = 0.025679; % [V]
e = 1.6022e-19; % [C/#]
NA = 6.022e23; 
F = e*NA; % [C/mole]
kB = 1.381e-23; % [J/(#*K)]
kBT = kB*298; % [J/#]

c0_solv = 13200 * (1 / 100^2) ; % [mole/m]

a_SEI_1 = L_1/L_char;
eta_1 = (-delmuref_1*e + kBT*log(a_SEI_1) - kBT*log(a_solv) + e*V) / kBT;
alpha_1 = 1;

a_SEI_2 = min([L_2/L_char, 1]);
eta_2 = (-delmuref_2*e + kBT*log(a_SEI_2) - kBT*log(a_solv) + e*V) / kBT;
alpha_2 = 1;

% define reactions
Rxn_1 = k0_1 * a_SEI_1^alpha_1 * (1 - a_SEI_1) * abs(a_solv)^(1-alpha_1) ...
    * (exp(-(alpha_1)*eta_1) - exp((1-alpha_1)*eta_1)); % [mole/s]
Rxn_2 = k0_2 * a_SEI_2^alpha_2 * abs(a_solv)^(1-alpha_2) ...
    * (exp(-(alpha_2)*eta_2) - exp((1-alpha_2)*eta_2)); % [mole/s]

% Length evolution equations
diffeq_1 = Rxn_1 * F / 3.6 * LQ_1;
diffeq_2 = Rxn_2 * F / 3.6 * LQ_2;

%
algeeq_1 = Rxn_2 / (D_solv * c0_solv / L_2) - (1 - a_solv);

dydt = [diffeq_1; diffeq_2; algeeq_1];

end

function dydt = DAE_model_08(t, y, ...
    k0_1, k0_2, LQ_1, LQ_2, delmuref_1, delmuref_2, D_solv, L_char)

% define lengths
L_1 = y(1);
L_2 = y(2);
a_solv = y(3);

% define voltage
V = LSV_hold(t);
kBToe = 0.025679; % [V]
e = 1.6022e-19; % [C/#]
NA = 6.022e23; 
F = e*NA; % [C/mole]
kB = 1.381e-23; % [J/(#*K)]
kBT = kB*298; % [J/#]

c0_solv = 13200 * (1 / 100^2) ; % [mole/m]

a_SEI_1 = L_1/L_char;
eta_1 = (-delmuref_1*e + kBT*log(a_SEI_1) - kBT*log(a_solv) + e*V) / kBT;
alpha_1 = 0.5;

a_SEI_2 = L_2/L_char;
eta_2 = (-delmuref_2*e + kBT*log(a_SEI_2) - kBT*log(a_solv) + e*V) / kBT;
alpha_2 = 1;

% define reactions
Rxn_1 = k0_1 * a_SEI_1^alpha_1 * (1 - a_SEI_1) * abs(a_solv)^(1-alpha_1) ...
    * (exp(-(alpha_1)*eta_1) - exp((1-alpha_1)*eta_1)); % [mole/s]
Rxn_2 = k0_2 * abs(a_solv); % [mole/s]

% Length evolution equations
diffeq_1 = Rxn_1 * F / 3.6 * LQ_1;
diffeq_2 = Rxn_2 * F / 3.6 * LQ_2;

%
algeeq_1 = Rxn_2 / (D_solv * c0_solv / L_2) - (1 - a_solv);

dydt = [diffeq_1; diffeq_2; algeeq_1];

end

function dydt = DAE_model_09(t, y, ...
    k0_1, k0_2, LQ_1, LQ_2, delmuref_1, delmuref_2, D_solv, L_char)

delmuref_1 = 1.25;

% define lengths
L_1 = y(1);
L_2 = y(2);
a_solv = y(3);

% define voltage
V = LSV_hold(t);
kBToe = 0.025679; % [V]
e = 1.6022e-19; % [C/#]
NA = 6.022e23; 
F = e*NA; % [C/mole]
kB = 1.381e-23; % [J/(#*K)]
kBT = kB*298; % [J/#]

c0_solv = 13200 * (1 / 100^2) ; % [mole/m]

a_SEI_1 = L_1/L_char;
eta_1 = (-delmuref_1*e + kBT*log(a_SEI_1) - kBT*log(a_solv) + e*V) / kBT;
alpha_1 = 1;

a_SEI_2 = L_2/L_char;
eta_2 = (-delmuref_2*e + kBT*log(a_SEI_2) - kBT*log(a_solv) + e*V) / kBT;
alpha_2 = 1;

% define reactions
Rxn_1 = k0_1 * a_SEI_1^alpha_1 * abs(a_solv)^(1-alpha_1) ...
    * (exp(-(alpha_1)*eta_1) - exp((1-alpha_1)*eta_1)); % [mole/s]
Rxn_2 = k0_2 * a_SEI_2^alpha_2 * abs(a_solv)^(1-alpha_2) ...
    * (exp(-(alpha_2)*eta_2) - exp((1-alpha_2)*eta_2)); % [mole/s]

% Length evolution equations
diffeq_1 = Rxn_1 * F / 3.6 * LQ_1;
diffeq_2 = Rxn_2 * F / 3.6 * LQ_2;

%
algeeq_1 = Rxn_2 / (D_solv * c0_solv / L_2) - (1 - a_solv);

dydt = [diffeq_1; diffeq_2; algeeq_1];

end

function dydt = DAE_model_10(t, y, k0_1, k0_2, LQ_1, LQ_2, ...
    V_1, V_2, D_solv, L_char)

% define lengths
L_1 = y(1);
L_2 = y(2);
a_solv = y(3);

% define voltage
V = LSV_hold(t);
kBToe = 0.025679; % [V]
e = 1.6022e-19; % [C/#]
NA = 6.022e23; 
F = e*NA; % [C/mole]
kB = 1.381e-23; % [J/(#*K)]
kBT = kB*298; % [J/#]

c0_solv = 13200 * (1 / 100^2) ; % [mole/m]

a_SEI_1 = min([L_1/L_char, 1]);
eta_1 = (-V_1*e + kBT*log(a_SEI_1) - kBT*log(a_solv) + e*V) / kBT;
alpha_1 = 1;

a_SEI_2 = min([L_2/L_char, 1]);
% a_SEI_2 = L_2/L_char;
eta_2 = (-V_2*e + kBT*log(a_SEI_2) - kBT*log(a_solv) + e*V) / kBT;
alpha_2 = 1;

% define reactions
Rxn_1 = k0_1 * a_SEI_1^alpha_1 * (1 - a_SEI_1) * abs(a_solv)^(1-alpha_1) ...
    * (exp(-(alpha_1)*eta_1) - exp((1-alpha_1)*eta_1)); % [mole/s]
Rxn_2 = k0_2 * a_SEI_2^alpha_2 * abs(a_solv)^(1-alpha_2) ...
    * (exp(-(alpha_2)*eta_2) - exp((1-alpha_2)*eta_2)); % [mole/s]

% Length evolution equations
diffeq_1 = Rxn_1 * F / 3600 * 1e3 * 2 * LQ_1;
diffeq_2 = Rxn_2 * F / 3600 * 1e3 * 2 * LQ_2;

%
algeeq_1 = (Rxn_2 + Rxn_1) / (D_solv * c0_solv / L_2) - (1 - a_solv);

dydt = [diffeq_1; diffeq_2; algeeq_1];

end

function dydt = DAE_model_11(t, y, k0_1, k0_2, LQ_1, LQ_2, ...
    V_1, V_2, D_solv, L_char)

% define lengths
L_1 = y(1);
L_2 = y(2);
a_solv = y(3);

% define voltage
V = LSV_hold(t);
kBToe = 0.025679; % [V]
e = 1.6022e-19; % [C/#]
NA = 6.022e23; 
F = e*NA; % [C/mole]
kB = 1.381e-23; % [J/(#*K)]
kBT = kB*298; % [J/#]

c0_solv = 13200 * (1 / 100^2) ; % [mole/m]

a_SEI_1 = min([L_1/L_char, 1]);
eta_1 = (-V_1*e + kBT*log(a_SEI_1) - kBT*log(a_solv) + e*V) / kBT;
alpha_1 = 1;

a_SEI_2 = min([L_2/L_char, 1]);
eta_2 = (-V_2*e + kBT*log(a_SEI_2) - kBT*log(a_solv) + e*V) / kBT;
alpha_2 = 1;

% define reactions
Rxn_1 = k0_1 * a_SEI_1^alpha_1 * abs(a_solv)^(1-alpha_1) ...
    * (exp(-(alpha_1)*eta_1) - exp((1-alpha_1)*eta_1)); % [mole/s]
Rxn_2 = k0_2 * a_SEI_2^alpha_2 * abs(a_solv)^(1-alpha_2) ...
    * (exp(-(alpha_2)*eta_2) - exp((1-alpha_2)*eta_2)); % [mole/s]

% Length evolution equations
diffeq_1 = Rxn_1 * F / 3600 * 1e3 * 2 * LQ_1;
diffeq_2 = Rxn_2 * F / 3600 * 1e3 * 2 * LQ_2;

%
algeeq_1 = (Rxn_2 + Rxn_1) / (D_solv * c0_solv / L_2) - (1 - a_solv);

dydt = [diffeq_1; diffeq_2; algeeq_1];

end

function dydt = DAE_model_12(t, y, k0_1, k0_2, LQ_1, LQ_2, ...
    V_1, V_2, D_solv, L_char)

% define lengths
L_1 = y(1);
L_2 = y(2);
a_solv = y(3);

% define voltage
V = LSV_hold(t);
kBToe = 0.025679; % [V]
e = 1.6022e-19; % [C/#]
NA = 6.022e23; 
F = e*NA; % [C/mole]
kB = 1.381e-23; % [J/(#*K)]
kBT = kB*298; % [J/#]

c0_solv = 13200 * (1 / 100^2) ; % [mole/m]

a_SEI_1 = min([L_1/L_char, 1]);
eta_1 = (-V_1*e + kBT*log(a_SEI_1) - kBT*log(a_solv) + e*V) / kBT;
alpha_1 = 1;

a_SEI_2 = min([L_2/L_char, 1]);
eta_2 = (-V_2*e + kBT*log(a_SEI_2) - kBT*log(a_solv) + e*V) / kBT;
alpha_2 = 1;

% define reactions
Rxn_1 = k0_1 * a_SEI_1^alpha_1 * exp(-L_1/L_char) * abs(a_solv)^(1-alpha_1) ...
    * (exp(-(alpha_1)*eta_1) - exp((1-alpha_1)*eta_1)); % [mole/s]
Rxn_2 = k0_2 * a_SEI_2^alpha_2 * (1 - exp(-L_1/L_char)) * abs(a_solv)^(1-alpha_2) ...
    * (exp(-(alpha_2)*eta_2) - exp((1-alpha_2)*eta_2)); % [mole/s]

% Length evolution equations
diffeq_1 = Rxn_1 * F / 3600 * 1e3 * 2 * LQ_1;
diffeq_2 = Rxn_2 * F / 3600 * 1e3 * 2 * LQ_2;

%
algeeq_1 = (Rxn_2 + Rxn_1) / (D_solv * c0_solv / L_2) - (1 - a_solv);

dydt = [diffeq_1; diffeq_2; algeeq_1];

end

