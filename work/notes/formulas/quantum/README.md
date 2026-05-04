# Quantum

- [Algorithms](algorithms)

## Notation

- $$\mathbb{C}^{2^n}$$ : complex vector space for an $$n$$-qubit state
- $$\lvert \psi \rangle$$ : ket / state vector
- $$\langle \psi \rvert$$ : bra / conjugate transpose of a ket
- $$\langle \phi \mid \psi \rangle$$ : inner product between states
- $$\lvert \psi \rangle \otimes \lvert \phi \rangle$$ : tensor product of states
- $$U^\dagger$$ : adjoint (conjugate transpose) of $$U$$
- $$\Pr(x)$$ : probability of observing outcome $$x$$
- $$x \oplus y$$ : bitwise XOR
- $$a \bmod N$$ : remainder of $$a$$ modulo $$N$$

## Complex Numbers

$$
z = a + bi
$$

$$
\bar{z} = a - bi
$$

$$
\lvert z \rvert = \sqrt{a^2 + b^2}
$$

$$
e^{i\theta} = \cos \theta + i \sin \theta
$$

## State Notation

$$
\lvert \psi \rangle
$$

$$
\langle \psi \rvert
$$

$$
\langle \phi \mid \psi \rangle
$$

$$
\lVert \lvert \psi \rangle \rVert^2 = \langle \psi \mid \psi \rangle
$$

## Qubit States

$$
\lvert 0 \rangle =
\begin{bmatrix}
1 \\
0
\end{bmatrix},
\quad
\lvert 1 \rangle =
\begin{bmatrix}
0 \\
1
\end{bmatrix}
$$

$$
\lvert \psi \rangle = \alpha \lvert 0 \rangle + \beta \lvert 1 \rangle
$$

$$
\lvert \alpha \rvert^2 + \lvert \beta \rvert^2 = 1
$$

## Multi-Qubit Systems

$$
\lvert \psi \rangle \otimes \lvert \phi \rangle
$$

$$
\lvert 00 \rangle = \lvert 0 \rangle \otimes \lvert 0 \rangle, \quad
\lvert 01 \rangle = \lvert 0 \rangle \otimes \lvert 1 \rangle
$$

$$
\lvert \psi \rangle = \sum_{x \in \{0,1\}^n} \alpha_x \lvert x \rangle
$$

$$
\sum_{x \in \{0,1\}^n} \lvert \alpha_x \rvert^2 = 1
$$

## Unitary Evolution

$$
U^\dagger U = I
$$

$$
\lvert \psi' \rangle = U \lvert \psi \rangle
$$

## Measurement

$$
\Pr(0) = \lvert \alpha \rvert^2, \quad \Pr(1) = \lvert \beta \rvert^2
$$

$$
\Pr(x) = \lvert \langle x \mid \psi \rangle \rvert^2
$$

$$
\lvert \psi \rangle \xrightarrow{\text{measure}} \frac{\lvert x \rangle \langle x \mid \psi \rangle}{\sqrt{\Pr(x)}}
$$

## Common Gates

$$
X =
\begin{bmatrix}
0 & 1 \\
1 & 0
\end{bmatrix}
$$

$$
Y =
\begin{bmatrix}
0 & -i \\
i & 0
\end{bmatrix}
$$

$$
Z =
\begin{bmatrix}
1 & 0 \\
0 & -1
\end{bmatrix}
$$

$$
H = \frac{1}{\sqrt{2}}
\begin{bmatrix}
1 & 1 \\
1 & -1
\end{bmatrix}
$$

$$
S =
\begin{bmatrix}
1 & 0 \\
0 & i
\end{bmatrix}
$$

$$
T =
\begin{bmatrix}
1 & 0 \\
0 & e^{i\pi/4}
\end{bmatrix}
$$

$$
\mathrm{CNOT} =
\begin{bmatrix}
1 & 0 & 0 & 0 \\
0 & 1 & 0 & 0 \\
0 & 0 & 0 & 1 \\
0 & 0 & 1 & 0
\end{bmatrix}
$$
