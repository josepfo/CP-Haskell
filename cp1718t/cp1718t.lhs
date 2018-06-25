\documentclass[a4paper]{article}
\usepackage[a4paper,left=2cm,right=2cm,top=2.5cm,bottom=2.5cm]{geometry}
\usepackage{palatino}
\usepackage[colorlinks=true,linkcolor=blue,citecolor=blue]{hyperref}
\usepackage{graphicx}
\usepackage{cp1718t}
\usepackage{subcaption}
\usepackage{adjustbox}
\usepackage{amsmath}
%================= lhs2tex=====================================================%
%include polycode.fmt 
%format (div (x)(y)) = x "\div " y
%format succ = "\succ "
%format ==> = "\Longrightarrow "
%format map = "\map "
%format length = "\length "
%format fst = "\p1"
%format p1  = "\p1"
%format snd = "\p2"
%format p2  = "\p2"
%format Left = "i_1"
%format Right = "i_2"
%format i1 = "i_1"
%format i2 = "i_2"
%format >< = "\times"
%format >|<  = "\bowtie "
%format |-> = "\mapsto"
%format . = "\comp "
%format (kcomp (f)(g)) = f "\kcomp " g
%format -|- = "+"
%format conc = "\mathsf{conc}"
%format summation = "{\sum}"
%format (either (a) (b)) = "\alt{" a "}{" b "}"
%format (frac (a) (b)) = "\frac{" a "}{" b "}"
%format (uncurry f) = "\uncurry{" f "}"
%format (const f) = "\underline{" f "}"
%format TLTree = "\mathsf{TLTree}"
%format (lcbr (x)(y)) = "\begin{lcbr}" x "\\" y "\end{lcbr}"
%format (split (x) (y)) = "\conj{" x "}{" y "}"
%format for f i = "\mathsf{for}\ " f "\ " i
%format B_tree = "\mathsf{B}\mbox{-}\mathsf{tree} "
\def\ana#1{\mathopen{[\!(}#1\mathclose{)\!]}}
%format (cataA (f) (g)) = "\cata{" f "~" g "}_A"
%format (anaA (f) (g)) = "\ana{" f "~" g "}_A"
%format (cataB (f) (g)) = "\cata{" f "~" g "}_B"
%format (anaB (f) (g)) = "\ana{" f "~" g "}_B"
%format Either a b = a "+" b 
%format fmap = "\mathsf{fmap}"
%format NA   = "\textsc{na}"
%format NB   = "\textsc{nb}"
%format inT = "\mathsf{in}"
%format outT = "\mathsf{out}"
%format Null = "1"
%format (Prod (a) (b)) = a >< b
%format fF = "\fun F "
%format e1 = "e_1 "
%format e2 = "e_2 "
%format Dist = "\fun{Dist}"
%format IO = "\fun{IO}"
%format BTree = "\fun{BTree} "
%format LTree = "\mathsf{LTree}"
%format inNat = "\mathsf{in}"
%format (cataNat (g)) = "\cata{" g "}"
%format Nat0 = "\N_0"
%format muB = "\mu "
%format (frac (n)(m)) = "\frac{" n "}{" m "}"
%format (fac (n)) = "{" n "!}"
%format (underbrace (t) (p)) = "\underbrace{" t "}_{" p "}"
%format matrix = "matrix"
%format (bin (n) (k)) = "\Big(\vcenter{\xymatrix@R=1pt{" n "\\" k "}}\Big)"
%format `ominus` = "\mathbin{\ominus}"
%format % = "\mathbin{/}"
%format <-> = "{\,\leftrightarrow\,}"
%format <|> = "{\,\updownarrow\,}"
%format `minusNat`= "\mathbin{-}"
%format ==> = "\Rightarrow"
%format .==>. = "\Rightarrow"
%format .<==>. = "\Leftrightarrow"
%format .==. = "\equiv"
%format .<=. = "\leq"

%---------------------------------------------------------------------------

\title{
       	    Cálculo de Programas
\\
       	Trabalho Prático
\\
       	MiEI+LCC --- 2017/18
}

\author{
       	\dium
\\
       	Universidade do Minho
}


\date\mydate

\makeindex

\begin{document}

\maketitle

\begin{center}\large
\begin{tabular}{ll}
\textbf{Grupo} nr. & (37)
\\\hline
a78679 & Diana Ribeiro Barbosa
\\
a78806 & José Pedro Ferreira de Oliveira	
\\
a77377 & Pedro Henrique Moreira Gomes Fernandes	
\end{tabular}
\end{center}

\section{Preâmbulo}

A disciplina de \CP\ tem como objectivo principal ensinar
a progra\-mação de computadores como uma disciplina científica. Para isso
parte-se de um repertório de \emph{combinadores} que formam uma álgebra da
programação (conjunto de leis universais e seus corolários) e usam-se esses
combinadores para construir programas \emph{composicionalmente}, isto é,
agregando programas já existentes.
  
Na sequência pedagógica dos planos de estudo dos dois cursos que têm esta
disciplina, restringe-se a aplicação deste método à programação funcional
em \Haskell. Assim, 
o presente trabalho prático coloca os alunos perante problemas
concretos que deverão ser implementados em \Haskell.
Há ainda um outro objectivo: o de ensinar a documentar programas e
a produzir textos técnico-científicos de qualidade.

\section{Documentação}
Para cumprir de forma integrada os objectivos enunciados acima vamos recorrer
a uma técnica de programa\-ção dita ``\litp{literária}'' \cite{Kn92}, cujo
princípio base é o seguinte:
\begin{quote}\em
Um programa e a sua documentação devem coincidir.
\end{quote}
Por outras palavras, o código fonte e a documentação de um programa deverão estar no
mesmo ficheiro.

O ficheiro \texttt{cp1718t.pdf} que está a ler é já um exemplo de \litp{programação
literária}: foi gerado a partir do texto fonte \texttt{cp1718t.lhs}\footnote{O
suffixo `lhs' quer dizer \emph{\lhaskell{literate Haskell}}.} que encontrará
no \MaterialPedagogico\ desta disciplina descompactando o ficheiro \texttt{cp1718t.zip}
e executando
\begin{Verbatim}[fontsize=\small]
    $ lhs2TeX cp1718t.lhs > cp1718t.tex
    $ pdflatex cp1718t
\end{Verbatim}
em que \href{https://hackage.haskell.org/package/lhs2tex}{\texttt\LhsToTeX} é
um pre-processador que faz ``pretty printing''
de código Haskell em \Latex\ e que deve desde já instalar executando
\begin{Verbatim}[fontsize=\small]
    $ cabal install lhs2tex
\end{Verbatim}
Por outro lado, o mesmo ficheiro \texttt{cp1718t.lhs} é executável e contém
o ``kit'' básico, escrito em \Haskell, para realizar o trabalho. Basta executar
\begin{Verbatim}[fontsize=\small]
    $ ghci cp1718t.lhs
\end{Verbatim}

%if False
\begin{code}
{-# LANGUAGE GeneralizedNewtypeDeriving, DeriveDataTypeable #-}
import Cp
import List  hiding (fac)
import Nat  
import Probability hiding (cond)
import BMP

import Data.List
import Data.Typeable
import Data.Ratio
import Data.Bifunctor
import Data.Maybe
import Data.Matrix hiding ((!))
import Test.QuickCheck hiding ((><),choose)
import qualified Test.QuickCheck as QuickCheck
import System.Random  hiding (split)
import GHC.IO.Exception
import Codec.Picture.Types
import Graphics.Gloss
import Control.Monad
import Control.Applicative hiding ((<|>))
\end{code}
%endif

\noindent Abra o ficheiro \texttt{cp1718t.lhs} no seu editor de texto preferido
e verifique que assim é: todo o texto que se encontra dentro do ambiente
\begin{quote}\small\tt
\verb!\begin{code}!
\\ ... \\
\verb!\end{code}!
\end{quote}
vai ser seleccionado pelo \GHCi\ para ser executado.

\section{Como realizar o trabalho}
Este trabalho teórico-prático deve ser realizado por grupos de três alunos.
Os detalhes da avaliação (datas para submissão do relatório e sua defesa
oral) são os que forem publicados na \cp{página da disciplina} na \emph{internet}.

Recomenda-se uma abordagem participativa dos membros do grupo
de trabalho por forma a poderem responder às questões que serão colocadas
na \emph{defesa oral} do relatório.

Em que consiste, então, o \emph{relatório} a que se refere o parágrafo anterior?
É a edição do texto que está a ser lido, preenchendo o anexo \ref{sec:resolucao}
com as respostas. O relatório deverá conter ainda a identificação dos membros
do grupo de trabalho, no local respectivo da folha de rosto.

Para gerar o PDF integral do relatório deve-se ainda correr os comando seguintes,
que actualizam a bibliografia (com \Bibtex) e o índice remissivo (com \Makeindex),
\begin{Verbatim}[fontsize=\small]
    $ bibtex cp1718t.aux
    $ makeindex cp1718t.idx
\end{Verbatim}
e recompilar o texto como acima se indicou. Dever-se-á ainda instalar o utilitário
\QuickCheck,
que ajuda a validar programas em \Haskell, a biblioteca
\href{https://hackage.haskell.org/package/JuicyPixels}{JuicyPixels} para processamento
de imagens e a biblioteca \href{http://gloss.ouroborus.net/}{gloss} para geração de gráficos 2D:
\begin{Verbatim}[fontsize=\small]
    $ cabal install QuickCheck JuicyPixels gloss
\end{Verbatim}
Para testar uma propriedade \QuickCheck~|prop|, basta invocá-la com o comando:
\begin{verbatim}
    > quickCheck prop
    +++ OK, passed 100 tests.
\end{verbatim}

\section*{Problema 1}

Segundo uma \href{https://www.jn.pt/economia/interior/compra-diaria-de-bitcoins-iguala-acoes-da-apple-9257302.html}{notícia do Jornal de Notícias}, 
referente ao dia 12 de abril, \emph{``apenas numa hora, foram transacionadas 1.2 mil milhões de dólares em bitcoins. Nas últimas 24 horas, foram transacionados 8,5 mil milhões de dólares, num total de 24 mil milhões de dólares referentes às principais criptomoedas''}.

De facto, é inquestionável que as criptomoedas, e em particular as bitcoin, vieram para ficar.
%
Várias moedas digitais, e em particular as bitcoin, usam a tecnologia de block chain
para guardar e assegurar todas as transações relacionadas com a moeda.
%
Uma \href{https://en.bitcoin.it/wiki/Block_chain}{block chain} é uma coleção de blocos que registam os movimentos da moeda; a sua definição em Haskell é apresentada de seguida.

\begin{spec}
data Blockchain = Bc {bc :: Block}  |  Bcs {bcs :: (Block, Blockchain)} deriving Show
\end{spec}

Cada \href{https://en.bitcoin.it/wiki/Block}{bloco} numa block chain
regista um número (mágico) único, o momento da execução, e uma lista de transações,
tal como no código seguinte:

\begin{spec}
type Block = (MagicNo, (Time, Transactions))
\end{spec}

Cada \href{https://en.bitcoin.it/wiki/Transaction}{transação} 
define a entidade de origem da transferência, o valor a ser transacionado,
e a entidade destino (por esta ordem), tal como se define de seguida.

\begin{spec}
type Transaction = (Entity, (Value, Entity))
type Transactions = [Transaction]
\end{spec}

A partir de uma block chain, é possível calcular o valor que cada entidade
detém, tipicamente designado de ledger:

\begin{spec}
type Ledger = [(Entity, Value)]
\end{spec}

Seguem as restantes definições Haskell para completar o código anterior.
Note que |Time| representa o momento da transação, como o número de \href{https://currentmillis.com}{milisegundos} que passaram desde 1970.

\begin{spec}
type MagicNo = String
type Time = Int  -- em milisegundos
type Entity = String
type Value = Int
\end{spec}

Neste contexto, implemente as seguintes funções:

\begin{enumerate}
\item Defina a função |allTransactions :: Blockchain -> Transactions|, como um catamorfismo, que calcula a lista com todas as transações numa dada block chain.

%if False
\begin{code}
allTransactions :: Blockchain -> Transactions
prop1a :: Blockchain -> Bool
\end{code}
%endif

\begin{propriedade}
    As transações de uma block chain são as mesmas da block chain revertida:
\begin{code}
prop1a = sort . allTransactions .==. sort . allTransactions . reverseChain
\end{code}

Note que a função |sort| é usada apenas para facilitar a comparação das listas.
\end{propriedade}

\item Defina a função |ledger :: Blockchain -> Ledger|, utilizando catamorfismos e/ou anamorfismos, que calcula o ledger (i.e., o valor disponível) de cada entidade numa uma dada block chain.
    Note que as entidades podem ter valores negativos; de facto isso acontecerá para a primeira transação que executarem.

%if False
\begin{code}
ledger :: Blockchain -> Ledger
prop1b :: Blockchain -> Bool
prop1c :: Blockchain -> Bool
\end{code}
%endif

\begin{propriedade}
    O tamanho do ledger é inferior ou igual a duas vezes o tamanho de todas as transações:
\begin{code}
prop1b = length . ledger .<=. (2*) . length . allTransactions
\end{code}
\end{propriedade}

\begin{propriedade}
    O ledger de uma block chain é igual ao ledger da sua inversa:
\begin{code}
prop1c = sort . ledger .==. sort . ledger . reverseChain
\end{code}
\end{propriedade}



\item Defina a função |isValidMagicNr :: Blockchain -> Bool|, utilizando catamorfismos e/ou anamorfismos, que verifica se todos os números mágicos numa dada block chain são únicos.

%if False
\begin{code}
isValidMagicNr :: Blockchain -> Bool
prop1d :: Blockchain -> Bool
prop1e :: Blockchain -> Property
\end{code}
%endif

\begin{propriedade}
    A concatenação de uma block chain com ela mesma nunca é válida em termos de números mágicos:
\begin{code}
prop1d = not . isValidMagicNr . concChain . (split id id)
\end{code}
\end{propriedade}

\begin{propriedade}
    Se uma block chain é válida em termos de números mágicos, então a sua inversa também o é:
\begin{code}
prop1e = isValidMagicNr .==>. isValidMagicNr . reverseChain
\end{code}
\end{propriedade}

\end{enumerate}



\section*{Problema 2}

Uma estrutura de dados frequentemente utilizada para representação e processamento de imagens de forma eficiente são as denominadas \href{https://en.wikipedia.org/wiki/Quadtree}{quadtrees}.
Uma \emph{quadtree} é uma árvore quaternária em que cada nodo tem quatro sub-árvores e cada folha representa um valor bi-dimensional.
\begin{spec}
data QTree a = Cell a Int Int | Block (QTree a) (QTree a) (QTree a) (QTree a)
  deriving (Eq,Show)
\end{spec}

\begin{figure}
\begin{subfigure}{0.3\textwidth}
\begin{verbatim}
( 0 0 0 0 0 0 0 0 )
( 0 0 0 0 0 0 0 0 )
( 0 0 0 0 1 1 1 0 )
( 0 0 0 0 1 1 0 0 )
( 1 1 1 1 1 1 0 0 )
( 1 1 1 1 1 1 0 0 )
( 1 1 1 1 0 0 0 0 )
( 1 1 1 1 0 0 0 1 )
\end{verbatim}
\caption{Matriz de exemplo |bm|.}
\label{fig:bm}
\end{subfigure}
\begin{subfigure}{0.7\textwidth}
\begin{verbatim}
Block
 (Cell 0 4 4) (Block
  (Cell 0 2 2) (Cell 0 2 2) (Cell 1 2 2) (Block
   (Cell 1 1 1) (Cell 0 1 1) (Cell 0 1 1) (Cell 0 1 1)))
 (Cell 1 4 4)
 (Block
  (Cell 1 2 2) (Cell 0 2 2) (Cell 0 2 2) (Block
   (Cell 0 1 1) (Cell 0 1 1) (Cell 0 1 1) (Cell 1 1 1)))
\end{verbatim}
\caption{Quadtree de exemplo |qt|.}
\label{fig:qt}
\end{subfigure}
\caption{Exemplos de representações de bitmaps.}
\end{figure}

Uma imagem monocromática em formato bitmap pode ser representada como uma
matriz de bits\footnote{Cf.\ módulo \href{https://hackage.haskell.org/package/matrix}{|Data.Matrix|}.},
tal como se exemplifica na Figura~\ref{fig:bm}.

O anamorfismo |bm2qt| converte um bitmap em forma matricial na sua codificação eficiente em quadtrees, e o catamorfismo |qt2bm| executa a operação inversa:

\adjustbox{valign=t}{\begin{minipage}{.5\textwidth} %
\begingroup
\leftskip-1.5em
\rightskip\leftskip
\begin{code}
bm2qt :: (Eq a) => Matrix a -> QTree a
bm2qt = anaQTree f where
    f m = if one then i1 u else i2 (a,(b,(c,d)))
     where  x = (nub . toList) m
            u = (head x,(ncols m,nrows m))
            one = (ncols m == 1 || nrows m == 1 || length x == 1)
            (a,b,c,d) = splitBlocks (nrows m `div` 2) (ncols m `div` 2) m    
\end{code}
\endgroup
\end{minipage}} %
\adjustbox{valign=t}{\begin{minipage}{.5\textwidth} %
\begingroup
\leftskip-2em
\rightskip\leftskip
\begin{code}
qt2bm :: (Eq a) => QTree a -> Matrix a
qt2bm = cataQTree (either f g) where
    f (k,(i,j)) = matrix j i (const k)
    g (a,(b,(c,d))) = (a <|> b) <-> (c <|> d)
\end{code}
\endgroup
\end{minipage}}

O algoritmo |bm2qt| particiona recursivamente a imagem em $4$ blocos e termina produzindo folhas para matrizes unitárias ou quando todos os píxeis de um sub-bloco têm a mesma côr.
Para a matriz |bm| de exemplo, a quadtree correspondente |qt = bm2qt bm| é ilustrada na Figura~\ref{fig:qt}.

\begin{figure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/person.png}
\caption{Bitmap de exemplo.}
\label{fig:person}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[height=0.2\linewidth]{cp1718t_media/person90.png}
\caption{Rotação.}
\label{fig:person90}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.4\linewidth]{cp1718t_media/personx2.png}
\caption{Redimensionamento.}
\label{fig:personx2}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/personinv.png}
\caption{Inversão de cores.}
\label{fig:personinv}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/person1.png}
\caption{Compresão de $1$ nível.}
\label{fig:person1}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/person2.png}
\caption{Compresão de $2$ níveis.}
\label{fig:person2}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/person3.png}
\caption{Compresão de $3$ níveis.}
\label{fig:person3}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/person4.png}
\caption{Compresão de $4$ níveis.}
\label{fig:person4}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/personOut1.png}
\caption{Bitmap de contorno.}
\label{fig:personOut1}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/personOut2.png}
\caption{Bitmap com contorno.}
\label{fig:personOut2}
\end{subfigure}
%
\caption{Manipulação de uma figura bitmap utilizando quadtrees.}
\end{figure}

Imagens a cores podem ser representadas como matrizes de píxeis segundo o código de cores \href{https://en.wikipedia.org/wiki/RGBA_color_space}{RGBA}, codificado no tipo \href{https://hackage.haskell.org/package/JuicyPixels-3.2.9.5/docs/Codec-Picture.html#t:PixelRGBA8}{|PixelRGBA8|} em que cada pixel é um quádruplo de valores inteiros $(red,green,blue,alpha)$ contidos entre $0$ e $255$.
Atente em alguns exemplos de cores:
\begin{spec}
whitePx  = PixelRGBA8 255 255 255 255
blackPx  = PixelRGBA8 0 0 0 255
redPx    = PixelRGBA8 255 0 0 255
\end{spec}

O módulo |BMP|, disponibilizado juntamente com o enunciado, fornece funções para processar ficheiros de imagem bitmap como matrizes:
\begin{spec}
    readBMP :: FilePath -> IO (Matrix PixelRGBA8)
    writeBMP :: FilePath -> Matrix PixelRGBA8 -> IO ()
\end{spec}

Teste, por exemplo, no |GHCi|, carregar a Figura~\ref{fig:person}:
\begin{verbatim}
    > readBMP "cp1718t_media/person.bmp"
\end{verbatim} 

Esta questão aborda operações de processamento de imagens utilizando quadtrees:
\begin{enumerate}
    \item Defina as funções |rotateQTree :: QTree a -> QTree a|, |scaleQTree :: Int -> QTree a -> QTree a| e |invertQTree :: QTree a -> QTree a|, como catamorfismos e/ou anamorfismos, que rodam\footnote{Segundo um ângulo de $90º$ no sentido dos ponteiros do relógio.}, redimensionam \footnote{Multiplicando o seu tamanho pelo valor recebido.} e invertem as cores de uma quadtree\footnote{Um pixel pode ser invertido calculando $255 - c$ para cada componente $c$ de cor RGB, exceptuando o componente alpha.}, respectivamente.
    Tente produzir imagens similares às Figuras~\ref{fig:person90}, \ref{fig:personx2} e \ref{fig:personinv}:
%if False
\begin{code}
rotateQTree :: QTree a -> QTree a
scaleQTree :: Int -> QTree a -> QTree a
invertQTree :: QTree PixelRGBA8 -> QTree PixelRGBA8
prop2c :: QTree Int -> Bool
prop2d :: Nat -> QTree Int -> Bool
prop2e :: QTree PixelRGBA8 -> Bool
\end{code}
%endif
        \begin{verbatim}
    > rotateBMP  "cp1718t_media/person.bmp" "person90.bmp"
    > scaleBMP 2 "cp1718t_media/person.bmp" "personx2.bmp"
    > invertBMP  "cp1718t_media/person.bmp" "personinv.bmp"
        \end{verbatim}

\begin{propriedade}
        Rodar uma quadtree é equivalente a rodar a matriz correspondente:
\begin{code}
prop2c = rotateMatrix . qt2bm .==. qt2bm . rotateQTree
\end{code}
    \end{propriedade}
\begin{propriedade}
    Redimensionar uma imagem altera o seu tamanho na mesma proporção:
\begin{code}
prop2d (Nat s) = sizeQTree . scaleQTree s .==. ((s*) >< (s*)) . sizeQTree
\end{code}
\end{propriedade}
\begin{propriedade}
    Inverter as cores de uma quadtree preserva a sua estrutura:
\begin{code}
prop2e = shapeQTree . invertQTree .==. shapeQTree
\end{code}
\end{propriedade}
    
    \item Defina a função |compressQTree :: Int -> QTree a -> QTree a|, utilizando catamorfismos e/ou anamorfismos, que comprime uma quadtree cortando folhas da árvore para reduzir a sua profundidade num dado número de níveis.
    Tente produzir imagens similares (mas não necessariamente iguais) às Figuras~\ref{fig:person1}, \ref{fig:person2}, \ref{fig:person3} e \ref{fig:person4}:
%if False
\begin{code}
compressQTree :: Int -> QTree a -> QTree a
prop2f :: Nat -> QTree Int -> Bool
\end{code}
%endif
        \begin{verbatim}
    > compressBMP 1 "cp1718t_media/person.bmp" "person1.bmp"
    > compressBMP 2 "cp1718t_media/person.bmp" "person2.bmp"
    > compressBMP 3 "cp1718t_media/person.bmp" "person3.bmp"
    > compressBMP 4 "cp1718t_media/person.bmp" "person4.bmp"
        \end{verbatim}
    \begin{propriedade}
        A quadtree comprimida tem profundidade igual à da quadtree original menos a taxa de compressão:
\begin{code}
prop2f (Nat n) = depthQTree . compressQTree n .==. (`minusNat` n) . depthQTree
\end{code}
    \end{propriedade}
    

    \item Defina a função |outlineQTree :: (a -> Bool) -> QTree a -> Matrix Bool|, utilizando catamorfismos e/ou anamorfismos, que recebe uma função que determina quais os píxeis de fundo e converte uma quadtree numa matriz monocromática, de forma a desenhar o contorno de uma \href{https://en.wikipedia.org/wiki/Polygon_mesh}{malha poligonal} contida na imagem.
        Tente produzir imagens similares (mas não necessariamente iguais) às Figuras~\ref{fig:personOut1} e \ref{fig:personOut2}:
%if False
\begin{code}
outlineQTree :: (a -> Bool) -> QTree a -> Matrix Bool
\end{code}
%endif
            \begin{verbatim}
    > outlineBMP    "cp1718t_media/person.bmp" "personOut1.bmp"
    > addOutlineBMP "cp1718t_media/person.bmp" "personOut2.bmp"
            \end{verbatim}
%if False
\begin{code}
prop2g :: QTree Int -> Bool
\end{code}
%endif
    \begin{propriedade}
        A matriz de contorno tem dimensões iguais às da quadtree:
\begin{code}
prop2g = sizeQTree .==. sizeMatrix . outlineQTree (<0)
\end{code}
    \end{propriedade}
    \begin{teste}
        Contorno da quadtree de exemplo |qt|:
\begin{code}
teste2a = outlineQTree (==0) qt == qtOut 
\end{code}
    \end{teste}

\end{enumerate}

\section*{Problema 3}
O cálculo das combinações de |n| |k|-a-|k|,
\begin{eqnarray}
	|bin n k = frac (fac n)(fac k * (fac ((n-k))))|
	\label{eq:bin} 
\end{eqnarray}
envolve três factoriais. Recorrendo à \material{lei de recursividade múltipla} do cálculo
de programas, é possível escrever o mesmo programa como um simples ciclo-for
onde se fazem apenas multiplicações e somas. Para isso, começa-se por estruturar
a definição dada da forma seguinte,
\begin{eqnarray*}
	|bin n k = h k (n - k)|
\end{eqnarray*}
onde
\begin{eqnarray*}
\start
       |h k d = frac (f k d) (g d)|
\more
       |f k d = frac (fac ((d+k))) (fac k)|
\more
       |g d = fac d| 
\end{eqnarray*}
assumindo-se |d = n-k >=0|.
%
É fácil de ver que |f k| e |g| se desdobram em 4 funções mutuamente recursivas, a saber
\begin{spec}
f k 0 = 1
f k (d+1) = underbrace ((d+k+1)) (l k d) * f k d

l k 0 = k+1
l k (d+1) = l k d + 1
\end{spec}
e 
\begin{spec}
g 0 = 1
g (d+1) = underbrace ((d+1)) (s d) * g d

s 0 = 1
s (d+1) = s n + 1
\end{spec}
A partir daqui alguém derivou a seguinte implementação:
\begin{code}
bin n k = h k (n-k) where  h k n = let (a,_,b,_) = for loop (base k) n in a % b
\end{code}
Aplicando a lei da recursividade múltipla para |split (f k) (l k)| e para
|split g s| e combinando os resultados com a \material{lei de banana-split},
derive as funções |base k| e |loop| que são usadas como auxiliares acima.

\begin{propriedade}
Verificação que |bin n k| coincide com a sua especificação (\ref{eq:bin}):
\begin{code}
prop3 (NonNegative n) (NonNegative k) = k <= n ==> (bin n k) == (fac n) % (fac k * (fac ((n-k))))
\end{code}
\end{propriedade}

\section*{Problema 4}

\begin{figure}
\begin{center}
\includegraphics[width=0.7\textwidth]{cp1718t_media/pythagoras-tree1.png}
\end{center}
\caption{Passos de construção de uma árvore de Pitágoras de ordem $3$.}
\label{fig:pitagoras1}
\end{figure}

\href{https://en.wikipedia.org/wiki/Fractal}{Fractais} são formas geométricas que podem ser construídas recursivamente de acordo com um conjunto de equações matemáticas.
Um exemplo clássico de um fractal são as \href{https://en.wikipedia.org/wiki/Pythagoras_tree_(fractal)}{árvores de Pitágoras}.
A construção de uma árvore de Pitágoras começa com um quadrado, ao qual se unem dois quadrados redimensionados pela escala $\sqrt{2}/2$, de forma a que os cantos dos $3$ quadrados coincidam e formem um triângulo rectângulo isósceles.
Este procedimento é repetido recursivamente de acordo com uma dada ordem, definida como um número natural (Figura~\ref{fig:pitagoras1}).

Uma árvore de Pitágoras pode ser codificada em Haskell como uma full tree contendo quadrados nos nodos e nas folhas, sendo um quadrado definido simplesmente pelo tamanho do seu lado:
\begin{spec}
data FTree a b = Unit b | Comp a (FTree a b) (FTree a b) deriving (Eq,Show)
type PTree = FTree Square Square
type Square = Float
\end{spec}

\begin{enumerate}
    \item Defina a função |generatePTree :: Int -> PTree|, como um anamorfismo, que gera uma árvore de Pitágoras para uma dada ordem.

%if False
\begin{code}
generatePTree :: Int -> PTree
prop4a :: SmallNat -> Bool
prop4b :: SmallNat -> Bool
\end{code}
%endif

\begin{propriedade}
    Uma árvore de Pitágoras tem profundidade igual à sua ordem:
\begin{code}
prop4a (SmallNat n) = (depthFTree . generatePTree) n == n
\end{code}
\end{propriedade}
\begin{propriedade}
    Uma árvore de Pitágoras está sempre balanceada:
\begin{code}
prop4b (SmallNat n) = (isBalancedFTree . generatePTree) n
\end{code}
\end{propriedade}

\item Defina a função |drawPTree :: PTree -> [Picture]|, utilizando catamorfismos e/ou anamorfismos, que anima incrementalmente os passos de construção de uma árvore de Pitágoras recorrendo à biblioteca \href{https://hackage.haskell.org/package/gloss}{gloss}.
    Anime a sua solução:
\begin{verbatim}
    > animatePTree 3
\end{verbatim}

%if False
\begin{code}
drawPTree :: PTree -> [Picture]

window = (InWindow "CP" (800,800) (0,0))
square s = rectangleSolid s s

animatePTree n = animate window white draw
    where
    pics = drawPTree (generatePTree n)
    draw t = pics !! (floor (t/2))
\end{code}
%endif
    
\end{enumerate}

\section*{Problema 5}

Uma das áreas em maior expansão no campo da informática é a análise de dados
e  \href{https://www.mathworks.com/discovery/machine-learning.html}{machine learning}. Esta questão aborda um \emph{mónade} que ajuda
a fazer, de forma simples, as operações básicas dessas técnicas. Esse mónade
é conhecido por \emph{bag}, \emph{saco} ou \emph{multi-conjunto}, permitindo
que os elementos de um conjunto tenham multiplicidades associadas. Por exemplo,
seja
\begin{code}
data Marble = Red | Pink | Green | Blue | White deriving (Read,Show,Eq,Ord)
\end{code}
um tipo dado.\footnote{``Marble" traduz para ``berlinde" em português.}
A lista |[ Pink,Green,Red,Blue,Green,Red,Green,Pink,Blue,White ]| tem elementos
repetidos. Assumindo que a ordem não é importante, essa lista corresponde ao saco
\begin{quote}\small
\begin{verbatim}
{ Red |-> 2 , Pink |-> 2 , Green |-> 3 , Blue |-> 2 , White |-> 1 }
\end{verbatim}
\end{quote}
que habita o tipo genérico dos ``bags":
\begin{code}
data Bag a = B [(a,Int)] deriving (Ord)
\end{code}
O mónade que vamos construir sobre este tipo de dados faz a gestão automática das multiciplidades.
Por exemplo, seja dada a função que dá o peso de cada berlinde em gramas:
\begin{code}
marbleWeight :: Marble -> Int
marbleWeight Red   = 3
marbleWeight Pink  = 2
marbleWeight Green = 3
marbleWeight Blue  = 6
marbleWeight White = 2
\end{code}
Então, se quisermos saber quantos \emph{berlindes} temos, de cada \emph{peso}, não teremos que fazer contas:
basta calcular
\begin{code}
marbleWeights = fmap marbleWeight bagOfMarbles
\end{code}
onde |bagOfMarbles| é o saco de berlindes referido acima, obtendo-se:
\begin{quote}\small
	\verb!{ 2 |-> 3 , 3 |-> 5 , 6 |-> 2 }!.
\end{quote}
%
Mais ainda, se quisermos saber o total de berlindes em |bagOfMarbles| basta
calcular |fmap (!) bagOfMarbles| obtendo-se \verb!{ () |-> 10 }!; isto é,
o saco tem |10| berlindes no total.


Finalmente, se quisermos saber a probabilidade da cor de um berlinde que tiremos do saco, basta converter
o referido saco numa distribuição correndo:
\begin{code}
marblesDist = dist bagOfMarbles
\end{code}
obtendo-se a distribuição (graças ao módulo \Probability):
\begin{quote}\small
\begin{verbatim}
Green  30.0%
  Red  20.0%
 Pink  20.0%
 Blue  20.0%
White  10.0%
\end{verbatim}
\end{quote}
cf.\ Figura \ref{fig:dist}.

\begin{figure}
\begin{center}
\includegraphics[width=0.4\textwidth]{cp1718t_media/marblesDist-mod5.png}
\end{center}
\caption{Distribuição de berlindes num saco.}
\label{fig:dist}
\end{figure}

Partindo da seguinte declaração de |Bag| como um functor e como um mónade,
\begin{code}
instance Functor Bag where
    fmap f = B. map (f><id) . unB

instance Monad Bag where
   x >>= f = (muB.fmap f) x where
   return = singletonbag
\end{code}
\begin{enumerate}
\item	
Defina a função |muB| (multiplicação do mónade |Bag|) e a função auxiliar
|singletonbag|.
\item	Verifique-as com os seguintes testes unitários:
%if False
\begin{code}
muB :: Bag (Bag a) -> Bag a
\end{code}
%endif
\begin{teste}
Lei |muB.return=id|:
\begin{code}
test5a = bagOfMarbles == muB (return bagOfMarbles)
\end{code}
\end{teste}
\begin{teste}
Lei |muB.muB = muB . fmap muB|:
\begin{code}
test5b = (muB . muB) b3 == (muB .fmap muB) b3
\end{code}
\vskip 1em
onde |b3| é um saco dado em anexo.
\end{teste}
\end{enumerate}

%----------------- Bibliografia (exige bibtex) --------------------------------%

\bibliographystyle{plain}
\bibliography{cp1718t}

%----------------- Programa, bibliotecas e código auxiliar --------------------%

\newpage

\part*{Anexos}

\appendix

\section{Mónade para probabilidades e estatística}\label{sec:Dist}
%format B = "\mathit B"
%format C = "\mathit C"
Mónades são functores com propriedades adicionais que nos permitem obter
efeitos especiais em progra\-mação. Por exemplo, a biblioteca \Probability\
oferece um mónade para abordar problemas de probabilidades. Nesta biblioteca,
o conceito de distribuição estatística é captado pelo tipo
\begin{eqnarray}
	|newtype Dist a = D {unD :: [(a, ProbRep)]}|
	\label{eq:Dist}
\end{eqnarray}
em que |ProbRep| é um real de |0| a |1|, equivalente a uma escala de |0| a |100%|.

Cada par |(a,p)| numa distribuição |d::Dist a| indica que a probabilidade
de |a| é |p|, devendo ser garantida a propriedade de  que todas as probabilidades
de |d| somam |100%|.
Por exemplo, a seguinte distribuição de classificações por escalões de $A$ a $E$,
\[
\begin{array}{ll}
A & \rule{2mm}{3pt}\ 2\%\\
B & \rule{12mm}{3pt}\ 12\%\\
C & \rule{29mm}{3pt}\ 29\%\\
D & \rule{35mm}{3pt}\ 35\%\\
E & \rule{22mm}{3pt}\ 22\%\\
\end{array}
\]
será representada pela distribuição
\begin{code}
d1 :: Dist Char
d1 = D [('A',0.02),('B',0.12),('C',0.29),('D',0.35),('E',0.22)]
\end{code}
que o \GHCi\ mostrará assim:
\begin{Verbatim}[fontsize=\small]
'D'  35.0%
'C'  29.0%
'E'  22.0%
'B'  12.0%
'A'   2.0%
\end{Verbatim}

Este mónade é adequado à resolução de problemas de \emph{probabilidades e
estatística} usando programação funcional, de forma elegante e como caso
particular de programação monádica.

\section{Definições auxiliares}\label{sec:helper_functions}
Funções para mostrar \emph{bags}:
\begin{code}
instance (Show a, Ord a, Eq a) => Show (Bag a) where
    show = showbag . consol . unB  where
       showbag = concat .
                 (++ [" }"]) .  ("{ ":) . 
                 (intersperse " , ") .
                 sort . 
                 (map f) where f(a,b) = (show a) ++ " |-> " ++ (show b)
unB (B x) = x
\end{code}
Igualdade de \emph{bags}:
\begin{code}
instance (Eq a) => Eq (Bag a) where
   b == b' = (unB b) `lequal` (unB b')
           where lequal a b = isempty (a `ominus` b)
                 ominus a b = a ++ neg b
                 neg x = [(k,-i) | (k,i) <- x]
\end{code}
Ainda sobre o mónade |Bag|:
\begin{code}
instance Applicative Bag where
    pure = return
    (<*>) = aap
\end{code}
O exemplo do texto:
\begin{code}
bagOfMarbles = B [(Pink,2),(Green,3),(Red,2),(Blue,2),(White,1)]
\end{code}
Um valor para teste (bags de bags de bags):
\begin{code}
b3 :: Bag (Bag (Bag Marble))
b3= B [(B [(B[(Pink,2),(Green,3),(Red,2),(Blue,2),(White,1)],5)
      ,(B [(Pink,1),(Green,2),(Red,1),(Blue,1)],2)],2)]
\end{code}
Outras funções auxiliares:
\begin{code}
a |-> b = (a,b)

consol :: (Eq b) => [(b, Int)] -> [(b, Int)]
consol = filter nzero . map (id >< sum) . col where nzero(_,x)=x/=0

isempty :: Eq a => [(a, Int)] -> Bool
isempty = all (==0) . map snd . consol

col x = nub [ k |-> [ d' | (k',d') <- x , k'==k ] | (k,d) <- x ]

consolidate :: Eq a => Bag a -> Bag a
consolidate = B . consol . unB

\end{code}

%----------------- Soluções dos alunos -----------------------------------------%

\section{Soluções dos alunos}\label{sec:resolucao}
Os alunos devem colocar neste anexo as suas soluções aos exercícios
propostos, de acordo com o ``layout'' que se fornece. Não podem ser
alterados os nomes ou tipos das funções dadas, mas pode ser adicionado texto e / ou 
outras funções auxiliares que sejam necessárias.

\subsection*{Problema 1}

De maneira a iniciar a resolução do problema foram definidas as seguintes funções:

\begin{code}
inBlockchain = either Bc Bcs
\end{code}



Através do isomorfismo \textbf{in.out = id} foi possivel obter o out para Blockchain de acordo com a prova seguinte:

\begin{eqnarray*}
\start
    |out . in = id|
%
\just\equiv{ Definição de in para Blockchain }
%
    |out . (either Bc Bcs) = id|
%
\just\equiv{ Lei 20 Fusão-+ }
%
    |either (out . Bc) (out . Bcs) = id|
%
\just\equiv{ Lei 27 Eq-+ }
%
    |lcbr(
		out . Bc = i1
	)(
		out . Bcs = i2
	)|
%
\just\equiv{ Lei 73, Lei 74 }
%
    |lcbr(
		out (Bc a) = i1 a
	)(
		out (Bcs (a, b)) = i2 (a, b)
	)|
\qed
\end{eqnarray*}

\begin{code}
outBlockchain (Bc a) = i1 a
outBlockchain (Bcs (a,b)) = i2 (a,b) 
\end{code}

O diagrama do catamorfismo de Blockchain apresenta-se de seguida, e através deste foi possivel deduzir as restantes funções.

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Blockchain|
           \ar[d]_-{|k = cataA(g)|}
           \ar[r]^-{out}
&
    |Block + Block >< Blockchain|
           \ar[d]^-{|id + id >< k|}
\\
    A
&
    |Block + Block >< A|
           \ar[l]^-{g}
}
\end{eqnarray*}

\begin{code}

recBlockchain f = id -|- (id >< f)    
cataBlockchain g = g . (recBlockchain (cataBlockchain g)) . outBlockchain      
anaBlockchain g = inBlockchain . (recBlockchain(anaBlockchain g)) . g
hyloBlockchain f g = cataBlockchain f . anaBlockchain g

\end{code}

De seguida são apresentadas as soluções obtidas pelo grupo para cada uma das alíneas do problema 1.

\subsection{allTransactions}

\quad A função \textbf{allTransactions} calcula a lista de todas as Transactions presentes numa Blockchain, deste modo foi definido um catamorfismo
de Blockchain que para o caso base de um Block - (MagicNo,(Time,Transactions)) utiliza a função |p2| para extrair a lista de Transactions.
\quad Para o caso de um Blockchain - (Block,Blockchain) utiliza de novo a função |p2| para extrair a lista de Transactions do Block e a função \emph{conc}
para concatenar a lista de transações ao resultado recursivo do resto da Blockchain.    \newline
\quad A solução é apresentada a seguir.


\begin{code}

allTransactions = cataBlockchain (either (p2 . p2) (conc . ((p2.p2) >< id)))

\end{code}


\subsection{Ledger}

A função \emph{Ledger} calcula o valor que cada entidade detém numa Blockchain, para defini-la utilizamos três catamorfismos e um conjunto
de funções auxiliares que serão descritas mais abaixo. O processo é seguinte:
\begin{itemize}
\item Obter a lista de transações através do catamorfismo \textbf{allTransactions}
\item Obter um par com a lista das entidades (obtida através da função \textbf{getEntities}) e a lista das transações
\item Aplicar um catamorfismo \textbf{cataSaldo} à lista das transações, obtendo um par da lista das entidades e do catamorfismo aplicado às transações
\item Obter um par com a lista das entidades e uma lista com o saldo de cada entidade
\item Obter uma lista de pares (Entidade,Saldo).
\end{itemize}
A solução é apresentada de seguida:

\begin{code}
ledger = uncurry zip . (split p1 (uncurry map . swap)) . (id >< cataSaldo) . (split getEntities id) . allTransactions
\end{code}



O catamorfismo de listas \textbf{cataSaldo} dada uma lista de transações e uma entidade calcula o saldo dessa entidade.


\begin{code}

cataSaldo :: [Transaction] -> String -> Int
cataSaldo transactions entity = (cataList (either (const 0) (addInt . ((getSaldo entity) >< id)) )) transactions

\end{code}


\begin{code}
getSaldo :: String -> Transaction -> Int
getSaldo e (a,(b,c)) | e == a = -b
                     | e == c = b
                     | otherwise = 0

\end{code}

Foi utilizada a função addInt porque a add pré-definida trabalha com Integer

\begin{code}

addInt :: (Int,Int) -> Int
addInt (a,b) = a + b

\end{code}

O catamorfismo de listas \textbf{cataEntities} que dá a lista de todas as entidades presentes em todas as transações

\begin{code}


cataEntities = cataList ( either nil (conc . ((pairToList . split p1 (p2 . p2)) >< id)) )

\end{code}

Esta função elimina as entidades repetidas da lista produzida pelo catamorfismo anterior através da função \textbf{rmDuplicates}.

\begin{code}
getEntities :: (Ord a) => [(a,(b,a))] -> [a]
getEntities = rmDuplicates . cataEntities

rmDuplicates :: (Ord a) => [a] -> [a]
rmDuplicates = map head . group . sort

pairToList :: (a,a) -> [a]
pairToList (x,y) = [x,y]


\end{code}

\subsection{isValidMagicNr}

\quad A função \textbf{isValidMagicNr} verifica se todos os números mágicos numa blockchain são únicos. Para definir esta função utilizamos
um catamorfismo \textbf{cataNrMagico} que para o caso base de um Block, aplica um |split (p1) (nil)| de maneira a obter o número mágico desse Block e aplica 
a função nil ao lado direito do par para obter uma lista vazia, o resultado de |p1| (número mágico) vai ser posteriormente inserido na lista através da função \emph{cons}.
\quad Para o caso de um Blockchain, é usada novamente a função \emph{cons} para inserir o número mágico à cabeça da lista resultado recursivo para o 
resto da Blockchain. Neste momento temos uma lista com todos os números mágicos da Blockchain, é altura de verificar se existem alguns repetidos
utilizamos para isso uma função \textbf{checkDuplicates} que dada uma lista verifica se existem ou não elementos repetidos.
\quad A solução é apresentada de seguida.

\begin{code}

isValidMagicNr = checkDuplicates . cataNrMagico

-- catamorfismo que transforma um blockchain 
cataNrMagico :: Blockchain -> [String]
cataNrMagico = cataBlockchain (either (cons . (split p1 nil)) (cons . (p1 >< id)))

-- verifica os se existem número mágicos repetidos
checkDuplicates :: (Ord a) => [a] -> Bool
checkDuplicates x = ((rmDuplicates x) == x)

\end{code}





\subsection*{Problema 2}

\quad De maneira a iniciar a resolução do problema 2, foi necessário primeiro definir funções que nos permitam criar catamorfismos e anamorfismos
para a estrutura de dados do problema em causa. 

\begin{code}

pairToCell (a,(b,c)) = Cell a b c
pairToBlock (a,(b,(c,d))) = Block a b c d

\end{code}


\begin{code}

inQTree = either pairToCell pairToBlock

\end{code}

Através do isomorfismo \textbf{in.out = id} foi possivel obter o out para Blockchain de acordo com a prova seguinte:

\begin{eqnarray*}
\start
    |outQTree . inQTree = id|
%
\just\equiv{ Definição de inQTree }
%
    |outQTree . (either (toCell) (toBlock)) = id|
%
\just\equiv{ Lei 20 Fusão-+ }
%
    |either (outQTree . toCell) (outQTree . toBlock) = id|
%
\just\equiv{ Lei 17 Universal-+ }
%
    |lcbr(
		id . i1 = outQTree . toCell
	)(
		id . i2 = outQTree . toBlock
	)|
%
\just\equiv{ Lei  73, Lei 74 }
%
    |lcbr(
		outQTree toCell (a, (b, c)) = i1 (a, (b, c))
	)(
		outQTree toBlock (a, (b, (c, d))) = i2 (a, (b, (c, d)))
	)|
\qed
\end{eqnarray*}

\begin{code}
outQTree (Cell a b c) = i1 (a,(b,c))
outQTree (Block a b c d) = i2 (a,(b,(c,d)))
\end{code}

O diagrama do catamorfismo de QTree apresenta-se de seguida, e através deste foi possivel deduzir as restantes funções.

\begin{eqnarray*}

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |QTree A|
           \ar[d]_-{|k = cataQTree g|}
           \ar[r]^-{out}
&
    |(A,(Int,Int)) + (QTree A, (QTree A, (QTree A, QTree A)))|
           \ar[d]^-{recQTree (k)}
\\
    QTree A
&
    |(A,(Int,Int)) + (QTree A, (QTree A, (QTree A, QTree A)))|
           \ar[l]^-{g}
}
\end{eqnarray*}

\end{eqnarray*}

\begin{code}
baseQTree g f = (g >< id) -|- (f >< (f >< (f >< f)))
recQTree f = baseQTree id f
cataQTree g = g . (recQTree (cataQTree g)) . outQTree
anaQTree g = inQTree . (recQTree (anaQTree g)) . g 
hyloQTree g1 g2 = cataQTree g1 . anaQTree g2

instance Functor QTree where
    fmap f = cataQTree (inQTree . (baseQTree f id))

\end{code}

\subsection{rotateQTree}

\quad Esta função roda 90 graus uma QTree, para tal é necessário alterar a posição dos blocos e o formato das células. 
Foi feito um catamorfismo de QTree, em que no caso base de uma Cell é usada a função \textbf{rotateCell} que roda 90 graus uma Cell, ou seja,
troca o elementos do par que define a dimensão da matriz.
\par Para o caso de um Block troca-se a posição das QTree de maneira a ser feita uma rotação de 90 graus, através da função \textbf{rotateBlock}, 
A solução encontrada está apresentada de seguida.

\begin{code}
rotateQTree = cataQTree (either rotateCell rotateBlock)
rotateCell (a,(b,c)) = Cell a c b
rotateBlock (a, (b, (c,d))) = Block c a d b
\end{code}

Assumindo que A, B, C e D são QTree que pertencem a um bloco a rotação de 90 graus leva a um reposionamento das QTree de acordo com o diagrama seguinte.


\[
\begin{bmatrix}
    A & B \\
    C & D \\  
\end{bmatrix}
=
\begin{bmatrix}
    C & A \\
    D & B \\
\end{bmatrix}
\]


\subsection{scaleQTree}

A função scaleQTree recalcula a dimensão de uma QTree de acordo com um fator, para tal é necessário multiplicar os elementos que definem o tamanho de cada célula por esse fator.
A solução é apresentada de seguida.

\begin{code}

scaleQTree a = cataQTree (either (scaleCell a) (pairToBlock))
scaleCell mult (x,(y,z)) = Cell x (mult * y) (mult * z)

\end{code}

O seguinte diagrama demonstra o catamorfismo de QTree utilizado, em que g = |either scaleCell pairToBlock|
\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Int >< QTree A|
           \ar[d]_-{|k = cataQTree g|}
           \ar[r]^-{out}
&
    |Int ><  (A, (Int, Int)) + (QTree A, (QTree A, (QTree A, QTree A)))|
           \ar[d]^{|recQTree (k)|}
\\
    |QTree A|
&
    |Int >< (A, (Int, Int)) + (QTree A, (QTree A, (QTree A, QTree A)))|
           \ar[l]^-{|g|}
}
\end{eqnarray*}



\subsection{invertQTree}

A função invertQTree inverte as cores de uma QTree


\begin{code}
invertQTree = cataQTree (either (invertCell) (pairToBlock))
invertCell ((PixelRGBA8 r g b a),(n,m)) = Cell (PixelRGBA8 (255-r) (255-g) (255-b) a) n m
\end{code}

O seguinte diagrama demonstra o catamorfismo de QTree utilizado, em que g = |either invertCell pairToBlock|.

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |QTree A|
           \ar[d]_-{|k = cataQTree g|}
           \ar[r]^-{out}
&
    |(A,(Int,Int)) + (QTree A, (QTree A, (QTree A, QTree A)))|
           \ar[d]^-{recQTree (k)}
\\
    QTree A
&
    |(A,(Int,Int)) + (QTree A, (QTree A, (QTree A, QTree A)))|
           \ar[l]^-{g}
}
\end{eqnarray*}


\subsection{compressQTree}

A função \textbf{compressQTree} corta as folhas da árvore de maneira a reduzir a sua profundidade dado um determinado nivel, para a definição desta
função foi feito um anamorfismo de QTree.
A solução obtida é apresentada a seguir.

\begin{code}
compressQTree a b = (anaQTree geneForCompression) (a, b)

geneForCompression (x, (Cell a b c)) = i1 (a, (b, c))
geneForCompression (x, block@(Block a b c d))
  | x >= (depthQTree block) = i1 ((attributeValue block), ((fst (sizeQTree block)), (snd (sizeQTree block))))
  | otherwise = i2 (((x, a), ((x, b), ((x, c), (x, d)))))
  
\end{code}

A função \textbf{attributeValue} é usada para obter um valor qualquer de uma QTree, foi criada para contornar a necessidade de atribuir um valor
a uma Cell que foi criada a partir de um Block.

\begin{code}
attributeValue :: QTree a -> a
attributeValue (Cell x y z) = x
attributeValue (Block x y z k) = attributeValue x
\end{code}

O gene do anamorfismo é explicado a seguir:

\begin{itemize}
  \item Caso receba uma Cell, coloca-a do lado esquerdo usando |i1|, pois chegamos a uma folha da árvore que não deve ser cortada.
  \item Caso receba um Block, e a sua profundidade é menor ou igual ao nível de compressão
  dado como argumento, elimina esse bloco convertendo-o para uma Cell e por consequência elimina os seus filhos.
  De seguida, executa aplica |i1| para colocar a nova célula do lado esquerdo do par.
  \item Caso receba um Block, e a sua profundidade é maior que o nível de compressão dado como argumento,
  coloca-o do lado direito usando |i2|, sem efetuar qualquer alteração.
\end{itemize}

O seguinte diagrama demonstra o anamorfismo de QTree utilizado:

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |QTree A|
&
    |(A, (Int, Int)) + (QTree A, (QTree A, (QTree A, QTree A)))|
           \ar[l]_-{|inQTree|}
\\
    |Int >< QTree A|
           \ar[u]^-{|f|}
           \ar[r]_-{|g|}
&
    |(A, (Int, Int)) + (Int >< (QTree A, (Int >< QTree A, (Int >< QTree A, Int >< QTree A))))|
           \ar[u]_-{|id + f >< f >< f >< f|}
}
\end{eqnarray*}




\subsection{outlineQTree}

\quad A função \textbf{outlineQTree} apresenta o contorno de uma malha poligonal explicada no enunciado. Inicialmente é preciso verificar se a célula, após aplicada a função dada, é de valor \emph{True}. 
Em caso positivo, utiliza-se a função outlineBlock que, dado um tamanho de bloco, procede ao contorno do mesmo. 
\par O catamorfismo de QTree definido transforma uma QTree na respetiva QTree de Booleanos.
Após esta conversão, basta utilizar a função \textbf{qt2bm} para converter para uma Matrix, como pedido no enunciado.
\par A solução obtido é apresentada a seguir.



\begin{code}
outlineQTree f = qt2bm . (cataQTree (either (outlineCell f) (pairToBlock)))
outlineCell f (a,(b,c)) = if (f a) then (outlineBlock b c) else (Cell (f a) b c)
outlineBlock a b = Block
    (Block (Cell True 1 1)
           (Cell True (a-2) 1)
           (Cell True 1 (b-2))
           (Cell False (a-2) (b-2)))
    (Cell True 1 (b-1))
    (Cell True (a-1) 1)
    (Cell True 1 1)
\end{code}


O seguinte diagrama demonstra o catamorfismo de QTree utilizado, em que g = |either (outLineCell f) pairToBlock|


\begin{eqnarray*}
\xymatrix@@C=2cm{
    |QTree A|
           \ar[d]_-{|k = cataQTree g|}
           \ar[r]^-{out}
&
    |f >< (A,(Int,Int)) + (QTree A, (QTree A, (QTree A, QTree A)))|
           \ar[d]^-{recQTree (k)}
\\
    QTree A
&
    |f >< (A,(Int,Int)) + (QTree A, (QTree A, (QTree A, QTree A)))|
           \ar[l]^-{g}
}
\end{eqnarray*}

\subsection*{Problema 3}

\quad Como sugerido no enunciado a abordagem seguida foi fazer o |split f l| e |split g s|,
 para isso deduzimos através das definições em pointwise as funções. Finalmente aplicamos a lei da recursividade múltipla para os dois splits obtidos
 e obtemos as definições da base e loop para o for.

\begin{eqnarray*}
\start
        |lcbr(
		        fk 0 = 1
	    )(
		        fk (d+1) = (d + k + 1) * fk d
    )|
    |lcbr(
		        lk 0 = 1
    )(
		        lk (d+1) = lk d+1
	    )|
%
\just\equiv{ Lei 73 (x2), Lei 74 (x4), Definiçao de (d+k+1), Lei 76 (x2), Lei 78 }
%
    |lcbr(
		fk . (const 0) = const 1
	)(
		fk . succ = mul . (split lk fk)
    )|
    |lcbr(
		lk . (const 0) = const (k+1)
    )(
		lk . succ = succ . lk
	)|
%
\just\equiv{ Lei 27 eq+  }
%
    |lcbr(
		either (fk . (const 0)) (fk . succ) = either (const 1) (mul . (split lk fk))
	)(
		either (lk . (const 0)) (lk . succ) = either (const (k+1)) (succ . lk)
	)|
%
\just\equiv{ Definição de in dos naturais, Lei Fusão-+ (x2), Lei Absorção-+ (x2) }
%
    |lcbr(
		fk . in = (either (const 1) mul) . (id + split lk fk)
	)(
		lk . in = (either (const (k+1)) succ) . (id + lk)
	)|
%
\just\equiv{ Definição de swap e Lei 7 Cancelamento-x}
%
    |lcbr(
		fk . in = (either (const 1) mul . swap) . (id + split fk lk)
	)(
		lk . in = (either (const (k+1)) (succ . p2) . (id + split fk lk)
	)|
%
\just\equiv{ Lei 50 Fokkinga }
%
	|split fk lk = cataA (split (either (const 1) (mul . swap)) (either (const (k+1)) (succ . p2)))|
\qed
\end{eqnarray*}

\begin{eqnarray*}
\start
    |lcbr(
		g 0 = 1
	)(
		g (d+1) = (d + 1) * g d
    )|
    |lcbr(
		s 0 = 1
    )(
		s (d+1) = s d+1
	)|
%
\just\equiv{ Lei 73 (x2), Lei 74 (x4), Lei 76 (x2), Definição de (d+1) e Lei 78 }
%
    |lcbr(
		g . (const 0) = const 1
	)(
		g . succ = mul . (split s g)
    )|
    |lcbr(
		s . (const 0) = const 1
    )(
		s . succ = succ . s
	)|
%
\just\equiv{ Lei 27 eq-+  }
%
    |lcbr(
		either (g . (const 0)) (g . succ) = either (const 1) (mul . (split s g))
	)(
		either (s . (const 0)) (s . succ) = either (const 1) (succ . s)
	)|
%
\just\equiv{ Definição de in dos naturais, Lei Fusão (x2), Lei Absorção (x2) }
%
    |lcbr(
		g . in = (either (const 1) mul) . (id + split s g)
	)(
		s . in = (either (const (1)) succ . p1) . (id + split s g)
	)|
%
\just\equiv{ Propriedade do swap (x2) e Lei 7 Cancelamento-x  }
%
    |lcbr(
		g . in = (either (const 1) (mul . swap)) . (id + split g s)
	)(
		s . in = (either (const 1) (succ . p1 . swap) . (id + split g s)
	)|
%
\just\equiv{ Lei 50 Fokkinga  }
%
	|split g s = cataA (split (either (const 1) (mul . swap)) (either (const 1) (succ . p1 . swap)))|
\qed
\end{eqnarray*}

\begin{eqnarray*}
\start
|lcbr(
		cataA i = cataA (split (either (const 1) (mul . swap)) (either (const (k+1)) (succ . p2)))
	)(
        cataA j = cataA (split (either (const 1) (mul . swap)) (either (const 1) (succ . p1 . swap)))
    )|
%
\just\equiv{ Lei 51 Banana-split }
%
	|split (cataA i) (cataA j) = cataA (((split (either (const 1) (mul . swap)) (either (const (k+1)) (succ . p2))) >< (split (either (const 1) (mul . swap)) (either (const 1) (succ . p1 . swap))))
    
    . split (F p1) (F p2))|
%
\just\equiv{ Lei da troca  }
%
    |split (cataA i) (cataA j) = cataA ((either (split (const 1) (const (k+1))) (split (mul . swap) (succ . p2))) >< (either (split (const 1) (const 1)) (split (mul . swap) (succ . p1 . swap)))

    . split (F p1) (F p2))|
%
\just\equiv{ Lei da troca (x2), Def de funtor (F p1) e (F p2), Lei 75 Definição Constante, 3.90 apontamentos}
%
    |split (cataA i) (cataA j) = cataA ( split ( (either (split (const 1) (const (k+1))) (split (mul . swap) (succ . p2))) . F p1 ) ( (either (split (const 1) (const (k+1))) (split (mul . swap) (succ . p2))) . F p2 )
    )|
%
\just\equiv{ Lei da troca }
%
    |split (cataA i) (cataA j) = cataA ( either (split (split (const 1) (const (k+1))) (split (const 1) (const 1))) (split (split (mul . swap) (succ . p2) . p1) (split (mul . swap) (succ . p1 . swap) . p2)) )
    )|
%
\just\equiv{ Definição for b i }
%
    |lcbr(
		b = (split (split (mul . swap) (succ . p2) . p1) (split (mul . swap) (succ . p1 . swap) . p2))
	)(
		i = (split (split (const 1) (const (k+1))) (split (const 1) (const 1)))
	)|
\qed
\end{eqnarray*}



\begin{code}
untuple ((i,j),(k,z)) = (i,j,k,z)
tuple (i,j,k,z) = ((i,j),(k,z))
loop = untuple . (split ((split (mul . swap . p1) (succ . p2 . p1)) . tuple) ((split (mul . swap . p2) (succ . p1 . swap . p2)) . tuple))  
base = untuple . (split (split one succ) (split one one))
\end{code}


\subsection*{Problema 4}
De maneira a resolver o problema 4, foi necessário definir as funções que facilitam a manipulação do tipo de dados \emph{FTree}:

\vskip 1em

\emph{|inFTree|} usa os construtores de \emph{|FTree|}, usando uma função auxiliar
\emph{|toComp|} de maneira a poder converter um par recebido.

\begin{code}
inFTree = either Unit toComp
toComp (a, (b, c)) = Comp a b c
\end{code}

\vskip 1em

\emph{|outFTree|} foi derivada de uma maneira semelhante à out das Blockchain (Problema 1):

\begin{code}
outFTree (Unit a) = i1 a
outFTree (Comp a b c) = i2 (a, (b, c))
\end{code}

\vskip 1em

As restantes funções são:

\begin{code}
baseFTree f g h = g -|- (f >< (h >< h))
recFTree f = baseFTree id id f
cataFTree g = g . (recFTree (cataFTree g)) . outFTree
anaFTree g = inFTree . (recFTree (anaFTree g)) . g
hyloFTree f g = cataFTree f . anaFTree g
\end{code}

\vskip 1em

A partir da lei 47 (Def-map-cata) do formulário desta unidade curricular ficou definido o bifunctor:

\begin{code}
instance Bifunctor FTree where
    bimap f g = cataFTree (inFTree . (baseFTree f g id))
\end{code}

\subsubsection*{generatePTree}

A função |generatePTree| deve gerar, para um dado valor inteiro de entrada, a árvore de Pitágoras de ordem correspondente, composta por quadrados com escalas adequadas a cada nível. Esta função será definida como um anamorfismo.\par

Para este efeito, partimos do diagrama do anamorfismo de |FTree|, uma vez que dada a definição de |PTree| com |type PTree = FTree Square Square|, é possível inferir que a estrutura geral será idêntica, sendo apenas definidos os tipos que a |FTree| utiliza. Dada a definição de |Square| com |type Square = Float|, os tipos A e B abaixo definidos corresponderão, naturalmente, a esse mesmo tipo.

O diagrama é então o seguinte:

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |FTree A B|
        \ar[l]/_/_-{|out|}
&
    |B + A >< (FTree A B >< FTree A B)|
        \ar[l]/^/_-{|in|}
\\
    |C|
        \ar[u]^-{|f|}
        \ar[r]_-{|g|}
&
    |B + A >< (C >< C)|
        \ar[u]_-{|id + id >< (f >< f)|}
}
\end{eqnarray*}

Numa primeira tentativa, a ideia para o anamorfismo partia de um valor numérico inteiro de entrada que correspondia à ordem pretendida para a árvore de Pitágoras. Esse inteiro seria diminuído a cada iteração, ocorrendo o caso de paragem para esta computação quando esse valor atingisse o 0.

Este anamorfismo inicial servia-se então do seguinte gene:

|genePTree = (id + (split p2 (split p1 p1))) . (id + (pred >< id)) . (id + (split id orderMultiplier)) . (fromIntegral + id) . oneToLeft|

No entanto, o anamorfismo inicialmente sugerido tinha como resultado uma árvore de Pitágoras de dimensões invertidas, o que obrigou a que se partisse do valor de ordem mínimo para a árvore, 0, e se iterasse consecutivamente até ser atingido o valor de ordem pretendido para a árvore a construir.

Com este intuito, surgiu uma segunda versão para o anamorfismo, que define o tipo dos valores de entrada como o tuplo |(Int, Int)|. O primeiro elemento deste par representa o valor de ordem da iteração atual e o segundo elemento corresponde ao valor de ordem final, que foi definido para a árvore a ser criada.

Para que seja obtido o par acima descrito é necessário aplicar um \emph{split} ao valor inteiro de entrada. Este \emph{split} será dado por |split (const 0) id| e quando aplicado ao valor de entrada, permite que a seguir seja aplicado o anamorfismo pretendido, ficando assim definida a função |generatePTree|:

\begin{code}
generatePTree = anaFTree genePTree . (split (const 0) id)
\end{code}


A função |genePTree| será o gene do anamorfismo:

\begin{code}
genePTree = (id -|- (id >< (split id id))) . (id -|- (id >< (succ >< id))) . (id -|- (split (orderMultiplier . p1) id)) 
 . ((orderMultiplier . p1) -|- id) . checkComplete
\end{code}


\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Int >< Int|
           \ar[d]||{checkComplete}
\\
    |Int >< Int + Int >< Int|
           \ar[d]||{|(orderMultiplier . p1) + id|}
\\
    |Float + Int >< Int|
           \ar[d]||{|id + (split (orderMultiplier . p1) id)|}
\\
    |Float + Float >< (Int >< Int) |
           \ar[d]||{|id + id >< (succ >< id)|}
\\
    |Float + Float >< (Int >< Int)|
           \ar[d]||{|id + id >< (split id id)|}
\\
    |Float + Float >< ((Int >< Int) >< (Int >< Int))|
}
\end{eqnarray*}



Serão aqui apresentadas as funções a que o anamorfismo recorre.

Uma delas, |orderMultiplier|, retorna o multiplicador de uma |PTree| para um dado número de ordem. Dado o valor de escala definido pelo enunciado, de $\frac{\sqrt{2}}{2}$, sabe-se então que o valor de escala a aplicar nos quadrados a adicionar numa dada ordem é dado por $(\frac{\sqrt{2}}{2})^o$, sendo \emph{o} o número representante da ordem.

\begin{code}
orderMultiplier :: Int -> Float
orderMultiplier a = (((sqrt 2) / 2) ^ a)
\end{code}

Por sua vez, a função |checkComplete| executa |i1| sobre um par de inteiros se estes forem iguais ou |i2| se forem diferentes. Esta função é útil para a determinação da última iteração do anamorfismo.

A primeira guarda, na qual surge |b < 0 = i1 (a, 0)|, verifica se o valor em |b| é negativo para evitar um número infinito de iterações quando é pedida uma BTree com ordem negativa. Nesse caso, a ordem assumida toma o valor 0. Nas restantes guardas é efetuado o que havia sido definido em cima.

\begin{code}
checkComplete :: (Int, Int) -> Either (Int, Int) (Int, Int)
checkComplete (a, b)
    | b < 0 = i1 (a, 0)
    | a == b = i1 (a, b)
    | otherwise = i2 (a, b)
\end{code}

\subsubsection*{drawPTree}

Não foi desenvolvida uma definição para a função |drawPTree|.

\begin{code}
drawPTree = undefined
\end{code}

Verificam-se com isto as propriedades \emph{QuickCheck} relativas a este problema, como se pode verificar de seguida:

\begin{verbatim}
*Main> quickCheck (prop4a 14)
+++ OK, passed 1 tests.
*Main> quickCheck (prop4b 14)
+++ OK, passed 1 tests.
\end{verbatim}


\subsection*{Problema 5}

As funções que se pretendem ver desenvolvidas para a primeira alínea deste enunciado conferem funcionalidades essenciais aos mónades, evidenciando as suas propriedades de multiplicação, no caso da função |muB| e de unidade, no caso da função |singletonbag| (ou |u|).

A primeira será uma função polimórfica que permitirá reduzir em uma unidade o nível de monadificação a uma entrada que esteja num nível de monadificação igual ou superior a 2, ou seja, o seu tipo poderá ser dado por:

\begin{eqnarray*}
\xymatrix@@C=3cm{
    |T A|
&
    |T(T A)|
            \ar[l]^-{|muB|}
}
\end{eqnarray*}

Neste caso, está em uso o mónade |Bag| e com as reduções dos níveis de monadificação será necessário ajustar os valores de multiplicidade do conteúdo da |Bag| resultante. A função |muB| fica então definida por:

\begin{code}
-- mulMults :: ([(a, Int)], Int) -> [(a, Int)]
-- (unB . (fmap unB)) b3 == map (unB >< id) (unB b3)
mulMults ([], c) = []
mulMults (((a, b) : t), c) = (a, b * c) : (mulMults (t, c))
muB = B . concat . (map mulMults) . map (unB >< id) . unB
\end{code}

A ação da função |unB| remove a monadificação do seu argumento, o que coloca os pares (Elemento, Multiplicidade) exatamente na forma de tuplo. Desta forma será possível utilizar os valores de multiplicidade dos elementos menos aninhados, os segundos elementos dos pares, que serão relevantes para a redução do nível de monadificação.

\begin{eqnarray*}
\xymatrix@@C=3cm{
    |[(a, Int)]|
&
    |Bag a|
            \ar[l]^-{|unB|}
}
\end{eqnarray*}

De seguida será necessário tornar utilizáveis os valores de multiplicidade dos elementos do nível seguinte de aninhamento. Para isto, ao resultado da aplicação de |unB|, uma lista de tuplos (pares (Elemento, Multiplicidade)), será necessário remover a monadificação aos seus elementos (os primeiros elementos dos tuplos da lista que resultado da aplicação de |unB|), "expondo" as suas multiplicidades, por ação de |unB|, e deixando intacta a multiplicidade do nível superior (os segundos elementos dos tuplos da lista anteriormente mencionada), por ação de |id|. Estas funções serão mapeadas e aplicadas paralelamente a cada elemento da lista e ficam desta forma utilizáveis todos os valores de multiplicidade necessários para o processo de redução do nível de monadificação.

\begin{eqnarray*}
\xymatrix@@C=3cm{
    |[([(a, Int)], Int)]|
&
    |[(Bag a, Int)]|
            \ar[l]^-{|map (unB >< id)|}
}
\end{eqnarray*}

Será agora necessário remover a multiplicidade menos aninhada, e no entanto garantir a manutenção da correção das multiplicidades no mónade Bag resultante. Para isto, por ação de multiplicação das multiplicidades é obtido esse efeito. Para isto é usada a função |mulMults|, que será mapeada a cada elemento da lista resultante anterior. Para isto pretendemos que o 2º elemento dos tuplos menos aninhados sejam multiplicados pelo 2º elemento do 1º elemento dos tuplos menos aninhados, que por sua vez, como se pode inferir e verificar pelos exemplos aqui explicitados, será um tuplo também, que se apresenta na forma (Elemento, Multiplicidade). A lista de resultado ignora por completo o 2º elemento do tuplo principal, o que está de acordo com o pretendido.

\begin{eqnarray*}
\xymatrix@@C=3cm{
    |[[(a, b)]]|
&
    |[([(a, b)], b)]|
            \ar[l]^-{|map mulMults|}
}
\end{eqnarray*}

À lista de listas resultante será aplicada a função |concat|, que permitirá unificar os conteúdos das listas interiores e a partir da lista resultante é construído o mónade resultado, por ação de |B|, obtendo-se assim um mónade num grau imediatamente inferior de monadificação.

Segue-se a função que permite exibir a propriedade de unidade. A já mencionada |singletonbag| ou |u| ``encapsula" valores de entrada, conferindo-lhes um grau superior (em uma unidade) de monadificação. Neste caso está em uso o mónade |Bag| e, assim sendo, a função |singletonbag| poderá tomar a definição que se segue. A um único elemento que se pretenda colocar num |Bag|, será necessário colocá-lo na forma adequada para que possa ser monadificado por ação de |B|, ou seja, numa lista de tuplos de 2 elementos, já que B é do tipo:

\begin{eqnarray*}
\xymatrix@@C=3cm{
    |Bag a|
&
    |[(a, Int)]|
            \ar[l]^-{|B|}
}
\end{eqnarray*}

Para qualquer elemento que se pretenda encapsular, o valor da sua multiciplidade será de 1. Dessa forma o tuplo será algo como o par (Elemento, 1). Para este efeito entra em ação a função |s\_tuple|, que simplesmente forma o par adequado.

\begin{eqnarray*}
\xymatrix@@C=3cm{
    |(a, 1)|
&
    |a|
            \ar[l]^-{|s_tuple|}
}
\end{eqnarray*}

Obtendo o par adequado, será agora apenas necessário colocá-lo numa lista, o que será efetuado pela função |singl|.

\xymatrix@@C=3cm{
    |[a]|
&
    |a|
            \ar[l]^-{|singl|}
}
\end{eqnarray*}

À lista de saída da aplicação da função |singl| será apenas necessário conferir-lhe monadificação, pelo que é novamente utilizado |B|.

\begin{code}
s_tuple a = (a, 1)
singletonbag = B . singl . s_tuple
\end{code}

Resta apenas a função |dist|, que para um qualquer |Bag| apresenta as percentagens de distribuição dos seus conteúdos, recorrendo ao mónade |Dist|.

\xymatrix@@C=3cm{
    |Dist a|
&
    |Bag a|
            \ar[l]^-{|dist|}
}
\end{eqnarray*}

Com base na composição de funções, a função |dist| apresenta a definição do código que se segue. Por ação da função |unB|, a partir do mónade de entrada obtém-se a lista de pares (Elemento, Int), sendo o valor inteiro a sua multiplicidade do elemento no |Bag| que acabou de ser removido. A cada um desses pares, com recurso ao mapeamento da função |repMarbles|, é obtida uma lista, que representa explicitamente a ideia definida em cada par (p.e. no caso do elemento ser uma |Marble|, seria possível um dos elementos da lista original ser algo como (Blue, 3), que por ação da função |repMarbles|, dá origem a [Blue, Blue, Blue]), utilizando a versão \textit{uncurried} da função pré-definida |replicate| e o par (Marble,Int) com a ordem inversa por ação da função |swap|, ou seja, um par (Int, Marble). As listas aninhadas são de seguida concatenadas e é aplicada a função |uniform|, que obterá a distribuição e os valores de probabilidade adequados.

\begin{code}
repMarbles = uncurry replicate . swap
dist = uniform . concat . map repMarbles . unB
\end{code}

A segunda alínea deste problema pretende apenas demonstrar a correção das funções desenvolvidas, por verificação da validade das propriedades de multiplicação (à esquerda) e unidade (à direita) já mencionadas e que são referidas nas notas teóricas desta unidade curricular.

\begin{figure}[!ht]
\begin{minipage}[t]{.5\textwidth}
\xymatrix@@C=2.5cm@@R=2cm{
	|T(T A)|
		\ar[d]^-{|muB|}
&
	|T(T(T A)|
		\ar[l]^-{|muB|}
        \ar[d]^-{|T muB|}
\\
	|T A|
&
	|T(T A)|
		\ar[l]^-{|muB|}
}
\end{minipage}
\hspace{1cm}
\begin{minipage}[t]{.5\textwidth}
\xymatrix@@C=3.4cm@@R=2cm{
	|T(T A)|
		\ar[d]^-{|muB|}
&
	|T A|
		\ar[l]^-{|u|}
        \ar[d]^-{|T u|}
        \ar[dl]^-{|id|}
\\
	|T A|
&
	|T(T A)|
		\ar[l]^-{|muB|}
}
\end{minipage}
\end{figure}

\pagebreak
Com tudo isto, os resultados dos testes |test5a| e |test5b| são os seguintes:
\begin{verbatim}
*Main> quickCheck (bagOfMarbles == muB (return bagOfMarbles))
+++ OK, passed 1 tests.
*Main> quickCheck ((muB . muB) b3 == (muB .fmap muB) b3)
+++ OK, passed 1 tests.
\end{verbatim}




\section{Como exprimir cálculos e diagramas em LaTeX/lhs2tex}
Estudar o texto fonte deste trabalho para obter o efeito:\footnote{Exemplos tirados de \cite{Ol18}.} 
\begin{eqnarray*}
\start
	|id = split f g|
%
\just\equiv{ universal property }
%
        |lcbr(
		p1 . id = f
	)(
		p2 . id = g
	)|
%
\just\equiv{ identity }
%
        |lcbr(
		p1 = f
	)(
		p2 = g
	)|
\qed
\end{eqnarray*}

Os diagramas podem ser produzidos recorrendo à \emph{package} \LaTeX\ 
\href{https://ctan.org/pkg/xymatrix}{xymatrix}, por exemplo: 
\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Nat0|
           \ar[d]_-{|cataNat g|}
&
    |1 + Nat0|
           \ar[d]^{|id + (cataNat g)|}
           \ar[l]_-{|inNat|}
\\
     |B|
&
     |1 + B|
           \ar[l]^-{|g|}
}
\end{eqnarray*}

%----------------- Fim do anexo com soluções dos alunos ------------------------%

%----------------- Índice remissivo (exige makeindex) -------------------------%

\printindex

%----------------- Outras definições auxiliares -------------------------------------------%

%if False
\begin{code}
infixr 0 .==>.
(.==>.) :: (Testable prop) => (a -> Bool) -> (a -> prop) -> a -> Property
p .==>. f = \a -> p a ==> f a

infixr 0 .<==>.
(.<==>.) :: (a -> Bool) -> (a -> Bool) -> a -> Property
p .<==>. f = \a -> (p a ==> property (f a)) .&&. (f a ==> property (p a))

infixr 4 .==.
(.==.) :: Eq b => (a -> b) -> (a -> b) -> (a -> Bool)
f .==. g = \a -> f a == g a

infixr 4 .<=.
(.<=.) :: Ord b => (a -> b) -> (a -> b) -> (a -> Bool)
f .<=. g = \a -> f a <= g a

newtype Nat = Nat {getNat :: Int}
 deriving ( Eq, Ord, Show, Enum, Read, Typeable)

instance Arbitrary Nat where
  arbitrary =
    (frequency
       [ (5, (Nat . abs) `fmap` arbitrary)
       , (1, return (Nat 0))
       ]
    ) `suchThat` ge0
    where ge0 (Nat x) = x >= 0

  shrink (Nat x) =
    [ Nat x'
    | x' <- shrink x
    , x' >= 0
    ]

newtype SmallNat = SmallNat Int
 deriving ( Eq, Ord, Show, Read,Enum,Num,Typeable)

instance Arbitrary SmallNat where
  arbitrary = liftM SmallNat (QuickCheck.choose (0,10))

  shrink (SmallNat x) =
    [ SmallNat x'
    | x' <- shrink x
    , x' >= 0, x' <= 10
    ]
    
instance Arbitrary a => Arbitrary (Matrix a) where
  arbitrary = do
    rows <- QuickCheck.choose (0,100)
    cols <- QuickCheck.choose (0,100)
    xs <- vectorOf (rows * cols) arbitrary
    return (fromList rows cols xs)
  shrink = shrinkNothing

minusNat :: Int -> Int -> Int
minusNat x = Nat.for predNat x

predNat :: Int -> Int
predNat 0 = 0
predNat n = n - 1

-- * pergunta 1

data Blockchain = Bc {bc :: Block}  |  Bcs {bcs :: (Block, Blockchain)} deriving Show
type Block = (MagicNo, (Time, Transactions))
type Transaction = (Entity, (Value, Entity))
type Transactions = [Transaction]
type Ledger = [(Entity, Value)]
type MagicNo = String
type Time = Int  -- em milisegundos
type Entity = String
type Value = Int

inBlockchain :: Either Block (Block, Blockchain) -> Blockchain
outBlockchain :: Blockchain -> Either Block (Block, Blockchain)
recBlockchain :: (c -> d) -> Either b1 (b2, c) -> Either b1 (b2, d)
cataBlockchain :: (Either Block (Block, d) -> d) -> Blockchain -> d
anaBlockchain :: (c -> Either Block (Block, c)) -> c -> Blockchain
hyloBlockchain :: (Either Block (Block, c1) -> c1) -> (c2 -> Either Block (Block, c2)) -> c2 -> c1

list2chain [] = Bc ("numeromagico1", (0, []))
list2chain [b] = Bc b
list2chain (h:t) = Bcs (h, list2chain t)

instance Arbitrary Blockchain where
  arbitrary = do
    xs <- arbitrary
    -- nao convem ter numeros repetidos
    return $ list2chain $ nubBy (\(n, _) (n', _) -> n /= n') xs
  shrink = shrinkNothing

e1 = "ent1"
e2 = "ent2"

mg1 = "b1"
mg2 = "b2"
mg3 = "b3"

tm1 = 1
tm2 = 2
tm3 = 3

t1 = (e1, (100, e2))
t2 = (e2, (50, e1))

bl1, bl2, bl3 :: Block
bl1 = (mg1, (tm1, []))
bl2 = (mg2, (tm2, [t1]))
bl3 = (mg3, (tm3, [t2]))

bs1, bs2 :: Blockchain
bs1 = Bcs (bl1, Bcs (bl2, Bc bl3))
bs2 = Bcs (bl3, Bcs (bl2, Bc bl2))
bs3 = Bc bl2
bs4 = Bcs (bl1, Bc bl3)


reverseChain :: Blockchain -> Blockchain
reverseChain = cataBlockchain (either Bc snocChain)


snocChain :: (Block, Blockchain) -> Blockchain
snocChain (b, Bc b') = Bcs (b', Bc b)
snocChain (b, Bcs (b', bs)) = Bcs (b', snocChain (b, bs))


concChain :: (Blockchain, Blockchain) -> Blockchain
concChain (b1, (Bc b)) = snocChain (b, b1)
concChain (b1, (Bcs (b, bs))) = concChain ((snocChain (b, b1)), bs)


lenChain = cataBlockchain (either (const 1) (succ . p2))

-- * pergunta 2

data QTree a = Cell a Int Int | Block (QTree a) (QTree a) (QTree a) (QTree a)
  deriving (Eq,Show)
  
inQTree :: Either (a, (Int, Int)) (QTree a, (QTree a, (QTree a, QTree a))) -> QTree a
outQTree :: QTree a -> Either (a, (Int, Int)) (QTree a, (QTree a, (QTree a, QTree a)))
baseQTree :: (a1 -> b) -> (a2 -> d1) -> Either (a1, d2) (a2, (a2, (a2, a2))) -> Either (b, d2) (d1, (d1, (d1, d1)))
recQTree :: (a -> d1) -> Either (b, d2) (a, (a, (a, a))) -> Either (b, d2) (d1, (d1, (d1, d1)))
cataQTree :: (Either (b, (Int, Int)) (d, (d, (d, d))) -> d) -> QTree b -> d
anaQTree :: (a1 -> Either (a2, (Int, Int)) (a1, (a1, (a1, a1)))) -> a1 -> QTree a2
hyloQTree :: (Either (b, (Int, Int)) (c, (c, (c, c))) -> c) -> (a -> Either (b, (Int, Int)) (a, (a, (a, a)))) -> a -> c

instance (Eq a,Arbitrary a) => Arbitrary (QTree a) where
  arbitrary = do
    rows <- QuickCheck.choose (1,100)
    cols <- QuickCheck.choose (1,100)
    xs <- vectorOf (rows * cols) arbitrary
    return ((bm2qt . fromList rows cols) xs)
  shrink = shrinkNothing

rotateMatrix :: Matrix a -> Matrix a
rotateMatrix m = matrix (ncols m) (nrows m) rot
    where
    rot (j,i) = unsafeGet (nrows m - i + 1) j m

rotatebm :: Eq a => Matrix a -> Matrix a
rotatebm = qt2bm . rotateQTree . bm2qt

rotateBMP :: FilePath -> FilePath -> IO ()
rotateBMP from to = withBMP from to rotatebm

instance Arbitrary PixelRGBA8 where
    arbitrary = do
        r <- px
        g <- px
        b <- px
        a <- px
        return (PixelRGBA8 r g b a)
      where px = QuickCheck.choose (0,255)
    shrink = shrinkNothing

sizeMatrix :: Matrix a -> (Int,Int)
sizeMatrix = ncols `split` nrows
    
sizeQTree :: QTree a -> (Int,Int)
sizeQTree = cataQTree (either snd g)
    where
    g (a,(b,(c,d))) = (fst a + fst b,snd a + snd c)

shapeQTree :: QTree a -> QTree ()
shapeQTree = fmap (!)

scalebm :: Eq a => Int -> Matrix a -> Matrix a
scalebm s = qt2bm . scaleQTree s . bm2qt

scaleBMP :: Int -> FilePath -> FilePath -> IO ()
scaleBMP s from to = withBMP from to (scalebm s)

invertbm :: Matrix PixelRGBA8 -> Matrix PixelRGBA8
invertbm = qt2bm . invertQTree . bm2qt

invertBMP :: FilePath -> FilePath -> IO ()
invertBMP from to = withBMP from to invertbm

depthQTree :: QTree a -> Int
depthQTree = cataQTree (either (const 0) f)
    where f (a,(b,(c,d))) = maximum [a,b,c,d]

compressbm :: Eq a => Int -> Matrix a -> Matrix a
compressbm n = qt2bm . compressQTree n . bm2qt

compressBMP :: Int -> FilePath -> FilePath -> IO ()
compressBMP n from to = withBMP from to (compressbm n)

outlinebm :: Eq a => (a -> Bool) -> Matrix a -> Matrix Bool
outlinebm isBackground = outlineQTree isBackground . bm2qt

outlineBMP :: FilePath -> FilePath -> IO ()
outlineBMP from to = withBMP from to (fmap mono . outlinebm (==whitePx))
    where
    mono False = whitePx
    mono True = blackPx
    
addOutlineBMP :: FilePath -> FilePath -> IO ()
addOutlineBMP from to = withBMP from to joinbm
    where
    joinbm bm = elementwiseUnsafe joinpx bm (outlinebm (==whitePx) bm)
    joinpx px1 False = px1
    joinpx px1 True = blackPx

qtOut = fromLists 
    [[  True, True, True, True, True, True, True, True ]
    ,[  True,False,False, True, True, True, True, True ]
    ,[  True,False,False, True,False,False,False, True ]
    ,[  True, True, True, True,False,False, True, True ]
    ,[ False,False,False,False,False,False, True, True ]
    ,[ False,False,False,False,False,False, True, True ]
    ,[ False,False,False,False, True, True, True, True ]
    ,[ False,False,False,False, True, True, True,False ]
    ]

bm = fromLists [
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,1,1,1,0],
    [0,0,0,0,1,1,0,0],
    [1,1,1,1,1,1,0,0],
    [1,1,1,1,1,1,0,0],
    [1,1,1,1,0,0,0,0],
    [1,1,1,1,0,0,0,1]]

qt = bm2qt bm

-- * pergunta 4

data FTree a b = Unit b | Comp a (FTree a b) (FTree a b) deriving (Eq,Show)
type PTree = FTree Square Square
type Square = Float

inFTree :: Either b (a, (FTree a b, FTree a b)) -> FTree a b
outFTree :: FTree a1 a2 -> Either a2 (a1, (FTree a1 a2, FTree a1 a2))
baseFTree :: (a1 -> b1) -> (a2 -> b2) -> (a3 -> d) -> Either a2 (a1, (a3, a3)) -> Either b2 (b1, (d, d))
recFTree :: (a -> d) -> Either b1 (b2, (a, a)) -> Either b1 (b2, (d, d))
cataFTree :: (Either b1 (b2, (d, d)) -> d) -> FTree b2 b1 -> d
anaFTree :: (a1 -> Either b (a2, (a1, a1))) -> a1 -> FTree a2 b
hyloFTree :: (Either b1 (b2, (c, c)) -> c) -> (a -> Either b1 (b2, (a, a))) -> a -> c

depthFTree :: FTree a b -> Int
depthFTree = cataFTree (either (const 0) g)
    where g (a,(l,r)) = max l r + 1
    
isBalancedFTree :: FTree a b -> Bool
isBalancedFTree = isJust . cataFTree (either (const (Just 0)) g)
    where
    g (a,(l,r)) = join (liftA2 equal l r)
    equal x y = if x == y then Just (x+1) else Nothing
\end{code}
%endif

%----------------- Fim do documento -------------------------------------------%

\end{document}

