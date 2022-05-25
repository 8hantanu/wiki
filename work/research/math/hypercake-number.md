# Hypercake Number

Cake number, as defined in mathematics is the number of maximum pieces a cake can be cut into with a given number of cuts. In this post, we will try to do the same with a cake (a Hypercake if you may) in higher dimensions.

## The Knife's Dimension

Before we move on to cutting cakes, let's ponder upon the dimension of the knife. What should be the dimension of the knife when cutting a multidimensional cake?

- For a regular cake ($3$D), we use a regular knife (a $2$D plane).
- For a cutting pancake ($2$D), we use a regular knife ($2$D). We can even use a razor-thin string ($1$D) as well to cut the pancake.
- For cutting a candy stick($1$D), we can use a knife, a garrote, and even a point ($0$D).

Would it be safe to say that we can cut an $n$-dimensional cake if we have a slicer of at least $(n-1)$ dimension?

Some points to think about:

- If using an $(n-1)$D slicer to cut an $n$D cake, the slicer must lie in the same dimension as that of the cake.
- If using an $\geq n$D slicer to cut an $n$D cake, the slicer must not be parallel to the cake.

Moving on to the main problem let $c_{m,n}$ represents the number of maximum slices with $m$ as the cake's dimension and $n$ as the number of cuts. For the sake of simplicity, we will take a slicer of $(m-1)$ dimension to slice the $m$-dimensional cake.

## The Pancake Problem

Starting with a pancake (a $2$D cake) and a $1$D slicer (a line), the first line cuts the plane into $2$ pieces. For $n > 1$, the $n$-th line crosses every earlier line and also avoids every previous line intersection and parallelism, thus increasing the number of pieces by $n$. So this leads to a recurring relation[^1]:

$$c_{2,n} = c_{2,n-1} + n$$

where $c_{2,n}$ represent the number of maximum pieces obtained with $n$ cuts with $c_{2,1} = 2$.

Solving the above series[^hint1], we obtain:

$$
\begin{align}
c_{2,n} &= \frac{n^2+n+2}{2} \\
        &= \binom{n}{2}+\binom{n}{1}+\binom{n}{0}
\end{align}
$$

**Note**: $\binom{n}{r} = \frac{n!}{(n-r)!\times r!}$ and for $n < r$, $\binom{n}{r} = 0$

## The Cake Problem

Now do the same for a regular cake ($3$D) with a knife ($2$D plane), we have to make each cut (plane) such that it is not parallel to any of the existing cuts (planes) and slices each one of them.

One way to visualize this would be to view the lines of intersection between all existing planes and the incoming plane. On the incoming plane, these lines will represent the cuts that yield the maximum number of slices in the plane dimension[^book].

From the pancake problem, we can say that the plane is sliced into $c_{2,n-1}$ pieces assuming $n-1$ planes already exist. This represents the number of new slices created after $n$th cut[^2].

$$c_{3,n} = c_{3,n-1} + c_{2,n-1}$$

with $c_{3,1} = 2$. Solving above recurrence we have[^hint2]:

$$c_{3,n} = \binom{n}{3}+\binom{n}{2}+\binom{n}{1}+\binom{n}{0}$$

Revisiting our pancake problem, we have:

$$
\begin{align}
c_{2,n} &= c_{2,n-1} + n \\
        &= c_{2,n-1} + c_{1,n-1}
\end{align}
$$

Here $c_{1,n-1} = n$ is clearly the number of pieces obtained after $n-1$ cuts on a line.

## The Hypercake Problem

The above method can be extended to cakes in higher dimension but the visualization gets difficult. We have math to do that for us. Generalizing we can write:

$$c_{m,n} = c_{m,n-1} + c_{m-1,n-1}$$

with $c_{m,1} = 2$ and $c_{1,m} = m+1$.

Using the same method, suppose $n-1$ $(m-1)$D-hyperplanes are already cutting the $m$-D Hypercake. The incoming $(m-1)$D-hyperplane will intersect with the existing $(m-1)$D-hyperplanes in $(m-2)$D-hyperplanes which create $c_{m-1,n-1}$ new slices[^shots].

From the previous series ...

$$
\begin{align}
c_{1,n} &= \binom{n}{1}+\binom{n}{0} \\ \\
c_{2,n} &= \binom{n}{2}+\binom{n}{1}+\binom{n}{0} \\ \\
c_{3,n} &= \binom{n}{3}+\binom{n}{2}+\binom{n}{1}+\binom{n}{0}
\end{align}
$$

... it seems that the Hypercake series will unfold to[^proof]

$$c_{m,n} = \binom{n}{m}+\binom{n}{m-1}+\dots+\binom{n}{1}+\binom{n}{0}$$

Also, when $m \to \infty$

$$\lim_{m \to \infty} c_{m,n} = 2^n$$

[^book]: Suggested Reading: [Hyperspace - Michio Kaku](https://www.goodreads.com/book/show/722419.Hyperspace)
[^idea]: A formal way to go about proving this would be to prove
[^1]: [https://oeis.org/A000124](https://oeis.org/A000124)
[^hint1]: **Hint**: Sum of first n positive integers = $\frac{n(n+1)}{2}$
[^2]: [https://oeis.org/A000125](https://oeis.org/A000125)
[^hint2]: **Hint**: Sum of squares of first n positive integers = $\frac{n(n+1)(2n+1)}{6}$
[^shots]: Take a shot everytime hyper is mentioned.


## Solving the Hypercake Series

Above we obtained a recurrence relation for the hypercake number:

$$c_{m,n} = c_{m,n-1} + c_{m-1,n-1}$$

with $c_{m,1} = 2$ and $c_{1,m} = m+1$.

To move forward, some basic understanding of generating functions[^gf] and binomial coefficients[^bc] is required. <!--more--> For the sake of completeness and simplifying things let us also consider the case of 0 cuts which yield $c_{m,0} = 1$ (max cake slices with $0$ cuts) and $c_{0,n} = 1$ (a point cannot be sliced further). Now the new initial conditions are:

$$c_{m,n} = c_{m,n-1} + c_{m-1,n-1}$$

with $c_{m,0} = 1$ and $c_{0,n} = 1$.

One way to go about this and generally about solving recurrence relations is to use generating functions, in our case, it will lead to a generating function in two variables. Let's suppose we have

$$f(x,y)=\sum_{i,j=0}^{\infty}c_{i,j} x^i y^j$$

a formal powers series which encodes coefficients of our sequence. To find a generating function for this $f(x,y)$ was not so straightforward[^hint3] for me, so I had to seek help from a good samaritan at Math SE[^mse].

$$
\begin{align}
f(x,y)&=\sum_{i,j=0}^{\infty}c_{i,j} x^i y^j \\
&=c_{0,0}+\sum_{i=1}^{\infty}c_{i,0} x^i+\sum_{j=1}^{\infty}c_{0,j} y^j + \sum_{i,j=1}^{\infty}c_{i,j} x^i y^j \\
\end{align}
$$

We separate the terms where either $i$ or $j$ equals $0$, since we can write recurrence for $c_{i,j}$ iff $i, j \geq 1$. For second and third sums above[^gf1],

$$
\sum_{i=1}^{\infty}c_{i,0} x^i = x+x^2+x^3+\dots = \frac{x}{1-x}
$$

So overall we have

$$
f(x,y) = 1+\frac{x}{1-x}+\frac{y}{1-y}+\sum_{i,j=1}^{\infty}c_{i,j} x^i y^j
$$

Now for the last sum, we can apply our recurrence relation

$$
\begin{align}
\sum_{i,j=1}^{\infty}c_{i,j} x^i y^j &= \sum_{i,j=1}^{\infty}(c_{i,j-1}+c_{i-1,j-1}) x^i y^j \\
    &= \sum_{i,j=1}^{\infty}c_{i,j-1} x^i y^j+\sum_{i,j=1}^{\infty}c_{i-1,j-1} x^i y^j \\
    &= y\sum_{i,j=1}^{\infty}c_{i,j-1} x^i y^{j-1}+xy\sum_{i,j=1}^{\infty}c_{i-1,j-1} x^{i-1} y^{j-1}\\
\end{align}
$$

Rearranging the limits and product in the sums so that we can obtain it in the $f(x,y)$ form

$$
\begin{align}
\sum_{i,j=1}^{\infty}c_{i,j} x^i y^j &= y\sum_{i=1,j=0}^{\infty}c_{i,j} x^i y^{j}+xy\sum_{i,j=0}^{\infty}c_{i,j} x^{i} y^{j}\\
    &= y\left(\sum_{i=0,j=0}^{\infty}c_{i,j} x^i y^{j}-\sum_{j=0}^{\infty}c_{0,j}\right)+xy\sum_{i,j=0}^{\infty}c_{i,j} x^{i} y^{j}\\
    &= y\left(f(x,y)-\sum_{j=0}^{\infty}c_{0,j}\right)+xyf(x,y)\\
    &= y\left(f(x,y)-\frac{1}{1-y}\right)+xyf(x,y)\\
\end{align}
$$

Plugging in the last sum $\sum_{i,j=1}^{\infty}c_{i,j} x^i y^j$, in the original definition of $f(x,y)$ we have

$$
\begin{align}
         f(x,y) &=1+\frac{x}{1-x}+\frac{y}{1-y}+ y\left(f(x,y)-\frac{1}{1-y}\right)+xyf(x,y)\\
(1-y-xy) f(x,y) &= 1+\frac{x}{1-x}+\frac{y}{1-y}-y\left(\frac{1}{1-y}\right)\\
         f(x,y) &= \frac{1}{(1-x)(1-y-xy)}\\
\end{align}
$$

Now that we have the generating function of $f(x,y)$, it encodes all of the coefficients compactly.

Notice that in $f(x,y)=\frac{1}{1-x}.\frac{1}{1-y-xy}$ the first term is

$\frac{1}{1-x}=1+x+x^2+x^3+\dots$

Also, the second expression is a well known generating function

$$\frac{1}{1-y-xy}=\frac{1}{1-y(1+x)}=\sum_{i,j=0}^{\infty}\binom{j}{i} x^i y^j$$

So we can view our function in this form as a product

$$
f(x,y) = (1+x+x^2+x^3+\dots) \left(\sum_{i,j=0}^{\infty}\binom{j}{i} x^i y^j\right)
$$

Coming to the showdown we need to find the value of $$c_{i,j}$$ which will be the same as the coefficient of $$x^i y^j$$ is in the above product. It is not hard to see that it will be

$$
\dots + \left(\binom{j}{i}+\binom{j}{i-1}+\dots+\binom{j}{0}\right) x^i y^j + \dots
$$

Therefore we have (as speculated above)

$$c_{i,j} =\binom{j}{i}+\binom{j}{i-1}+\dots+\binom{j}{0} =\sum_{k=0}^{i}\binom{j}{k}$$

Finally the Hypercake Numbers $c_{m,n}$ which represents the number of maximum pieces a $m$D-hypercake can be sliced into with $n$ cuts made by a slicer of dimension $\geq (m-1)$.

$$\text{Hypercake Number:} ~~ c_{m,n} =\sum_{i=0}^{m}\binom{n}{i}$$

[^gf]: [http://discrete.openmathbooks.org/dmoi2/section-27.html](http://discrete.openmathbooks.org/dmoi2/section-27.html)
[^bc]: [http://discrete.openmathbooks.org/dmoi3/sec_counting-binom.html](http://discrete.openmathbooks.org/dmoi3/sec_counting-binom.html#UCc)
[^hint3]: **Hint**: $f(x,y)=\frac{1}{(x-1)(xy+y-1)}$
[^mse]: [https://math.stackexchange.com/a/2065193](https://math.stackexchange.com/a/2065193)
[^gf1]: Proof:
    $$
    \begin{align*}
    S & = 1 + x + x^2 + x^3 + \cdots\\
    \underline{- xS} & \underline{\,\, = ~~ - x - x^2 - x^3 - \cdots}\\
    (1-x)S & = 1
    \end{align*}
    $$
