% Definir a função degrau unitário
u = @(n) double(n >= 0);

% Definir os sinais
n = -5:5; % Intervalo para n

% x[n] = ((1/3)^-n) * u[-n-1]
x = ((1/3).^-n) .* u(-n-1);

% h[n] = u[n-1]
h = u(n-1);

% Plotar as funções presentes
figure;

x_1 = ((1/3).^-n);
subplot(3, 1, 1);
stem(-5:5, x_1);
title('x[n] = (1/3)^{-n}');
xlabel('n');
ylabel('x[n]');

x_2 = (u(-n));
subplot(3, 1, 2);
stem(-5:5, x_2);
title('x[n] = u(-n)');
xlabel('n');
ylabel('x[n]');

x_3 = (u(-n -1));
subplot(3, 1, 3);
stem(-5:5, x_3);
title('x[n] = u(-n-1)');
xlabel('n');
ylabel('x[n]');





% Inicializar o resultado da convolução
len_x = length(x);
len_h = length(h);
len_conv = len_x + len_h - 1;
y_conv = zeros(1, len_conv);

% Calcular a convolução manualmente
for n = 1:len_conv
    for k = 1:len_x
        if (n - k + 1 > 0) && (n - k + 1 <= len_h)
            y_conv(n) = y_conv(n) + x(k) * h(n - k + 1);
        end
    end
end

% Definir o novo intervalo para a sequência convoluída
n_conv = (-5) + (0:len_conv-1);

% Plotar os sinais e o resultado da convolução
figure;
subplot(3, 1, 1);
stem(-5:5, x);
title('x[n] = ((1/3)^{-n}) * u[-n-1]');
xlabel('n');
ylabel('x[n]');

subplot(3, 1, 2);
stem(-5:5, h);
title('h[n] = u[n-1]');
xlabel('n');
ylabel('h[n]');

subplot(3, 1, 3);
stem(n_conv, y_conv);
title('Convolução y[n] = x[n] * h[n]');
xlabel('n');
ylabel('y[n]');

