================================
Dodatek Analiza danych rynkowych
================================

Oprogramowanie Sage a w szczególności zawarte w min biblioteki `numpy`
`scipy` i możliwości wizualizacji i interacji dają możliwość
stworzenia "od podstaw" prototypu aplikacji to szerokiego spektrum
analiz danych i statystyk.

Przykład 1
----------


.. sagecellserver::

    import urllib
    import numpy as np 
    from scipy.stats import kurtosis
    fp  = urllib.urlopen("https://dl.dropboxusercontent.com/u/11718006/COMARCH.mst")
    d1 = np.loadtxt(fp,skiprows=1,usecols=[2],delimiter=',')
    data = d1
    N = data.shape[0]
    t = np.arange(N)
    Gaussian(x,mu,sigma) = 1/sqrt(2*pi*sigma^2)*exp(-(x-mu)^2/(2*sigma^2))
    @interact
    def _(n1=slider(range(1,N)),n2=[20,30,100,250,500],\
     nbins =[10,50,100],step=[20,100,200,1000]): 
        X0 = np.gradient(data)/data
        #X0[X0>8]=0
        #X0[X0<-8]=0
        n2 = n1+n2
        X = X0[n1:n2]
        p0 = line(zip(t,data),color='gray',thickness=0.5,figsize=(6,1))
        p0 += line(zip(t[n1:n2],data[n1:n2]),color='red',thickness=1)
        K=np.array([ (t[i], kurtosis(data[i:i+step]) )\
         for i in range(0,data.size-step,1)])
        pK = line(K,thickness=0.5,color='green',figsize=(6,1))

        p1 = line(zip(t,X0),color='gray',thickness=0.5)
        p1 += line(zip(t[n1:n2],X),color='red',thickness=1.,figsize=(6,1))

        mu,sigma = np.average(X),np.std(X)
        p2 = plot(Gaussian(x,mu,sigma),(x,-4*sigma,4*sigma),figsize=(6,3))
        H = np.histogram(X,bins=nbins)
        normalizacja = H[0].sum()*(H[1].max()-H[1].min())/nbins
        p2 += line( zip(H[1],H[0]/normalizacja),color='red') 
        print mu,sigma
        html.table([[p0],[p1],[pK],[kurtosis(X)],[p2]])
