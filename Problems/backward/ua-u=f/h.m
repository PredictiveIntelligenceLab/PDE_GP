function [H] = h(x, y, hyp,i)

global ModelInfo;
alpha = ModelInfo.alpha;

logsigma = hyp(1);
logtheta = hyp(2);

if i == 0 || i == 1
    
    hh = @(x,y) exp(1).^(logsigma+(-1/2).*exp(1).^((-1).*logtheta).*(x+(-1).*y) ...
        .^2).*(exp(1).^((-1).*logtheta)).^(1/2).*(exp(1).^logtheta).^(( ...
        -1/2).*alpha).*pi.^(-1/2).*((-1).*(exp(1).^logtheta).^((1/2).*(1+ ...
        alpha)).*pi.^(1/2)+2.^((1/2).*alpha).*(exp(1).^logtheta).^(1/2).* ...
        cos((1/2).*alpha.*pi).*gamma((1/2).*(1+alpha)).*kummer( ...
        (-1/2).*alpha,(1/2),(1/2).*exp(1).^((-1).*logtheta).*(x+(-1).*y) ...
        .^2)+2.^((1/2).*(1+alpha)).*(x+(-1).*y).*gamma(1+(1/2).*alpha).* ...
        kummer((1/2).*(1+(-1).*alpha),(3/2),(1/2).*exp(1).^(( ...
        -1).*logtheta).*(x+(-1).*y).^2).*sin((1/2).*alpha.*pi));
    
    H = real(bsxfun(hh,x,y'));
    
elseif i==2
    
    hh = @(x,y) (-1/6).*exp(1).^(logsigma+(-1).*logtheta+(-1/2).*exp(1).^((-1).* ...
        logtheta).*(x+(-1).*y).^2).*(exp(1).^((-1).*logtheta)).^(1/2).*( ...
        exp(1).^logtheta).^((1/2).*((-1)+(-1).*alpha)).*pi.^(-1/2).*(3.*( ...
        exp(1).^logtheta).^((1/2).*(2+alpha)).*pi.^(1/2).*(x+(-1).*y).^2+ ...
        2.^((1/2).*alpha).*(3.*exp(1).^logtheta.*cos((1/2).*alpha.*pi).* ...
        gamma((1/2).*(1+alpha)).*(alpha.*exp(1).^logtheta.* ...
        kummer((-1/2).*alpha,(1/2),(1/2).*exp(1).^((-1).* ...
        logtheta).*(x+(-1).*y).^2)+(-1).*(1+alpha).*(x+(-1).*y).^2.* ...
        kummer((-1/2).*alpha,(3/2),(1/2).*exp(1).^((-1).* ...
        logtheta).*(x+(-1).*y).^2))+2.^(1/2).*(exp(1).^logtheta).^(1/2).*( ...
        x+(-1).*y).*gamma(1+(1/2).*alpha).*(3.*(1+alpha).*exp(1) ...
        .^logtheta.*kummer((1/2).*(1+(-1).*alpha),(3/2),(1/2).* ...
        exp(1).^((-1).*logtheta).*(x+(-1).*y).^2)+(-1).*(2+alpha).*(x+(-1) ...
        .*y).^2.*kummer((1/2).*(1+(-1).*alpha),(5/2),(1/2).* ...
        exp(1).^((-1).*logtheta).*(x+(-1).*y).^2)).*sin((1/2).*alpha.*pi)) ...
        );
    
    H = real(bsxfun(hh,x,y'));
end
