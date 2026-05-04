# Transformers

## QKV Projections

$$
\mathbf{Q} = \mathbf{X}\mathbf{W}_Q, \quad \mathbf{K} = \mathbf{X}\mathbf{W}_K, \quad \mathbf{V} = \mathbf{X}\mathbf{W}_V
$$

## Attention

$$
\mathrm{Attn}(\mathbf{Q}, \mathbf{K}, \mathbf{V}) = \mathrm{softmax}\left(\frac{\mathbf{Q}\mathbf{K}^\top}{\sqrt{d_k}}\right)\mathbf{V}
$$

$$
\mathrm{CausalAttn}(\mathbf{Q}, \mathbf{K}, \mathbf{V}) = \mathrm{softmax}\left(\frac{\mathbf{Q}\mathbf{K}^\top + \mathbf{M}}{\sqrt{d_k}}\right)\mathbf{V}
$$

$$
\mathrm{head}_i = \mathrm{Attn}(\mathbf{Q}_i, \mathbf{K}_i, \mathbf{V}_i)
$$

$$
\mathrm{MHA}(\mathbf{X}) = \mathrm{Concat}(\mathrm{head}_1, \dots, \mathrm{head}_h)\mathbf{W}_O
$$

## Positional Encoding

$$
\theta_i = 10000^{-2i/d}
$$

$$
\begin{align}
\mathrm{RoPE}(x_{2i}, x_{2i+1}, m) =
\big(
x_{2i}\cos(m\theta_i) - x_{2i+1}\sin(m\theta_i), \\
x_{2i}\sin(m\theta_i) + x_{2i+1}\cos(m\theta_i)
\big)
\end{align}
$$

## KV Cache

$$
\mathbf{K}_{1:t} = \mathrm{Concat}(\mathbf{K}_{1:t-1}, \mathbf{k}_t)
$$

$$
\mathbf{V}_{1:t} = \mathrm{Concat}(\mathbf{V}_{1:t-1}, \mathbf{v}_t)
$$

$$
\mathbf{o}_t = \mathrm{softmax}\left(\frac{\mathbf{q}_t \mathbf{K}_{1:t}^\top}{\sqrt{d_k}}\right)\mathbf{V}_{1:t}
$$

## Transformer Block

$$
\tilde{\mathbf{H}}^{(l)} = \mathbf{H}^{(l)} + \mathrm{MHA}(\mathrm{RMSNorm}(\mathbf{H}^{(l)}))
$$

$$
\mathbf{H}^{(l+1)} = \tilde{\mathbf{H}}^{(l)} + \mathrm{FFN}(\mathrm{RMSNorm}(\tilde{\mathbf{H}}^{(l)}))
$$
