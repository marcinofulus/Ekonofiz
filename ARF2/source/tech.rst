================================
Dodatek Analiza danych rynkowych
================================



Dane rynkowe
============

Zwroty względne, bezwględne i log-zwroty
------------------------------------------------

Rozważmy ewolucję ceny pewnego aktywa w czasie. Wartości notowań
aktywa sa pewnym procesem losowym. W analizie jego zmienności ważnym
pojęciem jest "zwrot", który jest matematycznie rzecz biorąc
przyrostem procesu na pewnym okresie czasu. Załóżmy, że mamy pewien
dyskretny ciąg chwil czasu :math:`t_i` w któych aktywo ma cenę  :math:`S_i`.
W finansach spotymay trzy wazne pojęcia:

- zwrot absolutny w chwili :math:`t_i`: :math:`S_i-S_{i-1}`
- zwrot względny w chwili  :math:`t_i`: :math:`\displaystyle\frac{S_i-S_{i-1}}{S_{i-1}}`
- log-zwrot w chwili :math:`t_i`: :math:`\log S_i -\log S_{i-1}`

Analiza szeregów czasowych notowań historycznych najczęściej operuje
właśnie tymi wielkościami. Posiadają one kilka istotnych własności. Po
pierwsze, korzystając z własności logarytmu naturalnego możemy
napisać:

.. math::

   \log S_i -\log S_{i-1} = \log \frac{S_i}{S_{i-1}}.

Jeśli zwrot względny jest mały, to jest w przybłiżeniu równy
log-zwrotowi. Zapiszmy:

.. math::

   \log \frac{S_i}{S_{i-1}} = \log  \frac{S_{i-1}+S_i-S_{i-1}}{S_{i-1}} \\
   = \log \left(1+\frac{S_i-S_{i-1}}{S_{i-1}}\right).
   
Teraz możemy rozwinąć logarytm w szereg Taylora:

.. math::
   :label: taylorlog

   \log (1+x) = x-\frac{x^2}{x} + \mathop{O}(x^3),

jeżeli zatrzymamy się tylko na liniowym członie to otrzymamy:

.. math::

    \log \frac{S_i}{S_{i-1}} \simeq \frac{S_i-S_{i-1}}{S_{i-1}}


Klasycznym modelem matematycznym, który stosuje się do opisu
zachowania się zmian ceny jest geometryczny ruch Browna. W takim
przypadku zakłada się, że zwrot względny spełnia:

.. math:: 

  \frac{S_i-S_{i-1}}{S_{i-1}} = \mu  + \sigma N_i(0,1),


gdzie :math:`\mu` to deterministyczne tempo wzrostu logarytmu ceny
związane ze stopą procentową a :math:`\sigma^2` to wariancja zmian
logarytmu ceny.  :math:`N_i(0,1)` oznacza niezależne gaussowskie
zmienne losowe o średniej zero i wariancji jeden. Przejście do granicy
:math:`(t_i-t_{i-1})\to 0` wymaga zastosowania stochastycznych równań
różniczkowych i taki proces ciągły jest dany wzrorem:


.. math:: 
  :label: sde1

  dS = \mu S dt  + \sigma S dW,


gdzie :math:`dW` to różniczka procesu Wienera. Można pokazać, że
zakładając ewolucje według równania stochastycznego :eq:`sde1`
otrzymujemy proces w którym warunkowy rozkład ceny w czasie :math:`t`
przy założeniu ceny :math:`S_0` w chwili :math:`t=0`, jest
log-normalny:

.. math::

   P_S(S,t|S_0,0)= \frac{1}{\sqrt{2\pi\sigma^2 t S^2}} e^{-\displaystyle\frac{(\log(\frac{S}{S_0})-(\mu-\frac{\sigma^2}{2}))^2}{2\sigma^2t}}.

.. note::

   Sprawdź jaka jest kanoniczna postać rozkładu log-normalnego np. w
   `Wikipedii
   <http://pl.wikipedia.org/wiki/Rozk%C5%82ad_logarytmicznie_normalny>`_. Zauważ,
   że w naszej notacji zarówno średnia jak i wariancja rosną z liniowo
   czasem.  Jak to zinterpretować?

Dla dużych wartości wariancji i średniej rozkład ten jest zupełnie
odmienny od rozkładu normalnego, dla małych jest jednak do niego
podobny. Oznacza to, że dla małych czasów pomiędzy obserwacjami,
np. notowaniami dziennymi, trudno jest odróżnić  jeden od drugiego. 


Oprogramowanie Sage a w szczególności zawarte w nim biblioteki `numpy`
oraz `scipy` oraz wbudowane możliwości wizualizacji i interakcji dają
możliwość stworzenia "od podstaw" prototypu własnej aplikacji to
szerokiego spektrum analiz danych i statystyk.

.. admonition:: Poeskperymentuj z komputerem

   Zbadaj czym różnią się dwa rozkłady - normalny i log-normalny o
   tych samych parametrach średniej oraz wariancji. 

     - Wariancja i średnia zalezy od czasu, który można zmieniać
       suwakiem. Zwiększ czas i zaobserwuj jak zmienia się
       rozkład. Czy w każdym z przypadków może pojawić się cena aktywa
       mniejsza od zera?
  
     - Zmień w kodzie inne parametry: wartość początkową, wariancję na
       jednostkę czasu i szybkośc wzrostu ceny.


.. sagecellserver::

    var('r,sigma,t,x0')

    logN = 1/(sigma*sqrt(2*pi*t)*x)*exp(-(log(x)-log(x0)-(r-sigma^2/2)*t)^2/(2*sigma^2*t))
    Normal = 1/(sigma*sqrt(2*pi*t))*exp(-(x-x0-r*t)^2/(2*sigma^2*t))
    @interact
    def _(t_=slider(0.01,10,0.01,default=0.05)):
        pars = {r:.0,sigma:.3,x0:1,t:t_}
        p1 = plot( logN.subs(pars) , (x,1e-5,4), fill=True)
        p2 = plot( Normal.subs(pars) , (x,1e-5,4), figsize=4,color='red')
        (p1+p2).show()


Przykład 1
----------

Wczytamy dane i obliczymy zwroty względne i logarytmiczne. 

.. attention:: Dane zazwyczaj są w pliku, jednak w tym przypadku w skrypcie
   nie mamy możliwości załączenia pliku. Dlatego będziemy analizować
   dane, które są dostępne jako odnośnik URL i które możemy otworzyć z
   pomocą biblioteki :code:`urllib`.

Dane z notowań historycznych najczęściej występują w formacie zwanym
`csv` - czyli wartości oddzielone przecinkiem. Można je wczytać do
akrusza kalkulacyjnego, ale też bezpośrednio otworzyć za pomocą
pakietu :code:`numpy`.


.. sagecellserver::


    import numpy as np 
    import urllib

    fp  = urllib.urlopen("https://dl.dropboxusercontent.com/u/11718006/COMARCH.mst")
    data = np.loadtxt(fp,skiprows=1,usecols=[2],delimiter=',')
    N = data.shape[0]
    t = np.arange(N)
    line(zip(t,data),thickness=0.3,figsize=(7,2))

.. admonition:: Poeksperymentuj sam

   Ile jest danych? Wypisz na ekranie pierwsze 100 wartości.


Policzmy teraz zwroty względne i logarytmiczne. 

.. sagecellserver::

    r_rel = np.gradient(data)/data
    r_log = np.gradient(np.log(data))




Narysujmy wykres log-zwrotów i zwrotów względnych:

.. sagecellserver::

    line(zip(t,r_rel),color='gray',thickness=0.5)+\
    point(zip(t,r_log),color='red')

Jak widać praktycznie wielkości te się pokrywają.  Możemy też łatwo
sporządzić histogram wartość tychże zwrotów co jeszcze bardziej
uwydatnia tą własność:

.. sagecellserver::

    nbins=100
    plst = []
    for r,c in zip([r_rel,r_log],['red','blue']):
        H = np.histogram(r_rel,bins=nbins)
        normalizacja = H[0].sum()*(H[1].max()-H[1].min())/nbins
        plst.append(line( zip(H[1],H[0]/normalizacja),color=c,figsize=(4,2)))
    html.table([["Zwroty wzgledne","Log-zwroty"],plst])


.. admonition:: Poeksperymentuj z komputerem

   Zbadaj jak wyglądałby histogram dla różnych wartości parametry
   :code:`nbins`. Czy bardzo duże i bardzo małe wartości mają sens?
   Jaki jest użyteczny zakres tego parametru?


Stacjonarność danych
~~~~~~~~~~~~~~~~~~~~

Jeśli model



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
        #X0 = np.gradient(data)/data
        X0 = np.gradient(np.log(data))
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
