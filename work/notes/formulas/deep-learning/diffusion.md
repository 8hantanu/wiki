# Diffusion

## Gaussian Noise Basics

$$
\epsilon \sim \mathcal{N}(0, \mathbf{I})
$$

$$
\mathbf{x} = \mu + \sigma \epsilon
$$

$$
\mathcal{N}(\mathbf{x}; \mu, \Sigma)
$$

## Forward Diffusion Process

$$
q(\mathbf{x}_t \mid \mathbf{x}_{t-1}) = \mathcal{N}\left(\mathbf{x}_t; \sqrt{1-\beta_t}\mathbf{x}_{t-1}, \beta_t \mathbf{I}\right)
$$

$$
\alpha_t = 1 - \beta_t
$$

$$
\bar{\alpha}_t = \prod_{s=1}^{t} \alpha_s
$$

$$
q(\mathbf{x}_t \mid \mathbf{x}_0) = \mathcal{N}\left(\mathbf{x}_t; \sqrt{\bar{\alpha}_t}\mathbf{x}_0, (1-\bar{\alpha}_t)\mathbf{I}\right)
$$

$$
\mathbf{x}_t = \sqrt{\bar{\alpha}_t}\mathbf{x}_0 + \sqrt{1-\bar{\alpha}_t}\epsilon
$$

## Reverse Denoising Process

$$
p_\theta(\mathbf{x}_{t-1} \mid \mathbf{x}_t) = \mathcal{N}(\mathbf{x}_{t-1}; \mu_\theta(\mathbf{x}_t, t), \Sigma_\theta(\mathbf{x}_t, t))
$$

$$
\mu_\theta(\mathbf{x}_t, t) =
\frac{1}{\sqrt{\alpha_t}}
\left(
\mathbf{x}_t -
\frac{\beta_t}{\sqrt{1-\bar{\alpha}_t}} \epsilon_\theta(\mathbf{x}_t, t)
\right)
$$

## Training Objective

$$
\mathcal{L}_{\mathrm{simple}} =
\mathbb{E}_{\mathbf{x}_0, \epsilon, t}
\left[
\left\lVert
\epsilon - \epsilon_\theta(\mathbf{x}_t, t)
\right\rVert_2^2
\right]
$$

## Sampling Step

$$
\mathbf{x}_{t-1} =
\frac{1}{\sqrt{\alpha_t}}
\left(
\mathbf{x}_t -
\frac{\beta_t}{\sqrt{1-\bar{\alpha}_t}} \epsilon_\theta(\mathbf{x}_t, t)
\right)
+
\sigma_t \mathbf{z}
$$

$$
\mathbf{z} \sim \mathcal{N}(0, \mathbf{I}), \quad t > 1
$$

## Classifier-Free Guidance

$$
\hat{\epsilon}_{\mathrm{cfg}}(\mathbf{x}_t, t, c) =
\epsilon_\theta(\mathbf{x}_t, t, \varnothing)
+
w \left(
\epsilon_\theta(\mathbf{x}_t, t, c) -
\epsilon_\theta(\mathbf{x}_t, t, \varnothing)
\right)
$$

$$
w \geq 1
$$
