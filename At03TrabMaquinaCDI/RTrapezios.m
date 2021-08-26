function area = RTrapezios(f,a,b,n)
% RTrapezios Integracao Numerica - Formula da Regra dos Trapezios
%
% INPUT:  f - funcao integranda
%         [a, b] - intervalo de integracao
%         n - numero de iterações
%
% OUTPUT: area - Valor da area calculada pela Regra dos Trapezios
%
%   15/04/2021  Arménio Correia   armenioc@isec.pt
%   16/06/2021  João Almeida     a2020144466@isec.pt
%   16/06/2021  Nuno Santos      a2019110035@isec.pt
%   16/06/2021  Pedro Nogueira   a2020136533@isec.pt
%%

h=(b-a)/n;        % h é o valor dos subintrevalos
x=a;
s=0;
for i=1:n-1
    x=x+h;
    s=s+f(x);
end
area = (h/2)*(f(a)+2*s+f(b));

end