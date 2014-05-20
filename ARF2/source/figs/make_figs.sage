# -*- coding: utf-8 -*-
var('S')
def longCALL(S,K,P=0):
    return max_symbolic(S-K,0)-P
def longPUT(S,K,P=0):
    return max_symbolic(K-S,0)-P
def shortCALL(S,K,P=0):
    return -max_symbolic(S-K,0)+P
def shortPUT(S,K,P=0):
    return -max_symbolic(K-S,0)+P


from scipy.stats import norm
import numpy as np 
def BlackScholes(S0,K,r,T,sigma):
    d1=(np.log(S0/K)+(r+sigma**2/2)*T)/(sigma*np.sqrt(T));
    d2=d1-sigma*np.sqrt(T);
    C = S0*norm.cdf(d1)-K*exp(-r*T)*norm.cdf(d2);
    P = K*np.exp(-r*T)*norm.cdf(-d2)-S0*norm.cdf(-d1);
    return (C,P)


var('sigma,S0,K,T,r')
cdf(x) = 1/2*(1+erf(x/sqrt(2)))
d1=(log(S0/K)+(r+sigma**2/2)*T)/(sigma*sqrt(T))
d2=d1-sigma*sqrt(T)
C(S0,K,r,T,sigma) = S0*cdf(d1)-K*exp(-r*T)*cdf(d2)
P(S0,K,r,T,sigma) = K*exp(-r*T)*cdf(-d2)-S0*cdf(-d1)

def plotOption(OPTION=longCALL,S0=115,K=125, c='red'):
    var('S')
    S1,S2 = 100,140
    sigma = 0.1
    if "CALL" in OPTION.__name__:
        cena = C 
    else:
        cena = P
    if "short" in OPTION.__name__:
        k = -1.0
    else:
        k = 1.0    

    SP = cena(S0,K,0.0,1,sigma).n()       
    p  = plot( OPTION(S,K,SP),(S,S1,S2),color=c)
    p += plot(k*(cena(x,K,0.0,1,sigma)-SP),(x,S1,S2),color='gray',thickness=0.5)
    p += point([(K,0),(S0,0)],color='brown',size=40,gridlines=[[K],[]])
    p += text(r"$K$",(K,2))
    p += text(r"$S_0$",(S0,k*2))
    return p

def plotOptions(OPTIONS=[longCALL,longPUT],Ks=[125,120], cs=['red','green'],alpha=None,pltbs=True):
    var('S')
    S1,S2 = 100,140
    sigma = 0.1
    p = Graphics()
    Osum,BSsum  = 0,0
    if alpha==None:
        a = [1.0]*len(OPTIONS)+[1.0]
    else:
        a = [alpha[1]]*len(OPTIONS)+[alpha[1]]
        a[alpha[0]]=1.0        
    for i,(OPTION,K,c) in enumerate(zip(OPTIONS,Ks,cs)):
        if "CALL" in OPTION.__name__:
            No = 0
        else:
            No = 1   
        if "long" in OPTION.__name__:
            C = +1.0
        else:
            C = -1.0    
        P = BlackScholes(115,K,0.0,1,sigma)[No]
        x = np.linspace(S1,S2,50)    
        BS =  C*( BlackScholes(x,K,0.0,1,sigma)[No] - P)
        p += plot( OPTION(S,K,P),(S,S1,S2),thickness=2.,color=c,alpha=a[i])
        if pltbs: 
            p += line(zip(x,BS),color=c,thickness=1.,alpha=a[i])
        p += point([(K,0)],color=c,size=40,alpha=a[i])
        p += text(r"$K_%d$"%(i+1),(K,2),fontsize=15,color=c)
        Osum += OPTION(S,K,P)
        BSsum += BS
    p += plot( Osum,(S,S1,S2),color='black',thickness=3.,alpha=a[-1])
    if pltbs:
        p += line(zip(x,BSsum),color='black',thickness=1.,alpha=a[-1])
    p += point([(115,0)],color='brown',size=40,gridlines=[Ks,[]])
    return p


""" Rysunki do skryptu ARF2 """

figlst = [] # inicjacja listy rysunków z nazwami

P_c,P_p = C(50,50,.05,90/365.,0.3).n(),P(50,50,.05,90/365.,0.3).n()

p=plot( longCALL(S,50,0)-P_c,(S,0,100),color='brown')+\
 plot( longPUT(S,50,0)-P_p,(S,0,100),color='red')+\
 plot( S-50,(S,0,100),color='blue')+\
 plot( (50-50*exp(-0.05*90/365.)),(S,0,100),figsize=4,color='green')
p.set_aspect_ratio(1)
p.axes_labels(['cena S','zysk/strata'])


figlst.append([p,"parytet0"])



for [p,n] in figlst:
    #p.save('%s.jpg'%n)
    p.save('%s.png'%n)
    p.save('%s.pdf'%n)
    #p.save('%s.eps'%n)






