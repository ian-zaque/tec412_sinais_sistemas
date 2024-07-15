% Definir as funções
n = -10:10;

x_n = @(n) exp(-n.^2); % Exemplo de uma função gaussiana
h_n = @(n) sin(n);     % Exemplo de uma função seno

% Definir o intervalo e a resolução
x = linspace(-10, 10, 1000); % Intervalo de -10 a 10 com 1000 pontos

% Amostrar as funções no intervalo definido
y1 = f1(x);
y2 = f2(x);

% Inicializar o resultado da convolução
y_conv = zeros(1, length(x));

% Calcular a convolução
for n = 1:length(x)
    for m = 1:length(x)
        if (n - m + 1 > 0) && (n - m + 1 <= length(x))
            y_conv(n) = y_conv(n) + y1(m) * y2(n - m + 1);
        end
    end
end

% Plotar as funções e o resultado da convolução
figure;
subplot(3, 1, 1);
plot(x, y1);
title('Função 1');

subplot(3, 1, 2);
plot(x, y2);
title('Função 2');

subplot(3, 1, 3);
plot(x, y_conv);
title('Convolução das Funções');

