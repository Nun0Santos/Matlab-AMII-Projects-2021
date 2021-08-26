function [x,y,dydx] = DiferencasFinitasRegressivas2P(f,a,b,h,y)
% Derivação Numérica - Fórmula das Diferenças Regressivas (2 pontos)
% Formúla das Diferenças Regressivas (2 pontos)
% f'(x(i))=(f(x(i))-f(x(i-1))/h
% INPUT:  f - função
%         [a, b] - intervalo de derivação
%         h - passo da discretização
%         y - imagens x vs y
% OUTPUT: [x, y] - malha de pontos
%         dydx - derivada de f 
%
%   16/06/2021  João Almeida     a2020144466@isec.pt
%   16/06/2021  Nuno Santos      a2019110035@isec.pt
%   16/06/2021  Pedro Nogueira   a2020136533@isec.pt 
%   
%%

x = a:h:b;   % Alocação de memória
n = length(x);
if nargin == 4
    y = f(x);
end
dydx = zeros(1,n);   % Alocação de memória
dydx(1) = (y(2)-y(1))/h;
for i = 2:n
    dydx(i) = (y(i)-y(i-1))/h;
end

end