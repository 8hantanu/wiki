# Mamba

## State Space Update

$$
\mathbf{h}_t = \mathbf{A}_t \mathbf{h}_{t-1} + \mathbf{B}_t \mathbf{x}_t
$$

$$
\mathbf{y}_t = \mathbf{C}_t \mathbf{h}_t + \mathbf{D}\mathbf{x}_t
$$

## Input-Dependent Dynamics

$$
\mathbf{A}_t = \exp(\Delta_t \mathbf{A})
$$

$$
\mathbf{B}_t = (\Delta_t \mathbf{A})^{-1} \left(\exp(\Delta_t \mathbf{A}) - \mathbf{I}\right)\Delta_t \mathbf{B}
$$
