function S = RSimpson(f,a,b,n)
% RTrapezios Integracao Numerica - Formula da Regra de Simpson
%
% INPUT:  f - funcao integranda
%         [a, b] - intervalo de integracao
%         n - numero de iterações
%
% OUTPUT: area - Valor da area calculada pela Regra de Simpson
%
%   15/04/2021  Arménio Correia   armenioc@isec.pt
%   16/06/2021  João Almeida     a2020144466@isec.pt
%   16/06/2021  Nuno Santos      a2019110035@isec.pt
%   16/06/2021  Pedro Nogueira   a2020136533@isec.pt
%%

h = (b-a)/n;        % h é o valor dos subintrevalos
x = a:h:b;
s = 0;
for i = 2:n-1
    if mod(i,2)==0 %resto
        s = s+2*f(x(i));
    else
        s = s+4*f(x(i));
    end
end
S = h/3*(f(a)+s+f(b));

end