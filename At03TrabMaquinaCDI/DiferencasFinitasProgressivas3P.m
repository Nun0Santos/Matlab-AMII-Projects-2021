function [x,y,dydx] = DiferencasFinitasProgressivas3P(f,a,b,h,y)
% NDerivacaoDFP3 Derivação Numérica - Fórmula das Diferenças Progressivas (3 pontos)
% Formúla das Diferenças Progressivas (3 pontos)
% f'(x(i))=(-3*f(x(i)) + 4*f(x(i+1)) + f(x(i+2))/(2*h)
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
for i = 1:n-2
    dydx(i) = (-3*y(i) + 4*y(i+1) - y(i+2))/(2*h);
end
dydx(n-1) = (y(n-3) - 4*y(n-2) + 3*y(n-1))/(2*h);
dydx(n) = (y(n-2) - 4*y(n-1) + 3*y(n))/(2*h);

end