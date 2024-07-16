% Definir a função degrau unitário
u = @(n) double(n >= 0); % Retorna 1 se n >= 0, caso contrário, retorna 0

% Definir os sinais
n = -5:5; % Intervalo para n

% Definir x[n] = ((1/3)^-n) * u[-n-1]
x = ((1/3).^-n) .* u(-n-1); % Aplica a função degrau unitário a -n-1 e multiplica pelo termo ((1/3)^-n)

% Definir h[n] = u[n-1]
h = u(n-1); % Aplica a função degrau unitário a n-1

% Usar a função nativa conv para calcular a convolução
y_conv = conv(x, h);

% Definir o novo intervalo para a sequência convoluída
n_conv = (2 * -5):(2 * 5); % Novo intervalo para a sequência convoluída

% Plotar os sinais e o resultado da convolução
figure;
subplot(3, 1, 1);
stem(n, x);
title('x[n] = ((1/3)^{-n}) * u[-n-1]');
xlabel('n');
ylabel('x[n]');

subplot(3, 1, 2);
stem(n, h);
title('h[n] = u[n-1]');
xlabel('n');
ylabel('h[n]');

subplot(3, 1, 3);
stem(n_conv, y_conv);
title('Convolução y[n] = x[n] * h[n]');
xlabel('n');
ylabel('y[n]');

