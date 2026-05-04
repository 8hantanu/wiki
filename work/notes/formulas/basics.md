# Basics

## Mathematical Notation

- $$\sum_{i=1}^{n} a_i$$ : summation over terms from $$i=1$$ to $$n$$
- $$\prod_{i=1}^{n} a_i$$ : product over terms from $$i=1$$ to $$n$$
- $$\binom{n}{r}$$ : number of ways to choose $$r$$ items from $$n$$ items
- $$\mathbf{x} \in \mathbb{R}^{d}$$ : vector $$\mathbf{x}$$ lives in a $$d$$-dimensional real space
- $$\mathbf{W} \in \mathbb{R}^{d \times k}$$ : matrix $$\mathbf{W}$$ has shape $$d \times k$$
- $$\mathbf{x}^\top$$ : transpose of vector or matrix $$\mathbf{x}$$
- $$\mathbf{x}^\top \mathbf{y}$$ : inner product / dot product
- $$\lVert \mathbf{x} \rVert_2$$ : Euclidean norm of $$\mathbf{x}$$
- $$\langle \mathbf{x}, \mathbf{y} \rangle$$ : inner product notation
- $$\mathbf{x} \odot \mathbf{y}$$ : element-wise (Hadamard) product
- $$\mathbb{E}[X]$$ : expectation of random variable $$X$$
- $$\mathrm{Var}(X)$$ : variance of random variable $$X$$
- $$\mu$$ : mean
- $$\sigma$$ : standard deviation
- $$\sigma^2$$ : variance
- $$P(A \mid B)$$ : probability of $$A$$ given $$B$$
- $$\max(x, y)$$ : maximum of two values
- $$\arg\max_x f(x)$$ : value of $$x$$ that maximizes $$f(x)$$
- $$\mathrm{sign}(x)$$ : sign of $$x$$
- $$f(x) \propto g(x)$$ : $$f(x)$$ is proportional to $$g(x)$$
- $$a \approx b$$ : $$a$$ is approximately equal to $$b$$

## Combinatorics

$$
\binom{n}{r} = \frac{n!}{(n-r)!r!}
$$

$$
n! = \prod_{i=1}^{n} i
$$

$$
\binom{n}{r} = \binom{n}{n-r}
$$

$$
\binom{n}{r} = \binom{n-1}{r} + \binom{n-1}{r-1}
$$

## Probability

$$
P(A \mid B) = \frac{P(A \cap B)}{P(B)}
$$

$$
P(A \cap B) = P(A \mid B) P(B)
$$

$$
P(A \mid B) = \frac{P(B \mid A) P(A)}{P(B)}
$$

$$
\mathbb{E}[X] = \sum_x x P(X=x)
$$

$$
\mathrm{Var}(X) = \mathbb{E}[X^2] - \mathbb{E}[X]^2
$$

## Exponentials and Logarithms

$$
e^{a+b} = e^a e^b
$$

$$
\log(ab) = \log a + \log b
$$

$$
\log\left(\frac{a}{b}\right) = \log a - \log b
$$

$$
\log(a^n) = n \log a
$$

$$
\log(e^x) = x
$$

$$
e^{\log x} = x
$$

## Linear Algebra

$$
\mathbf{x}^\top \mathbf{y} = \sum_{i=1}^{n} x_i y_i
$$

$$
\lVert \mathbf{x} \rVert_2 = \sqrt{\sum_{i=1}^{n} x_i^2}
$$

$$
\cos \theta = \frac{\mathbf{x}^\top \mathbf{y}}{\lVert \mathbf{x} \rVert_2 \lVert \mathbf{y} \rVert_2}
$$

$$
(\mathbf{A}\mathbf{B})_{ij} = \sum_{k} A_{ik} B_{kj}
$$

## Calculus

$$
\frac{d}{dx} x^n = n x^{n-1}
$$

$$
\frac{d}{dx} e^x = e^x
$$

$$
\frac{d}{dx} \log x = \frac{1}{x}
$$

$$
\int x^n \, dx = \frac{x^{n+1}}{n+1} + C
$$

$$
\int e^x \, dx = e^x + C
$$

$$
\frac{\partial f}{\partial x}
$$

$$
\nabla_{\mathbf{x}} f
$$

$$
\frac{d}{dx} f(g(x)) = f'(g(x)) g'(x)
$$
