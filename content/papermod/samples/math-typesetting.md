---
author: Hugo Authors
title: Math Typesetting
date: 2019-03-08
description: A brief guide to setup KaTeX
math: true
ShowBreadCrumbs: false
---

Mathematical notation in a Hugo project can be enabled by using third party JavaScript libraries.

<!--more-->

In this example we will be using [KaTeX](https://katex.org/)

To enable KaTeX on your page, set `math: true` in the front matter.
Then use standard LaTeX delimiters:
- For inline math: $...$
- For block math: $$...$$

### Examples

Inline math: $\varphi = \dfrac{1+\sqrt5}{2}= 1.6180339887…$

Block math:

$$
\varphi = 1+\frac{1} {1+\frac{1} {1+\frac{1} {1+\cdots} } }
$$

More complex equations:

$$
F(\omega) = \int_{-\infty}^{\infty} f(t)e^{-i\omega t}dt
$$

And the inverse transform is:

$$f(t) = \frac{1}{2\pi}\int_{-\infty}^{\infty} F(\omega)e^{i\omega t}d\omega$$

One powerful property is that differentiation in the time domain corresponds to multiplication by $i\omega$ in the frequency domain:

$$\mathcal{F}\left\{\frac{df}{dt}\right\} = i\omega F(\omega)$$

## The Heat Equation

The heat equation in one dimension is:

$$\frac{\partial u}{\partial t} = \alpha \frac{\partial^2 u}{\partial x^2}$$

where $u(x,t)$ is the temperature at position $x$ and time $t$, and $\alpha$ is the thermal diffusivity.

The general solution can be written using Fourier series:

$$u(x,t) = \sum_{n=1}^{\infty} B_n e^{-\alpha n^2 \pi^2 t} \sin(n\pi x)$$

where $B_n$ are constants determined by the initial conditions.

I hope this post helps you test whether your site can properly render both inline math like $E = mc^2$ and block equations like:

$$\oint_C \vec{F} \cdot d\vec{r} = \iint_S (\nabla \times \vec{F}) \cdot d\vec{S}$$

This mix of inline and block mathematics should give you a good test case for your website's LaTeX rendering capabilities!