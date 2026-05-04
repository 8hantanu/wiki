# Quantization

## Scalar Quantization

$$
q = \mathrm{clip}\left(\mathrm{round}\left(\frac{x}{s}\right) + z, q_{\min}, q_{\max}\right)
$$

$$
\hat{x} = s (q - z)
$$

$$
s = \frac{x_{\max} - x_{\min}}{q_{\max} - q_{\min}}, \quad z = \mathrm{round}\left(q_{\min} - \frac{x_{\min}}{s}\right)
$$

$$
s_{\mathrm{sym}} = \frac{\max |x|}{2^{b-1} - 1}
$$

$$
q_{\mathrm{sym}} = \mathrm{clip}\left(\mathrm{round}\left(\frac{x}{s_{\mathrm{sym}}}\right), -(2^{b-1}-1), 2^{b-1}-1\right)
$$

## QJL

$$
H_S(\mathbf{k}) = \mathrm{sign}(S \mathbf{k})
$$

$$
\mathrm{Prod}_{\mathrm{QJL}}(\mathbf{q}, \mathbf{k}) =
\sqrt{\frac{\pi}{2}} \cdot \frac{\lVert \mathbf{k} \rVert_2}{m}
\cdot
\left\langle S\mathbf{q}, H_S(\mathbf{k}) \right\rangle
$$

## PolarQuant

$$
\mathbf{y} = R \mathbf{x}
$$

$$
r = \lVert \mathbf{y} \rVert_2
$$

$$
\theta_i = \arctan\left(
\frac{\sqrt{\sum_{j=i+1}^{d} y_j^2}}{y_i}
\right), \quad i = 1, \dots, d-1
$$

$$
\mathbf{x} \approx R^\top \, \mathrm{PolarDecode}(r, \hat{\theta}_1, \dots, \hat{\theta}_{d-1})
$$

## TurboQuant

$$
\mathbf{y} = R \mathbf{x}
$$

$$
\hat{\mathbf{y}}_{\mathrm{mse}} = Q_{\mathrm{MSE}}(\mathbf{y})
$$

$$
\mathbf{e} = \mathbf{y} - \hat{\mathbf{y}}_{\mathrm{mse}}
$$

$$
\mathbf{b} = \mathrm{sign}(S \mathbf{e})
$$

$$
\left\langle \mathbf{q}, \mathbf{x} \right\rangle
\approx
\left\langle R\mathbf{q}, \hat{\mathbf{y}}_{\mathrm{mse}} \right\rangle
+
\sqrt{\frac{\pi}{2}} \cdot \frac{\lVert \mathbf{e} \rVert_2}{m}
\cdot
\left\langle S(R\mathbf{q}), \mathbf{b} \right\rangle
$$
