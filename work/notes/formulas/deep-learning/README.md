# Deep Learning

These are the common building blocks that show up before architecture-specific details.

- [Transformers](transformers)
- [Mamba](mamba)
- [Quantization](quantization)
- [Vision](vision)
- [Diffusion](diffusion)

## Autoregressive Modeling

$$
p(x_{1:T}) = \prod_{t=1}^{T} p(x_t \mid x_{<t})
$$

$$
\mathcal{L}_{\mathrm{NLL}} = - \sum_{t=1}^{T} \log p_\theta(x_t \mid x_{<t})
$$

$$
\mathcal{L}_{\mathrm{CE}} = - \sum_{i=1}^{V} y_i \log \hat{y}_i
$$

$$
\mathrm{PPL} = \exp \left( \frac{1}{T} \mathcal{L}_{\mathrm{NLL}} \right)
$$

## Normalization

$$
\mathrm{LayerNorm}(\mathbf{x}) = \gamma \odot \frac{\mathbf{x} - \mu}{\sqrt{\sigma^2 + \epsilon}} + \beta
$$

$$
\mathrm{RMSNorm}(\mathbf{x}) = \gamma \odot \frac{\mathbf{x}}{\sqrt{\frac{1}{d}\sum_{i=1}^{d} x_i^2 + \epsilon}}
$$

## Feed Forward

$$
\mathrm{FFN}(\mathbf{x}) = \phi(\mathbf{x}\mathbf{W}_1 + \mathbf{b}_1)\mathbf{W}_2 + \mathbf{b}_2
$$

$$
\mathrm{SwiGLU}(\mathbf{x}) = \left(\mathrm{SiLU}(\mathbf{x}\mathbf{W}_1) \odot \mathbf{x}\mathbf{W}_2\right)\mathbf{W}_3
$$

$$
\mathrm{SiLU}(x) = x \, \sigma(x)
$$

## Activations

$$
\sigma(x) = \frac{1}{1 + e^{-x}}
$$

$$
\tanh(x) = \frac{e^x - e^{-x}}{e^x + e^{-x}}
$$

$$
\mathrm{ReLU}(x) = \max(0, x)
$$

$$
\mathrm{softmax}(x_i) = \frac{e^{x_i}}{\sum_j e^{x_j}}
$$
