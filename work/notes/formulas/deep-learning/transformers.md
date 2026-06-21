# Transformers

## Attention

### QKV Projections

$$
\mathbf{Q} = \mathbf{X}\mathbf{W}_Q, \quad \mathbf{K} = \mathbf{X}\mathbf{W}_K, \quad \mathbf{V} = \mathbf{X}\mathbf{W}_V
$$

### Scaled Dot-Product Attention

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

### FlashAttention

$$
\mathbf{S}_i = \frac{\mathbf{Q}\mathbf{K}_i^\top}{\sqrt{d_k}} \quad (\text{block } i \text{ of } \mathbf{K}, \mathbf{V})
$$

$$
m_i = \max(m_{i-1}, \max_j \mathbf{S}_{i,j})
$$

$$
\ell_i = e^{m_{i-1}-m_i}\ell_{i-1} + \sum_j e^{\mathbf{S}_{i,j}-m_i}
$$

$$
\mathbf{O}_i = e^{m_{i-1}-m_i}\mathbf{O}_{i-1} + e^{\mathbf{S}_i - m_i}\mathbf{V}_i
$$

$$
\mathbf{O} = \mathbf{O}_T / \ell_T \quad (\text{after the last block } T\text{, full } N\times N \text{ matrix never materialized})
$$

### QK Normalization

$$
\hat{\mathbf{q}}_i = \frac{\mathbf{q}_i}{\lVert \mathbf{q}_i \rVert_2}, \quad \hat{\mathbf{k}}_j = \frac{\mathbf{k}_j}{\lVert \mathbf{k}_j \rVert_2}
$$

$$
\mathrm{Attn}(\hat{\mathbf{Q}}, \hat{\mathbf{K}}, \mathbf{V}) = \mathrm{softmax}\left(\frac{\hat{\mathbf{Q}}\hat{\mathbf{K}}^\top}{\sqrt{d_k}}\right)\mathbf{V}
$$

### Differential Attention

$$
\mathrm{DiffAttn}(\mathbf{X}) = \left(\mathrm{softmax}\left(\frac{\mathbf{Q}_1\mathbf{K}_1^\top}{\sqrt{d_k}}\right) - \lambda \, \mathrm{softmax}\left(\frac{\mathbf{Q}_2\mathbf{K}_2^\top}{\sqrt{d_k}}\right)\right)\mathbf{V}
$$

## Positional Encoding

### RoPE

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

### YaRN

$$
s = \frac{L'}{L}, \quad b' = b \cdot s^{\frac{d}{d-2}}
$$

$$
\theta_i' = (b')^{-2i/d}
$$

### ALiBi

$$
\mathrm{ALiBi}(\mathbf{q}_i, \mathbf{k}_j) = \frac{\mathbf{q}_i \mathbf{k}_j^\top}{\sqrt{d_k}} - m \cdot (i - j)
$$

### NoPE

$$
\mathbf{q}_i = \mathbf{x}_i \mathbf{W}_Q, \quad \mathbf{k}_j = \mathbf{x}_j \mathbf{W}_K \quad (\text{no positional term added})
$$

## KV Cache & Efficient Attention

### KV Cache

$$
\mathbf{K}_{1:t} = \mathrm{Concat}(\mathbf{K}_{1:t-1}, \mathbf{k}_t)
$$

$$
\mathbf{V}_{1:t} = \mathrm{Concat}(\mathbf{V}_{1:t-1}, \mathbf{v}_t)
$$

$$
\mathbf{o}_t = \mathrm{softmax}\left(\frac{\mathbf{q}_t \mathbf{K}_{1:t}^\top}{\sqrt{d_k}}\right)\mathbf{V}_{1:t}
$$

### MQA

$$
\mathrm{head}_i = \mathrm{Attn}(\mathbf{Q}_i, \mathbf{K}, \mathbf{V}) \quad (\text{single } \mathbf{K}, \mathbf{V} \text{ shared across all heads})
$$

### GQA

$$
\mathrm{head}_i = \mathrm{Attn}(\mathbf{Q}_i, \mathbf{K}_{\lceil i / g \rceil}, \mathbf{V}_{\lceil i / g \rceil})
$$

### MLA

$$
\mathbf{c}_t = \mathbf{x}_t \mathbf{W}_{DKV} \in \mathbb{R}^{d_c}, \quad d_c \ll d
$$

$$
\mathbf{k}_t = \mathbf{c}_t \mathbf{W}_{UK}, \quad \mathbf{v}_t = \mathbf{c}_t \mathbf{W}_{UV} \quad (\text{cache only } \mathbf{c}_t)
$$

### YOCO

$$
\mathbf{K}, \mathbf{V} = \mathrm{SelfDecoder}(\mathbf{X}) \quad (\text{computed once})
$$

$$
\mathbf{H}^{(l)} = \mathbf{H}^{(l-1)} + \mathrm{CrossAttn}(\mathbf{Q}^{(l)}, \mathbf{K}, \mathbf{V}) \quad (\text{reused by every cross-decoder layer})
$$

### SWA

$$
\mathrm{SWA}(\mathbf{Q}, \mathbf{K}, \mathbf{V})_t = \mathrm{softmax}\left(\frac{\mathbf{q}_t \mathbf{K}_{t-w:t}^\top}{\sqrt{d_k}}\right)\mathbf{V}_{t-w:t}
$$

### NSA

$$
\mathrm{NSA}(\mathbf{x}_t) = \sum_{c \,\in\, \{\mathrm{cmp},\, \mathrm{slc},\, \mathrm{win}\}} g_t^c \cdot \mathrm{Attn}(\mathbf{q}_t, \mathbf{K}_t^c, \mathbf{V}_t^c)
$$

### Infini-Attention

$$
\mathbf{M}_s = \mathbf{M}_{s-1} + \phi(\mathbf{K}_s)^\top \mathbf{V}_s \quad (\text{compressive memory update})
$$

$$
\mathbf{o}_t = \alpha \cdot \mathrm{Attn}(\mathbf{q}_t, \mathbf{K}_s, \mathbf{V}_s) + (1-\alpha) \cdot \phi(\mathbf{q}_t)\mathbf{M}_{s-1}
$$

## Transformer Block & MoE

### Transformer Block

$$
\tilde{\mathbf{H}}^{(l)} = \mathbf{H}^{(l)} + \mathrm{MHA}(\mathrm{RMSNorm}(\mathbf{H}^{(l)}))
$$

$$
\mathbf{H}^{(l+1)} = \tilde{\mathbf{H}}^{(l)} + \mathrm{FFN}(\mathrm{RMSNorm}(\tilde{\mathbf{H}}^{(l)}))
$$

### MoE

$$
g(\mathbf{x}) = \mathrm{TopK}(\mathrm{softmax}(\mathbf{x}\mathbf{W}_g))
$$

$$
\mathrm{MoE}(\mathbf{x}) = \sum_{i \in g(\mathbf{x})} g_i(\mathbf{x}) \, \mathrm{FFN}_i(\mathbf{x})
$$

### Load-Balancing Loss

$$
\mathcal{L}_{\mathrm{aux}} = N \sum_{i=1}^{N} f_i \, P_i
$$

### Expert-Choice Routing

$$
g(\mathbf{X}) = \mathrm{TopK}_{\text{tokens}}\!\left(\mathrm{softmax}(\mathbf{X}\mathbf{W}_g)^\top\right)
$$

### Shared Experts

$$
\mathrm{MoE}(\mathbf{x}) = \sum_{j=1}^{N_s} \mathrm{FFN}_j^{\mathrm{shared}}(\mathbf{x}) + \sum_{i \,\in\, g(\mathbf{x})} g_i(\mathbf{x}) \, \mathrm{FFN}_i^{\mathrm{routed}}(\mathbf{x})
$$

### Mixture-of-Depths

$$
r_t = \sigma(\mathbf{h}_t \mathbf{w}_r)
$$

$$
\mathbf{h}_t^{(l+1)} =
\begin{cases}
\mathbf{h}_t^{(l)} + r_t \cdot f(\mathbf{h}_t^{(l)}) & t \in \mathrm{TopK}(r) \\
\mathbf{h}_t^{(l)} & \text{otherwise}
\end{cases}
$$

## Decoding

### Speculative Decoding

$$
p_{\mathrm{accept}}(x) = \min\left(1, \frac{p_\theta(x)}{q_\phi(x)}\right)
$$

$$
p_{\mathrm{resample}}(x) \propto \max\bigl(0,\ p_\theta(x) - q_\phi(x)\bigr)
$$

### MTP

$$
p(x_{t+1:t+k} \mid x_{\le t}) = \prod_{j=1}^{k} p_\theta(x_{t+j} \mid \mathbf{H}_t)
$$

$$
\mathcal{L}_{\mathrm{MTP}} = - \sum_{t} \sum_{j=1}^{k} \log p_\theta(x_{t+j} \mid \mathbf{H}_t)
$$
