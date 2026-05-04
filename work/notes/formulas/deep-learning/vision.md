# Vision

## Image Tensor Basics

$$
\mathbf{X} \in \mathbb{R}^{H \times W \times C}
$$

$$
\mathbf{X} \in \mathbb{R}^{C \times H \times W}
$$

$$
\mathrm{vec}(\mathbf{X}) \in \mathbb{R}^{HWC}
$$

## Convolution

$$
Y_{i,j} = \sum_{u=0}^{k_h-1} \sum_{v=0}^{k_w-1} K_{u,v} X_{i+u, j+v}
$$

$$
Y_{o,i,j} = \sum_{c=1}^{C_{\mathrm{in}}} \sum_{u=0}^{k_h-1} \sum_{v=0}^{k_w-1}
K_{o,c,u,v} X_{c, i+u, j+v}
$$

$$
H_{\mathrm{out}} = \left\lfloor \frac{H + 2p_h - k_h}{s_h} \right\rfloor + 1
$$

$$
W_{\mathrm{out}} = \left\lfloor \frac{W + 2p_w - k_w}{s_w} \right\rfloor + 1
$$

## Pooling

$$
Y_{i,j}^{\mathrm{max}} = \max_{0 \leq u < k_h,\ 0 \leq v < k_w} X_{i+u, j+v}
$$

$$
Y_{i,j}^{\mathrm{avg}} = \frac{1}{k_h k_w} \sum_{u=0}^{k_h-1} \sum_{v=0}^{k_w-1} X_{i+u, j+v}
$$

$$
H_{\mathrm{out}} = \left\lfloor \frac{H + 2p_h - k_h}{s_h} \right\rfloor + 1, \quad
W_{\mathrm{out}} = \left\lfloor \frac{W + 2p_w - k_w}{s_w} \right\rfloor + 1
$$

## Vision Losses

$$
\mathcal{L}_{\mathrm{CE}} = - \sum_{i=1}^{K} y_i \log \hat{y}_i
$$

$$
\mathcal{L}_{\mathrm{BCE}} = - \sum_{i=1}^{K} \left( y_i \log \hat{y}_i + (1-y_i)\log(1-\hat{y}_i) \right)
$$

$$
\mathcal{L}_{\mathrm{MSE}} = \frac{1}{N} \sum_{i=1}^{N} (y_i - \hat{y}_i)^2
$$

## Patch Embedding

$$
N = \frac{H W}{P^2}
$$

$$
\mathbf{x}_p^{(n)} \in \mathbb{R}^{P^2 C}, \quad n = 1, \dots, N
$$

$$
\mathbf{z}_0^{(n)} = \mathbf{x}_p^{(n)} \mathbf{E}
$$

$$
\mathbf{Z}_0 = [\mathbf{x}_{\mathrm{cls}}; \mathbf{z}_0^{(1)}; \dots; \mathbf{z}_0^{(N)}] + \mathbf{E}_{\mathrm{pos}}
$$

## Vision Transformer Basics

$$
\mathbf{Z}'_\ell = \mathbf{Z}_{\ell-1} + \mathrm{MHA}(\mathrm{LayerNorm}(\mathbf{Z}_{\ell-1}))
$$

$$
\mathbf{Z}_\ell = \mathbf{Z}'_\ell + \mathrm{FFN}(\mathrm{LayerNorm}(\mathbf{Z}'_\ell))
$$

$$
\hat{\mathbf{y}} = \mathrm{softmax}(\mathbf{W}\mathbf{z}_{L}^{\mathrm{cls}})
$$
