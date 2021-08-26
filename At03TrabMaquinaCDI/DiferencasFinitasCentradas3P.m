function [x,y,dydx] = DiferencasFinitasCentradas3P(f,a,b,h,y)
% NDerivacaoDFC Derivação Numérica - Fórmula das Diferenças Centradas (3 pontos)
% Formúla das Diferenças Centradas (3 pontos)
% f'(x(i))=(f(x(i+1))-f(x(i-1))/(2*h)
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
dydx(1) = (-3*y(1) + 4*y(2) - y(3))/(2*h);
for i = 2:n-1
    dydx(i) = (y(i+1)-y(i-1))/(2*h);
end
dydx(n) = (y(n-2) - 4*y(n-1) + 3*y(n))/(2*h);

end