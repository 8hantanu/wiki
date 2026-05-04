# Quantum Algorithms

## Deutsch-Jozsa

$$
U_f \lvert x, y \rangle = \lvert x, y \oplus f(x) \rangle
$$

$$
H^{\otimes n} \lvert 0^n \rangle = \frac{1}{\sqrt{2^n}} \sum_{x \in \{0,1\}^n} \lvert x \rangle
$$

$$
\frac{1}{\sqrt{2^n}} \sum_{x \in \{0,1\}^n} (-1)^{f(x)} \lvert x \rangle
$$

## Grover

$$
\lvert s \rangle = \frac{1}{\sqrt{N}} \sum_{x=0}^{N-1} \lvert x \rangle
$$

$$
O_f \lvert x \rangle = (-1)^{f(x)} \lvert x \rangle
$$

$$
D = 2 \lvert s \rangle \langle s \rvert - I
$$

$$
G = D O_f
$$

$$
r \approx \frac{\pi}{4}\sqrt{\frac{N}{M}}
$$

## Quantum Fourier Transform

$$
\mathrm{QFT}\lvert x \rangle = \frac{1}{\sqrt{N}} \sum_{y=0}^{N-1} e^{2\pi ixy/N} \lvert y \rangle
$$

$$
\mathrm{QFT}^{-1}\lvert y \rangle = \frac{1}{\sqrt{N}} \sum_{x=0}^{N-1} e^{-2\pi ixy/N} \lvert x \rangle
$$

## Shor

$$
f(x) = a^x \bmod N
$$

$$
f(x+r) = f(x)
$$

$$
\mathrm{QFT}\left(\frac{1}{\sqrt{Q}} \sum_{x=0}^{Q-1} \lvert x \rangle \lvert f(x) \rangle \right)
$$
