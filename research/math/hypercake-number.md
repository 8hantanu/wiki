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

Solving the above series[^hint], we obtain:

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
[^hint]: **Hint**: Sum of first n positive integers = $\frac{n(n+1)}{2}$
[^2]: [https://oeis.org/A000125](https://oeis.org/A000125)
[^hint2]: **Hint**: Sum of squares of first n positive integers = $\frac{n(n+1)(2n+1)}{6}$
[^shots]: Take a shot everytime hyper is mentioned.
[^proof]: Read next: [[Solving the Hypercake Series]]
